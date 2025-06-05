`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

import axi4_task::*;
glbl glbl();

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

real clk_period_axi = 2.0; // 500MHz
real clk_period_axilite = 10.0; // 100MHz
real clk_period_gt = 1000/187.5;  //187.5MHz

logic axi_aclk, axi_rstb; // 500MHz
logic axilite_clk, axilite_rstb; // 100MHz
logic gt_clk, gt_rstb;
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
    gt_clk = 1'b0;
    forever #(clk_period_gt/2) gt_clk = ~gt_clk;
end

initial begin
    gt_rstb = 1'b0;
    #(clk_period_gt*10) gt_rstb = 1'b1;
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
AXI4Lite                    ps_s_axilite();    
AXI4Lite                    axil_regs();
AXI4Lite                    axil_rf_ctrl();
RFSOC_REG                   regs();

// axilite crossbar to regs and rf_ctrl
// rf_ctrl: 0x0000_0000 ~ 0x000F_FFFF
// regs:  0x0010_0000 ~ 0x0010_FFFF
axilite_crossbar_0 u_axilite_crossbar (
    .aclk                   (axilite_clk),                      // input wire aclk
    .aresetn                (axilite_rstb),                     // input wire aresetn
    .s_axi_awaddr           (ps_s_axilite.awaddr                       ),    // input wire [31 : 0] s_axi_awaddr
    .s_axi_awprot           (ps_s_axilite.awprot                       ),    // input wire [2 : 0] s_axi_awprot
    .s_axi_awvalid          (ps_s_axilite.awvalid                      ),  // input wire [0 : 0] s_axi_awvalid
    .s_axi_awready          (ps_s_axilite.awready                      ),  // output wire [0 : 0] s_axi_awready
    .s_axi_wdata            (ps_s_axilite.wdata                        ),      // input wire [31 : 0] s_axi_wdata
    .s_axi_wstrb            (ps_s_axilite.wstrb                        ),      // input wire [3 : 0] s_axi_wstrb
    .s_axi_wvalid           (ps_s_axilite.wvalid                       ),    // input wire [0 : 0] s_axi_wvalid
    .s_axi_wready           (ps_s_axilite.wready                       ),    // output wire [0 : 0] s_axi_wready
    .s_axi_bresp            (ps_s_axilite.bresp                        ),      // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid           (ps_s_axilite.bvalid                       ),    // output wire [0 : 0] s_axi_bvalid
    .s_axi_bready           (ps_s_axilite.bready                       ),    // input wire [0 : 0] s_axi_bready
    .s_axi_araddr           (ps_s_axilite.araddr                       ),    // input wire [31 : 0] s_axi_araddr
    .s_axi_arprot           (ps_s_axilite.arprot                       ),    // input wire [2 : 0] s_axi_arprot
    .s_axi_arvalid          (ps_s_axilite.arvalid                      ),  // input wire [0 : 0] s_axi_arvalid
    .s_axi_arready          (ps_s_axilite.arready                      ),  // output wire [0 : 0] s_axi_arready
    .s_axi_rdata            (ps_s_axilite.rdata                        ),      // output wire [31 : 0] s_axi_rdata
    .s_axi_rresp            (ps_s_axilite.rresp                        ),      // output wire [1 : 0] s_axi_rresp
    .s_axi_rvalid           (ps_s_axilite.rvalid                       ),    // output wire [0 : 0] s_axi_rvalid
    .s_axi_rready           (ps_s_axilite.rready                       ),    // input wire [0 : 0] s_axi_rready
    .m_axi_awaddr           ({axil_regs.awaddr  , axil_rf_ctrl.awaddr }),    // output wire [63 : 0] m_axi_awaddr
    .m_axi_awprot           ({axil_regs.awprot  , axil_rf_ctrl.awprot }),    // output wire [5 : 0] m_axi_awprot
    .m_axi_awvalid          ({axil_regs.awvalid , axil_rf_ctrl.awvalid}),  // output wire [1 : 0] m_axi_awvalid
    .m_axi_awready          ({axil_regs.awready , axil_rf_ctrl.awready}),  // input wire [1 : 0] m_axi_awready
    .m_axi_wdata            ({axil_regs.wdata   , axil_rf_ctrl.wdata  }),      // output wire [63 : 0] m_axi_wdata
    .m_axi_wstrb            ({axil_regs.wstrb   , axil_rf_ctrl.wstrb  }),      // output wire [7 : 0] m_axi_wstrb
    .m_axi_wvalid           ({axil_regs.wvalid  , axil_rf_ctrl.wvalid }),    // output wire [1 : 0] m_axi_wvalid
    .m_axi_wready           ({axil_regs.wready  , axil_rf_ctrl.wready }),    // input wire [1 : 0] m_axi_wready
    .m_axi_bresp            ({axil_regs.bresp   , axil_rf_ctrl.bresp  }),      // input wire [3 : 0] m_axi_bresp
    .m_axi_bvalid           ({axil_regs.bvalid  , axil_rf_ctrl.bvalid }),    // input wire [1 : 0] m_axi_bvalid
    .m_axi_bready           ({axil_regs.bready  , axil_rf_ctrl.bready }),    // output wire [1 : 0] m_axi_bready
    .m_axi_araddr           ({axil_regs.araddr  , axil_rf_ctrl.araddr }),    // output wire [63 : 0] m_axi_araddr
    .m_axi_arprot           ({axil_regs.arprot  , axil_rf_ctrl.arprot }),    // output wire [5 : 0] m_axi_arprot
    .m_axi_arvalid          ({axil_regs.arvalid , axil_rf_ctrl.arvalid}),  // output wire [1 : 0] m_axi_arvalid
    .m_axi_arready          ({axil_regs.arready , axil_rf_ctrl.arready}),  // input wire [1 : 0] m_axi_arready
    .m_axi_rdata            ({axil_regs.rdata   , axil_rf_ctrl.rdata  }),      // input wire [63 : 0] m_axi_rdata
    .m_axi_rresp            ({axil_regs.rresp   , axil_rf_ctrl.rresp  }),      // input wire [3 : 0] m_axi_rresp
    .m_axi_rvalid           ({axil_regs.rvalid  , axil_rf_ctrl.rvalid }),    // input wire [1 : 0] m_axi_rvalid
    .m_axi_rready           ({axil_regs.rready  , axil_rf_ctrl.rready })    // output wire [1 : 0] m_axi_rready
);

reg_map u_regs(
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .s_axilite              (axil_regs),
    .regs                   ()
);

reg_map u_rf_ctrl(
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .s_axilite              (axil_rf_ctrl),
    .regs                   ()
);

assign axi4_task::axi_aclk = axi_aclk;
assign axi4_task::axilite_clk = axilite_clk;

initial begin
    int val, read_data;
    axi4_task::m_axil = ps_s_axilite;
    axi4_task::axilite_reset();
    WriteReg(32'h0000_0000, 32'h10);

    WriteReg(32'h0000_1000, 32'h20);

    WriteReg(32'h0001_0000, 32'h30);

    WriteReg(32'h0010_0000, 32'h40);

    WriteReg(32'h0100_0000, 32'h50);

    repeat(100)@(posedge axi_aclk);
    $finish;

end










endmodule
