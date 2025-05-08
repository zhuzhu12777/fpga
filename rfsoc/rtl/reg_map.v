`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module reg_map #(
    parameter ADDR_SEGMENT = 16'h0000
)(
    input                       axilite_clk, axilite_rstb,      // AXI-Lite clock and reset

    // axi-lite interface
    input               [31:0]  axi_awaddr,
    input                       axi_awvalid,
    output                      axi_awready,
    input               [31:0]  axi_wdata,
    input                       axi_wvalid,
    output                      axi_wready,
    output              [1:0]   axi_bresp,
    output                      axi_bvalid,
    input                       axi_bready,
    input               [31:0]  axi_araddr,
    input                       axi_arvalid,
    output                      axi_arready,
    output              [31:0]  axi_rdata,
    output              [1:0]   axi_rresp,
    output                      axi_rvalid,
    input                       axi_rready,

    // registers
    output              [31:0]  dac_start_addr,
    output              [31:0]  dac_data_size,
    output                      dac_reset,
    output                      dac_start,

    output              [31:0]  adc_start_addr,
    output              [31:0]  adc_cap_size,
    output                      adc_reset,
    output                      adc_start,

    output              [3:0]   gty_chn,
    output              [7:0]   gty_ram_addr,
    output              [31:0]  gty_ram_data,
    output                      gty_ram_wren,
    output                      gty_start,
    output                      gty_reset,

    input                       adc_cap_done
);

wire [31:0] paddr;
wire [31:0] pwdata, prdata;
wire [3:0]  pstrb;
wire        pwrite, penable, psel, pready, pslverr;

axi_apb_bridge_0 axi_apb (
    .s_axi_aclk                 (axilite_clk),          // input wire s_axi_aclk
    .s_axi_aresetn              (axilite_rstb),         // input wire s_axi_aresetn
    .s_axi_awaddr               (axi_awaddr),           // input wire [31 : 0] s_axi_awaddr
    .s_axi_awvalid              (axi_awvalid),          // input wire s_axi_awvalid
    .s_axi_awready              (axi_awready),          // output wire s_axi_awready
    .s_axi_wdata                (axi_wdata),            // input wire [31 : 0] s_axi_wdata
    .s_axi_wvalid               (axi_wvalid),           // input wire s_axi_wvalid
    .s_axi_wready               (axi_wready),           // output wire s_axi_wready
    .s_axi_bresp                (axi_bresp),            // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid               (axi_bvalid),           // output wire s_axi_bvalid
    .s_axi_bready               (axi_bready),           // input wire s_axi_bready
    .s_axi_araddr               (axi_araddr),           // input wire [31 : 0] s_axi_araddr
    .s_axi_arvalid              (axi_arvalid),          // input wire s_axi_arvalid
    .s_axi_arready              (axi_arready),          // output wire s_axi_arready
    .s_axi_rdata                (axi_rdata),            // output wire [31 : 0] s_axi_rdata
    .s_axi_rresp                (axi_rresp),            // output wire [1 : 0] s_axi_rresp
    .s_axi_rvalid               (axi_rvalid),           // output wire s_axi_rvalid
    .s_axi_rready               (axi_rready),           // input wire s_axi_rready
    .m_apb_paddr                (paddr),                // output wire [31 : 0] m_apb_paddr
    .m_apb_psel                 (psel),                 // output wire [0 : 0] m_apb_psel
    .m_apb_penable              (penable),              // output wire m_apb_penable
    .m_apb_pwrite               (pwrite),               // output wire m_apb_pwrite
    .m_apb_pwdata               (pwdata),               // output wire [31 : 0] m_apb_pwdata
    .m_apb_pready               (pready),               // input wire [0 : 0] m_apb_pready
    .m_apb_prdata               (prdata),               // input wire [31 : 0] m_apb_prdata
    .m_apb_pslverr              (pslverr),              // input wire [0 : 0] m_apb_pslverr
    .m_apb_pprot                (),                     // output wire [2 : 0] m_apb_pprot
    .m_apb_pstrb                (pstrb)                 // output wire [3 : 0] m_apb_pstrb
);

// reg interface
wire [15:0] offset = {paddr[15:2], 2'b00};
wire        wren   = pwrite & penable & psel & (paddr[31:16] == ADDR_SEGMENT);

rfsoc_reg u_rfsoc_reg (
    .rdata                      (prdata),
    .dac_start_addr             (dac_start_addr),
    .dac_cap_size               (dac_data_size),
    .dac_reset                  (dac_reset),
    .dac_start                  (dac_start),
    .adc_start_addr             (adc_start_addr),
    .adc_cap_size               (adc_cap_size),
    .adc_reset                  (adc_reset),
    .adc_start                  (adc_start),
    .gty_ram_wren               (gty_ram_wren),
    .gty_chn                    (gty_chn),
    .gty_ram_addr               (gty_ram_addr),
    .gty_ram_data               (gty_ram_data),
    .gty_reset                  (gty_reset),
    .gty_start                  (gty_start),
    .clk                        (axilite_clk),
    .rstb                       (axilite_rstb),
    .wren                       (wren),
    .offset                     (offset),
    .wdata                      (pwdata),
    .wstrb                      (pstrb),
    .adc_cap_done               (adc_cap_done)
);


endmodule
