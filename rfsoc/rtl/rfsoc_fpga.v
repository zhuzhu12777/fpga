




usp_rf_data_converter_0 your_instance_name (
    .adc0_clk_p                     (adc0_clk_p),            // input wire adc0_clk_p
    .adc0_clk_n                     (adc0_clk_n),            // input wire adc0_clk_n
    .clk_adc0                       (clk_adc0),                // output wire clk_adc0
    .adc1_clk_p                     (adc1_clk_p),            // input wire adc1_clk_p
    .adc1_clk_n                     (adc1_clk_n),            // input wire adc1_clk_n
    .clk_adc1                       (clk_adc1),                // output wire clk_adc1
    .adc2_clk_p                     (adc2_clk_p),            // input wire adc2_clk_p
    .adc2_clk_n                     (adc2_clk_n),            // input wire adc2_clk_n
    .clk_adc2                       (clk_adc2),                // output wire clk_adc2
    .dac0_clk_p                     (dac0_clk_p),            // input wire dac0_clk_p
    .dac0_clk_n                     (dac0_clk_n),            // input wire dac0_clk_n
    .clk_dac0                       (clk_dac0),                // output wire clk_dac0
    .s_axi_aclk                     (s_axi_aclk),            // input wire s_axi_aclk
    .s_axi_aresetn                  (s_axi_aresetn),      // input wire s_axi_aresetn
    .s_axi_awaddr                   (s_axi_awaddr),        // input wire [17 : 0] s_axi_awaddr
    .s_axi_awvalid                  (s_axi_awvalid),      // input wire s_axi_awvalid
    .s_axi_awready                  (s_axi_awready),      // output wire s_axi_awready
    .s_axi_wdata                    (s_axi_wdata),          // input wire [31 : 0] s_axi_wdata
    .s_axi_wstrb                    (s_axi_wstrb),          // input wire [3 : 0] s_axi_wstrb
    .s_axi_wvalid                   (s_axi_wvalid),        // input wire s_axi_wvalid
    .s_axi_wready                   (s_axi_wready),        // output wire s_axi_wready
    .s_axi_bresp                    (s_axi_bresp),          // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid                   (s_axi_bvalid),        // output wire s_axi_bvalid
    .s_axi_bready                   (s_axi_bready),        // input wire s_axi_bready
    .s_axi_araddr                   (s_axi_araddr),        // input wire [17 : 0] s_axi_araddr
    .s_axi_arvalid                  (s_axi_arvalid),      // input wire s_axi_arvalid
    .s_axi_arready                  (s_axi_arready),      // output wire s_axi_arready
    .s_axi_rdata                    (s_axi_rdata),          // output wire [31 : 0] s_axi_rdata
    .s_axi_rresp                    (s_axi_rresp),          // output wire [1 : 0] s_axi_rresp
    .s_axi_rvalid                   (s_axi_rvalid),        // output wire s_axi_rvalid
    .s_axi_rready                   (s_axi_rready),        // input wire s_axi_rready
    .irq                            (irq),                          // output wire irq
    .sysref_in_p                    (sysref_in_p),          // input wire sysref_in_p
    .sysref_in_n                    (sysref_in_n),          // input wire sysref_in_n
    .vin0_01_p                      (vin0_01_p),              // input wire vin0_01_p
    .vin0_01_n                      (vin0_01_n),              // input wire vin0_01_n
    .vin0_23_p                      (vin0_23_p),              // input wire vin0_23_p
    .vin0_23_n                      (vin0_23_n),              // input wire vin0_23_n
    .vin1_01_p                      (vin1_01_p),              // input wire vin1_01_p
    .vin1_01_n                      (vin1_01_n),              // input wire vin1_01_n
    .vin1_23_p                      (vin1_23_p),              // input wire vin1_23_p
    .vin1_23_n                      (vin1_23_n),              // input wire vin1_23_n
    .vin2_01_p                      (vin2_01_p),              // input wire vin2_01_p
    .vin2_01_n                      (vin2_01_n),              // input wire vin2_01_n
    .vin2_23_p                      (vin2_23_p),              // input wire vin2_23_p
    .vin2_23_n                      (vin2_23_n),              // input wire vin2_23_n
    .vout00_p                       (vout00_p),                // output wire vout00_p
    .vout00_n                       (vout00_n),                // output wire vout00_n
    .m0_axis_aresetn                (m0_axis_aresetn),  // input wire m0_axis_aresetn
    .m0_axis_aclk                   (m0_axis_aclk),        // input wire m0_axis_aclk
    .m00_axis_tdata                 (m00_axis_tdata),    // output wire [127 : 0] m00_axis_tdata
    .m00_axis_tvalid                (m00_axis_tvalid),  // output wire m00_axis_tvalid
    .m00_axis_tready                (m00_axis_tready),  // input wire m00_axis_tready
    .m02_axis_tdata                 (m02_axis_tdata),    // output wire [127 : 0] m02_axis_tdata
    .m02_axis_tvalid                (m02_axis_tvalid),  // output wire m02_axis_tvalid
    .m02_axis_tready                (m02_axis_tready),  // input wire m02_axis_tready
    .m1_axis_aresetn                (m1_axis_aresetn),  // input wire m1_axis_aresetn
    .m1_axis_aclk                   (m1_axis_aclk),        // input wire m1_axis_aclk
    .m10_axis_tdata                 (m10_axis_tdata),    // output wire [127 : 0] m10_axis_tdata
    .m10_axis_tvalid                (m10_axis_tvalid),  // output wire m10_axis_tvalid
    .m10_axis_tready                (m10_axis_tready),  // input wire m10_axis_tready
    .m12_axis_tdata                 (m12_axis_tdata),    // output wire [127 : 0] m12_axis_tdata
    .m12_axis_tvalid                (m12_axis_tvalid),  // output wire m12_axis_tvalid
    .m12_axis_tready                (m12_axis_tready),  // input wire m12_axis_tready
    .m2_axis_aresetn                (m2_axis_aresetn),  // input wire m2_axis_aresetn
    .m2_axis_aclk                   (m2_axis_aclk),        // input wire m2_axis_aclk
    .m20_axis_tdata                 (m20_axis_tdata),    // output wire [127 : 0] m20_axis_tdata
    .m20_axis_tvalid                (m20_axis_tvalid),  // output wire m20_axis_tvalid
    .m20_axis_tready                (m20_axis_tready),  // input wire m20_axis_tready
    .m22_axis_tdata                 (m22_axis_tdata),    // output wire [127 : 0] m22_axis_tdata
    .m22_axis_tvalid                (m22_axis_tvalid),  // output wire m22_axis_tvalid
    .m22_axis_tready                (m22_axis_tready),  // input wire m22_axis_tready
    .s0_axis_aresetn                (s0_axis_aresetn),  // input wire s0_axis_aresetn
    .s0_axis_aclk                   (s0_axis_aclk),        // input wire s0_axis_aclk
    .s00_axis_tdata                 (s00_axis_tdata),    // input wire [255 : 0] s00_axis_tdata
    .s00_axis_tvalid                (s00_axis_tvalid),  // input wire s00_axis_tvalid
    .s00_axis_tready                (s00_axis_tready)  // output wire s00_axis_tready
);




