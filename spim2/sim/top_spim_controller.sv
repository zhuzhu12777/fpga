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
SPI_BUS             m_spi[16]();
logic [15:0]        spi_load;

// DUT signals
logic  [15:0] reg_rx_data;
logic         reg_rx_valid;
logic         fifo_overflow;
logic         spi_done;
bit    [55:0] reg_tx_data;
bit           reg_tx_valid;
bit           spim_transfer;

spim_controller U_DUT (
    .reg_rx_data   (reg_rx_data),
    .reg_rx_valid  (reg_rx_valid),
    .fifo_overflow (fifo_overflow),
    .spi_done      (spi_done),

    .clk           (axilite_clk),
    .rstb          (axilite_rstb),
    .div_n         ('d4),
    .reg_tx_data   (reg_tx_data),
    .reg_tx_valid  (reg_tx_valid),
    .spim_transfer (spim_transfer),
    .m_spi         (m_spi[0])
);

assign m_spi[0].miso = m_spi[0].mosi;
assign m_spi[1].miso = m_spi[1].mosi;

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
    bit [55:0] val, read_data, op_done;
    int test_max;
    bit [55:0] tx_data[$], rx_data0[$], rx_data1[$];
    bit [14:0] spi_id;
    bit [23:0] spi_addr;
    bit [15:0] spi_data;
    axi4_task_pkg::m_axil = ps_s_axilite;
    axi4_task_pkg::axilite_reset();
    @RST_DONE;
    repeat(100) @(posedge axilite_clk);
    test_max = $urandom_range(4, 4);
    for(int i = 0; i < test_max; i++) begin
        spi_id = $urandom();
        spi_addr = $urandom();
        spi_data = $urandom();
        val = {1'b1, spi_id, spi_addr, spi_data};
        $display("send spi write, id=0x%0x, addr=0x%0x, data = 0x%0x, val=0x%0x", spi_id, spi_addr, spi_data, val);
        tx_data.push_back(val);
        reg_tx_data <= val;
        reg_tx_valid <= 1'b1;
        @(posedge axilite_clk);
        reg_tx_valid <= 1'b0;
        @(posedge axilite_clk);
    end
    spim_transfer <= 1'b1;
    @(posedge axilite_clk);
    spim_transfer <= 1'b0;
    wait(spi_done);
    repeat(200) @(posedge axilite_clk);
    test_max = 1;
    for(int i = 0; i < test_max; i++) begin
        spi_id = $urandom();
        spi_addr = $urandom();
        spi_data = $urandom();
        val = {1'b0, spi_id, spi_addr, spi_data};
        $display("send spi read, id=0x%0x, addr=0x%0x, data = 0x%0x, val=0x%0x", spi_id, spi_addr, spi_data, val);
        tx_data.push_back(val);
        reg_tx_data <= val;
        reg_tx_valid <= 1'b1;
        @(posedge axilite_clk);
        reg_tx_valid <= 1'b0;
        @(posedge axilite_clk);
    end
    spim_transfer <= 1'b1;
    @(posedge axilite_clk);
    spim_transfer <= 1'b0;
    wait(spi_done);
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

