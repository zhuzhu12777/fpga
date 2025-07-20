`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

import axi4_task_pkg::*;
glbl glbl();

real clk_period_axi = 2.0; // 500MHz
real clk_period_axilite = 5.0; // 200MHz


logic axi_aclk, axi_rstb; // 500MHz
logic axilite_clk, axilite_rstb; // 200MHz
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
SPI_BUS             m_spi[16]();
logic [15:0]        spi_load;

SPIM_FPGA U_DUT(
    .SPI_LOAD                   (spi_load),
    .axilite_clk                (axilite_clk),
    .axilite_rstb               (axilite_rstb),
    .ps_axil                    (ps_s_axilite),
    .m_spi                      (m_spi)
);


task check_spi_data(input bit [23:0] tx_data[$], bit [23:0] rx_data0[$], bit [23:0] rx_data1[$]); 
    bit [23:0] exp_data, read_data0, read_data1;
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
        end
    end
    if(check_err == 0)
        $display("[%t] : SPI data check pass", $time);
endtask


assign axi4_task_pkg::axi_aclk = axi_aclk;
assign axi4_task_pkg::axilite_clk = axilite_clk;

initial begin
    int val, read_data, op_done;
    int val0, val1;
    int test_max;
    bit [23:0] tx_data[$], rx_data0[$], rx_data1[$];
    bit [6:0] spi_id;
    bit [7:0] spi_addr;
    bit [7:0] spi_data;
    axi4_task_pkg::m_axil = ps_s_axilite;
    axi4_task_pkg::axilite_reset();
    @RST_DONE;
    repeat(100) @(posedge axilite_clk);
    test_max = $urandom_range(1, 10);
    fork begin
    for(int i = 0; i < test_max; i++) begin
        spi_id = $urandom();
        spi_addr = $urandom();
        spi_data = $urandom();
        val = {1'b0, spi_id, spi_addr, spi_data};
        tx_data.push_back(val);
        axi4_task_pkg::WriteReg(32'h8000_0000, val);
        axi4_task_pkg::WriteReg(32'h8000_0004, val);
        axi4_task_pkg::WriteReg(32'h8000_0040, 32'h3);
    end

    op_done = 0;
    while(op_done == 0) begin
        axi4_task_pkg::ReadReg(32'h8000_0104, val);
        if(val == 32'hffff)
            op_done = 1;
        else
            repeat(100) @(posedge axilite_clk);
    end

    axi4_task_pkg::WriteReg(32'h8000_0044, 32'h3);
    axi4_task_pkg::WriteReg(32'h8000_0044, 32'h0);
    end join_none

    // check spi data

    fork
        while(1) begin
            @(negedge m_spi[0].csn);
            val0 = 0;
            for(int j=0; j<3; j++) begin
                for(int i=0; i<8; i++) begin
                    @(posedge m_spi[0].sck);
                    val0 = (val0<<1) | m_spi[0].mosi;
                end
            end
            rx_data0.push_back(val0);
        end
        while(1) begin
            @(negedge m_spi[1].csn);
            val1 = 0;
            for(int j=0; j<3; j++) begin
                for(int i=0; i<8; i++) begin
                    @(posedge m_spi[0].sck);
                    val1 = (val1<<1) | m_spi[0].mosi;
                end
            end
            rx_data1.push_back(val1);
        end
    join_none

    wait(top.spi_load[0] == 1'b1);

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

