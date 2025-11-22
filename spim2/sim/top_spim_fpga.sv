`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

import axi4_task_pkg::*;
glbl glbl();

real clk_period_axi = 2.0; // 500MHz
real clk_period_axilite = 10.0; // 100MHz


logic axi_aclk, axi_rstb;
logic axilite_clk, axilite_rstb;
event RST_DONE;

initial begin
    axi_aclk = 1'b0;
    forever #(clk_period_axi/2) axi_aclk = ~axi_aclk;
end

initial begin
    axi_rstb = 1'b0;
    #(clk_period_axi*10) axi_rstb = 1'b1;
end


initial begin
    axilite_clk = 1'b0;
    forever #(clk_period_axilite/2) axilite_clk = ~axilite_clk;
end

initial begin
    axilite_rstb = 1'b0;
    #(clk_period_axilite*10) axilite_rstb = 1'b1;
    -> RST_DONE;
    $display("[%t] Reset Done", $time);
end

// interface
// AXI4                pl_axi();
AXI4Lite            ps_s_axilite();
SPI_BUS             m_spi[9]();
logic [8:0]         spi_reset;

spim_fpga U_DUT(
    .SPI_SYSRST                 (spi_reset),
    .axilite_clk                (axilite_clk),
    .axilite_rstb               (axilite_rstb),
    .ps_axil                    (ps_s_axilite),
    .m_spi                      (m_spi)
);

wire [31:0] spim_ctrl_0 = top.U_DUT.regs.spim_ctrl[0];
wire        spim_trasfer_0 = top.U_DUT.regs.spim_transfer[0];
wire        spim_ctrl_pulse_0 = top.U_DUT.regs.spim_ctrl_pulse[0];
wire        spim_load_0 = top.U_DUT.regs.spim_load[0];
wire [15:0]  rd_data_0 = top.U_DUT.regs.rd_data[0];
wire        spi_done_0 = top.U_DUT.regs.spi_done[0];


assign m_spi[0].miso = m_spi[0].mosi;
assign m_spi[1].miso = m_spi[1].mosi;

task check_spi_data(input bit [31:0] tx_data[$], bit [31:0] rx_data0[$], bit [31:0] rx_data1[$]); 
    bit [31:0] exp_data, read_data0, read_data1;
    int check_err;
    int data_size;
    data_size = tx_data.size();
    assert(tx_data.size() == rx_data0.size()) else $error("tx_data.size() = %0d, rx_data0.size() = %0d", tx_data.size(), rx_data0.size());
    for(int i = 0; i < data_size; i++) begin
        exp_data = tx_data.pop_front();
        read_data0 = rx_data0.pop_front();
        read_data1 = rx_data1.pop_front();
        if (exp_data != read_data0 || exp_data != read_data1) begin
            $display("[%t] : ERROR: tx_data[%0d] = 0x%0h, read_data0[%0d] = 0x%0h, read_data1[%0d] = 0x%0h", $time, i, exp_data, i, read_data0, i, read_data1);
            check_err = 1;
        end else begin
            $display("[%t] : PASS: tx_data[%0d] = 0x%0h, read_data0[%0d] = 0x%0h, read_data1[%0d] = 0x%0h", $time, i, exp_data, i, read_data0, i, read_data1);
        end
    end
    if(check_err == 0)
        $display("[%t] : SPI data check pass", $time);
endtask


assign axi4_task_pkg::axi_aclk = axi_aclk;
assign axi4_task_pkg::axilite_clk = axilite_clk;

initial begin
    bit [31:0] val, read_data, op_done;
    bit [31:0] val0, val1;
    int test_max;
    bit [31:0] tx_data[$], rx_data0[$], rx_data1[$];
    bit [6:0] spi_id;
    bit [7:0] spi_addr;
    bit [15:0] spi_data;
    axi4_task_pkg::m_axil = ps_s_axilite;
    axi4_task_pkg::axilite_reset();
    @RST_DONE;
    repeat(100) @(posedge axilite_clk);
    test_max = $urandom_range(4, 4);
    fork begin
    for(int i = 0; i < test_max; i++) begin
        spi_id = $urandom();
        spi_addr = $urandom();
        spi_data = $urandom();
        val = {1'b1, spi_id, spi_addr, spi_data};
        $display("send spi write, id=0x%0x, addr=0x%0x, data = 0x%0x, val=0x%0x", spi_id, spi_addr, spi_data, val);
        tx_data.push_back(val);
        axi4_task_pkg::WriteReg(32'h4000_0000, val[31:0]);
        axi4_task_pkg::WriteReg(32'h4000_0004, val[31:0]);
    end
    axi4_task_pkg::WriteReg(32'h4000_0024, 32'h3);

    op_done = 0;
    while(op_done == 0) begin
        axi4_task_pkg::ReadReg(32'h4000_0104, val);
        if(val == 32'h1ff)
            op_done = 1;
        else
            repeat(100) @(posedge axilite_clk);
    end

    axi4_task_pkg::WriteReg(32'h4000_002c, 32'h3);
    repeat(100) @(posedge axilite_clk);
    axi4_task_pkg::WriteReg(32'h4000_002c, 32'h0);
    end join_none
    // check spi data

    fork : spi_write
        while(1) begin
            @(negedge m_spi[0].csn);
            val0 = 0;
            for(int j=0; j<4; j++) begin
                for(int i=0; i<8; i++) begin
                    @(posedge m_spi[0].sck);
                    val0 = (val0<<1) | m_spi[0].mosi;
                end
            end
            rx_data0.push_back(val0);
        $display("write spi data 0 = 0x%0h", val0);
        end
        while(1) begin
            @(negedge m_spi[1].csn);
            val1 = 0;
            for(int j=0; j<4; j++) begin
                for(int i=0; i<8; i++) begin
                    @(posedge m_spi[0].sck);
                    val1 = (val1<<1) | m_spi[0].mosi;
                end
            end
            rx_data1.push_back(val1);
            $display("write spi data 1 = 0x%0h", val1);
        end
    join_none

    wait(top.spi_reset[0] == 1'b1);

    check_spi_data(tx_data, rx_data0, rx_data1);
    tx_data.delete();
    rx_data0.delete();
    rx_data1.delete();
    disable spi_write;

    repeat(200) @(posedge axilite_clk);
    fork
    begin
        test_max = 1;
        for(int i = 0; i < test_max; i++) begin
            spi_id = $urandom();
            spi_addr = $urandom();
            spi_data = $urandom();
            val = {1'b0, spi_id, spi_addr, spi_data};
            $display("send spi read, id=0x%0x, addr=0x%0x, data = 0x%0x, val=0x%0x", spi_id, spi_addr, spi_data, val);
            tx_data.push_back(val);
            axi4_task_pkg::WriteReg(32'h4000_0000, val[31:0]);
            axi4_task_pkg::WriteReg(32'h4000_0004, val[31:0]);
        end
        axi4_task_pkg::WriteReg(32'h4000_0024, 32'h3);

        op_done = 0;
        while(op_done == 0) begin
            axi4_task_pkg::ReadReg(32'h4000_0104, val);
            if(val == 32'h1ff)
                op_done = 1;
            else
                repeat(100) @(posedge axilite_clk);
        end

        axi4_task_pkg::WriteReg(32'h4000_002c, 32'h3);
        repeat(100) @(posedge axilite_clk);
        axi4_task_pkg::WriteReg(32'h4000_002c, 32'h0);
    end
    // check spi data
    while(1) begin
        @(negedge m_spi[0].csn);
        val0 = 0;
        for(int j=0; j<4; j++) begin
            for(int i=0; i<8; i++) begin
                @(posedge m_spi[0].sck);
                val0 = (val0<<1) | m_spi[0].miso;
            end
        end
        rx_data0.push_back(val0);
        $display("read spi data 0 = 0x%0h", val0);
    end
    while(1) begin
        @(negedge m_spi[1].csn);
        val1 = 0;
        for(int j=0; j<4; j++) begin
            for(int i=0; i<8; i++) begin
                @(posedge m_spi[1].sck);
                val1 = (val1<<1) | m_spi[0].miso;
            end
        end
        rx_data1.push_back(val1);
        $display("read spi data 1 = 0x%0h", val1);
    end
    join_none

    wait(top.spi_reset[0] == 1'b1);

    check_spi_data(tx_data, rx_data0, rx_data1);


    repeat(1000) @(posedge axilite_clk);
    $finish;
end

initial begin
    string wave_file;
    int tmp;
    $timeformat(-9, 2, " ns", 16);  // set time format to allow #?ns etc.
    wave_file = "wave.vcd";
    $dumpfile(wave_file);
    $dumpvars(0, top);
end



endmodule

