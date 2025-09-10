`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

import axi4_task::*;

initial begin
    string wave_file;
    int tmp;
    $timeformat(-9, 2, " ns", 16);  // set time format to allow #?ns etc.
    if ($test$plusargs("WAVE_FILE"))
        tmp = $value$plusargs("WAVE_FILE=%s", wave_file);
    else
        wave_file = "wave.vcd";
    $dumpfile(wave_file);
    $dumpvars(0, top);
end

real clk_period_axi = 1000/333.25; // 333.25MHz
real clk_period_axilite = 10.0; // 100MHz
real clk_period_rf = 1000/500;  // 500MHz


logic axi_aclk, axi_rstb;
logic axilite_clk, axilite_rstb;
logic rf_clk[3], rf_rstb[3];
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
    rf_clk[0] = 1'b0;
    forever #(clk_period_rf/2) rf_clk[0] = ~rf_clk[0];
end

initial begin
    rf_rstb[0] = 1'b0;
    #(clk_period_rf*10) rf_rstb[0] = 1'b1;
end

initial begin
    rf_clk[1] = 1'b0;
    #1;
    forever #(clk_period_rf/2) rf_clk[1] = ~rf_clk[1];
end

initial begin
    rf_rstb[1] = 1'b0;
    #2;
    #(clk_period_rf*10) rf_rstb[1] = 1'b1;
end

initial begin
    rf_clk[2] = 1'b0;
    forever #(clk_period_rf/2) rf_clk[2] = ~rf_clk[2];
end

initial begin
    rf_rstb[2] = 1'b0;
    #(clk_period_rf*10) rf_rstb[2] = 1'b1;
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
AXI4 #(4, 40, 256)          pl_m_axi_rd();
AXI4 #(4, 40, 128)          ps_m_axi_wr();
AXI4Lite                    axil_regs();
AXI4Lite                    axil_rf_ctrl();
RFSOC_REG                   regs();
STREAM #(128)               adc_stream[6]();

AXI4 #(.DATA_WIDTH(128))    bram_wr_axi();

reg_map u_reg_map (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    // 显式指定modport连接
    .s_axil                 (axil_regs),
    .regs                   (regs)
);

wire        pl_clk = axi_aclk;
wire        pl_rstb = axi_rstb;


rfsoc_fpga u_rfsoc_fpga (
    .ps_clk             (axi_aclk),
    .ps_rstb            (axi_rstb),
    .axilite_clk        (axilite_clk),
    .axilite_rstb       (axilite_rstb),
    .pl_m_axi_rd        (pl_m_axi_rd),
    .ps_m_axi_wr        (bram_wr_axi),
    .ps_s_axilite       (axil_regs),
    .adc_clk_p          ('0),           // 未连接，仿真可用'0
    .adc_clk_n          ('0),
    .dac_clk_p          ('0),
    .dac_clk_n          ('0),
    .rf_sysref_in_p     ('0),
    .rf_sysref_in_n     ('0),
    .gt_refclk_p        ('0),
    .gt_refclk_n        ('0),
    .gt_txp             (),             // 未连�?
    .gt_txn             (),
    .vin_p              ('0),
    .vin_n              ('0),
    .vout_p             (),
    .vout_n             (),
    .c0_init_calib_complete ('1)        // 仿真默认ready
);


// here need a AXI4 BRAM
axi_bram_ctrl_128b u_bram_ctrl_128b (
    .s_axi_aclk                 (axi_aclk),         // input wire s_axi_aclk
    .s_axi_aresetn              (axi_rstb),         // input wire s_axi_aresetn
    .s_axi_awid                 (bram_wr_axi.awid),        // input wire [3 : 0] s_axi_awid
    .s_axi_awaddr               (bram_wr_axi.awaddr[16:0]),    // input wire [17 : 0] s_axi_awaddr
    .s_axi_awlen                (bram_wr_axi.awlen),      // input wire [7 : 0] s_axi_awlen
    .s_axi_awsize               (bram_wr_axi.awsize),    // input wire [2 : 0] s_axi_awsize
    .s_axi_awburst              (bram_wr_axi.awburst),  // input wire [1 : 0] s_axi_awburst
    .s_axi_awlock               (bram_wr_axi.awlock),    // input wire s_axi_awlock
    .s_axi_awcache              (bram_wr_axi.awcache),  // input wire [3 : 0] s_axi_awcache
    .s_axi_awprot               (bram_wr_axi.awprot),    // input wire [2 : 0] s_axi_awprot
    .s_axi_awvalid              (bram_wr_axi.awvalid),  // input wire s_axi_awvalid
    .s_axi_awready              (bram_wr_axi.awready),  // output wire s_axi_awready
    .s_axi_wdata                (bram_wr_axi.wdata),      // input wire [255 : 0] s_axi_wdata
    .s_axi_wstrb                (bram_wr_axi.wstrb),      // input wire [31 : 0] s_axi_wstrb
    .s_axi_wlast                (bram_wr_axi.wlast),      // input wire s_axi_wlast
    .s_axi_wvalid               (bram_wr_axi.wvalid),    // input wire s_axi_wvalid
    .s_axi_wready               (bram_wr_axi.wready),    // output wire s_axi_wready
    .s_axi_bid                  (bram_wr_axi.bid),          // output wire [3 : 0] s_axi_bid
    .s_axi_bresp                (bram_wr_axi.bresp),      // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid               (bram_wr_axi.bvalid),    // output wire s_axi_bvalid
    .s_axi_bready               (bram_wr_axi.bready),    // input wire s_axi_bready
    .s_axi_arid                 (bram_wr_axi.arid),        // input wire [3 : 0] s_axi_arid
    .s_axi_araddr               (bram_wr_axi.araddr[16:0]),    // input wire [17 : 0] s_axi_araddr
    .s_axi_arlen                (bram_wr_axi.arlen),      // input wire [7 : 0] s_axi_arlen
    .s_axi_arsize               (bram_wr_axi.arsize),    // input wire [2 : 0] s_axi_arsize
    .s_axi_arburst              (bram_wr_axi.arburst),  // input wire [1 : 0] s_axi_arburst
    .s_axi_arlock               (bram_wr_axi.arlock),    // input wire s_axi_arlock
    .s_axi_arcache              (bram_wr_axi.arcache),  // input wire [3 : 0] s_axi_arcache
    .s_axi_arprot               (bram_wr_axi.arprot),    // input wire [2 : 0] s_axi_arprot
    .s_axi_arvalid              (bram_wr_axi.arvalid),  // input wire s_axi_arvalid
    .s_axi_arready              (bram_wr_axi.arready),  // output wire s_axi_arready
    .s_axi_rid                  (bram_wr_axi.rid),          // output wire [3 : 0] s_axi_rid
    .s_axi_rdata                (bram_wr_axi.rdata),      // output wire [255 : 0] s_axi_rdata
    .s_axi_rresp                (bram_wr_axi.rresp),      // output wire [1 : 0] s_axi_rresp
    .s_axi_rlast                (bram_wr_axi.rlast),      // output wire s_axi_rlast
    .s_axi_rvalid               (bram_wr_axi.rvalid),    // output wire s_axi_rvalid
    .s_axi_rready               (bram_wr_axi.rready)    // input wire s_axi_rready
);

task automatic check_adc_data_path(bit [127:0] exp_data[6][$], ref bit [127:0] real_data[$]);
    bit [127:0] exp_val, real_val;
    bit [31:0] exp_val_32b;
    bit [7:0] real_val_8b, exp_val_8b;
    int data_size;
    data_size = real_data.size();
    
    for (int i = 0; i < data_size * 16; i++) begin
        real_val_8b = real_data[i/16][i[3:0]*8+:8];
        exp_val_32b = exp_data[i%6][i/24][(i/6%4)*32+:32];
        exp_val_8b = (exp_val_32b[31:24]+exp_val_32b[15:8]+1)>>1;
        if (real_val_8b != exp_val_8b) begin
            $display("ERROR: exp_data[%0d] = 0x%0h, real_data[%0d] = 0x%0h", i, exp_val_8b, i, real_val_8b);
        end else if(i<10 || i>data_size * 16 - 10) begin
            $display("INFO: exp_data[%0d] = 0x%0h, real_data[%0d] = 0x%0h", i, exp_val_8b, i, real_val_8b);
        end
    end
endtask


assign axi4_task::axi_aclk = axi_aclk;
assign axi4_task::axilite_clk = axilite_clk;


parameter PKG_NUM = 1000;

initial begin
    bit [127:0] tmp_data[6][$], exp_data[$], real_data[$];
    bit [127:0] val[6];
    bit [31:0] val_32b[6];
    bit [191:0] val_192b, val_reorder;
    bit op_done;
    bit [31:0] read_data, val0, val1;
    axi4_task::m_axi = bram_wr_axi;
    axi4_task::m_axil = axil_regs;
    axi4_task::axilite_reset();
    axi4_task::axi4_reset();

    @RST_DONE;
    repeat(500) @(posedge axilite_clk);
    // driver
    axi4_task::WriteReg(32'h8010_0000, 32'h1234_4321);              // start_addr
    axi4_task::WriteReg(32'h8010_000c, 32'h789a_a987);              // start_addr

    axi4_task::ReadReg(32'h14, val0);
    axi4_task::ReadReg(32'h14, val1);
    $display("addr = 0x8010_0000, val = 0x%0h" % val0);
    $display("addr = 0x8010_000c, val = 0x%0h" % val1);

    repeat(100) @(posedge axilite_clk);
    $finish;
end





endmodule

