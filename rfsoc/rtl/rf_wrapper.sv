
`timescale 1ns / 1ps

module RF_Wrapper #(
    parameter RF_ADC_NUM                                = 6             ,
    parameter RF_ADC_AXIS_WID                           = 128
)(
    input                       axilite_clk, axilite_rstb,

    input   [RF_ADC_NUM/2-1:0]  adc_clk_p,
    input   [RF_ADC_NUM/2-1:0]  adc_clk_n,
    output                      clk_adc,
    input                       adc_rstb,
    input                       dac_clk_p,
    input                       dac_clk_n,
    output                      clk_dac,
    input                       dac_rstb,
    input                       sysref_in_p,
    input                       sysref_in_n,

    input   [RF_ADC_NUM-1:0]    vin_p,
    input   [RF_ADC_NUM-1:0]    vin_n,
    output                      vout_p,
    output                      vout_n,

    AXI4Lite.slave              s_axil,
    STREAM.master               m_axis[6],
    STREAM.slave                s_axis,

    output                      irq
);

usp_rf_data_converter_0 u_usp_rf_data_converter_0 (
    .adc0_clk_p                     (adc_clk_p[0]),            // input wire adc0_clk_p
    .adc0_clk_n                     (adc_clk_n[0]),            // input wire adc0_clk_n
    .clk_adc0                       (clk_adc),                // output wire clk_adc0
    .adc1_clk_p                     (adc_clk_p[1]),            // input wire adc1_clk_p
    .adc1_clk_n                     (adc_clk_n[1]),            // input wire adc1_clk_n
    .clk_adc1                       (),                // output wire clk_adc1
    .adc2_clk_p                     (adc_clk_p[2]),            // input wire adc2_clk_p
    .adc2_clk_n                     (adc_clk_n[2]),            // input wire adc2_clk_n
    .clk_adc2                       (),                // output wire clk_adc2
    .dac0_clk_p                     (dac_clk_p),            // input wire dac0_clk_p
    .dac0_clk_n                     (dac_clk_n),            // input wire dac0_clk_n
    .clk_dac0                       (clk_dac),                // output wire clk_dac0
    .s_axi_aclk                     (axilite_clk),            // input wire s_axi_aclk
    .s_axi_aresetn                  (axilite_rstb),      // input wire s_axi_aresetn
    .s_axi_awaddr                   (s_axil.awaddr),        // input wire [17 : 0] s_axi_awaddr
    .s_axi_awvalid                  (s_axil.awvalid),      // input wire s_axi_awvalid
    .s_axi_awready                  (s_axil.awready),      // output wire s_axi_awready
    .s_axi_wdata                    (s_axil.wdata),          // input wire [31 : 0] s_axi_wdata
    .s_axi_wstrb                    (s_axil.wstrb),          // input wire [3 : 0] s_axi_wstrb
    .s_axi_wvalid                   (s_axil.wvalid),        // input wire s_axi_wvalid
    .s_axi_wready                   (s_axil.wready),        // output wire s_axi_wready
    .s_axi_bresp                    (s_axil.bresp),          // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid                   (s_axil.bvalid),        // output wire s_axi_bvalid
    .s_axi_bready                   (s_axil.bready),        // input wire s_axi_bready
    .s_axi_araddr                   (s_axil.araddr),        // input wire [17 : 0] s_axi_araddr
    .s_axi_arvalid                  (s_axil.arvalid),      // input wire s_axi_arvalid
    .s_axi_arready                  (s_axil.arready),      // output wire s_axi_arready
    .s_axi_rdata                    (s_axil.rdata),          // output wire [31 : 0] s_axi_rdata
    .s_axi_rresp                    (s_axil.rresp),          // output wire [1 : 0] s_axi_rresp
    .s_axi_rvalid                   (s_axil.rvalid),        // output wire s_axi_rvalid
    .s_axi_rready                   (s_axil.rready),        // input wire s_axi_rready
    .irq                            (irq),                  // output wire irq
    .sysref_in_p                    (sysref_in_p),          // input wire sysref_in_p
    .sysref_in_n                    (sysref_in_n),          // input wire sysref_in_n
    .vin0_01_p                      (vin_p[0]),              // input wire vin0_01_p
    .vin0_01_n                      (vin_n[0]),              // input wire vin0_01_n
    .vin0_23_p                      (vin_p[1]),              // input wire vin0_23_p
    .vin0_23_n                      (vin_n[1]),              // input wire vin0_23_n
    .vin1_01_p                      (vin_p[2]),              // input wire vin1_01_p
    .vin1_01_n                      (vin_n[2]),              // input wire vin1_01_n
    .vin1_23_p                      (vin_p[3]),              // input wire vin1_23_p
    .vin1_23_n                      (vin_n[3]),              // input wire vin1_23_n
    .vin2_01_p                      (vin_p[4]),              // input wire vin2_01_p
    .vin2_01_n                      (vin_n[4]),              // input wire vin2_01_n
    .vin2_23_p                      (vin_p[5]),              // input wire vin2_23_p
    .vin2_23_n                      (vin_n[5]),              // input wire vin2_23_n
    .vout00_p                       (vout_p),                // output wire vout00_p
    .vout00_n                       (vout_n),                // output wire vout00_n
    .m0_axis_aresetn                (adc_rstb),  // input wire m0_axis_aresetn
    .m0_axis_aclk                   (clk_adc),        // input wire m0_axis_aclk
    .m00_axis_tdata                 (m_axis[0].tdata),    // output wire [127 : 0] m00_axis_tdata
    .m00_axis_tvalid                (m_axis[0].tvalid),  // output wire m00_axis_tvalid
    .m00_axis_tready                (m_axis[0].tready),  // input wire m00_axis_tready
    .m02_axis_tdata                 (m_axis[1].tdata),    // output wire [127 : 0] m02_axis_tdata
    .m02_axis_tvalid                (m_axis[1].tvalid),  // output wire m02_axis_tvalid
    .m02_axis_tready                (m_axis[1].tready),  // input wire m02_axis_tready
    .m1_axis_aresetn                (adc_rstb),  // input wire m1_axis_aresetn
    .m1_axis_aclk                   (clk_adc),        // input wire m1_axis_aclk
    .m10_axis_tdata                 (m_axis[2].tdata),    // output wire [127 : 0] m10_axis_tdata
    .m10_axis_tvalid                (m_axis[2].tvalid),  // output wire m10_axis_tvalid
    .m10_axis_tready                (m_axis[2].tready),  // input wire m10_axis_tready
    .m12_axis_tdata                 (m_axis[3].tdata),    // output wire [127 : 0] m12_axis_tdata
    .m12_axis_tvalid                (m_axis[3].tvalid),  // output wire m12_axis_tvalid
    .m12_axis_tready                (m_axis[3].tready),  // input wire m12_axis_tready
    .m2_axis_aresetn                (adc_rstb),         // input wire m2_axis_aresetn
    .m2_axis_aclk                   (clk_adc),          // input wire m2_axis_aclk
    .m20_axis_tdata                 (m_axis[4].tdata),    // output wire [127 : 0] m20_axis_tdata
    .m20_axis_tvalid                (m_axis[4].tvalid),  // output wire m20_axis_tvalid
    .m20_axis_tready                (m_axis[4].tready),  // input wire m20_axis_tready
    .m22_axis_tdata                 (m_axis[5].tdata),    // output wire [127 : 0] m22_axis_tdata
    .m22_axis_tvalid                (m_axis[5].tvalid),  // output wire m22_axis_tvalid
    .m22_axis_tready                (m_axis[5].tready),  // input wire m22_axis_tready
    .s0_axis_aresetn                (dac_rstb),  // input wire s0_axis_aresetn
    .s0_axis_aclk                   (clk_dac),        // input wire s0_axis_aclk
    .s00_axis_tdata                 (s_axis.tdata),    // input wire [255 : 0] s00_axis_tdata
    .s00_axis_tvalid                (s_axis.tvalid),  // input wire s00_axis_tvalid
    .s00_axis_tready                (s_axis.tready)  // output wire s00_axis_tready
);

endmodule
