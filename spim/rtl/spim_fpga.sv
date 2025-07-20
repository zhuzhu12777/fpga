
module spim_fpga(
    output          [15:0]          SPI_LOAD,

    input                           axilite_clk, axilite_rstb,
    AXI4Lite.slave                  ps_axil,
    SPI_BUS.master                  m_spi[16]

);

SPIM_REGS       regs();
APB4            apb_if();

axi_apb_bridge_0 u_axi_apb (
    .s_axi_aclk                 (axilite_clk),              // input wire s_axi_aclk
    .s_axi_aresetn              (axilite_rstb),             // input wire s_axi_aresetn
    .s_axi_awaddr               (ps_axil.awaddr),           // input wire [31 : 0] s_axi_awaddr
    .s_axi_awprot               (ps_axil.awprot),           // input wire [2 : 0] s_axi_awprot
    .s_axi_awvalid              (ps_axil.awvalid),          // input wire s_axi_awvalid
    .s_axi_awready              (ps_axil.awready),          // output wire s_axi_awready
    .s_axi_wdata                (ps_axil.wdata),            // input wire [31 : 0] s_axi_wdata
    .s_axi_wstrb                (ps_axil.wstrb),            // input wire [3 : 0] s_axi_wstrb
    .s_axi_wvalid               (ps_axil.wvalid),           // input wire s_axi_wvalid
    .s_axi_wready               (ps_axil.wready),           // output wire s_axi_wready
    .s_axi_bresp                (ps_axil.bresp),            // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid               (ps_axil.bvalid),           // output wire s_axi_bvalid
    .s_axi_bready               (ps_axil.bready),           // input wire s_axi_bready
    .s_axi_araddr               (ps_axil.araddr),           // input wire [31 : 0] s_axi_araddr
    .s_axi_arprot               (ps_axil.arprot),           // input wire [2 : 0] s_axi_arprot
    .s_axi_arvalid              (ps_axil.arvalid),          // input wire s_axi_arvalid
    .s_axi_arready              (ps_axil.arready),          // output wire s_axi_arready
    .s_axi_rdata                (ps_axil.rdata),            // output wire [31 : 0] s_axi_rdata
    .s_axi_rresp                (ps_axil.rresp),            // output wire [1 : 0] s_axi_rresp
    .s_axi_rvalid               (ps_axil.rvalid),           // output wire s_axi_rvalid
    .s_axi_rready               (ps_axil.rready),           // input wire s_axi_rready
    .m_apb_paddr                (apb_if.paddr),                // output wire [31 : 0] m_apb_paddr
    .m_apb_psel                 (apb_if.psel),                 // output wire [0 : 0] m_apb_psel
    .m_apb_penable              (apb_if.penable),              // output wire m_apb_penable
    .m_apb_pwrite               (apb_if.pwrite),               // output wire m_apb_pwrite
    .m_apb_pwdata               (apb_if.pwdata),               // output wire [31 : 0] m_apb_pwdata
    .m_apb_pready               (apb_if.pready),               // input wire [0 : 0] m_apb_pready
    .m_apb_prdata               (apb_if.prdata),               // input wire [31 : 0] m_apb_prdata
    .m_apb_pslverr              (apb_if.pslverr),              // input wire [0 : 0] m_apb_pslverr
    .m_apb_pprot                (apb_if.pprot),                // output wire [2 : 0] m_apb_pprot
    .m_apb_pstrb                (apb_if.pstrb)                 // output wire [3 : 0] m_apb_pstrb
);
assign apb_if.pready = 1'b1;
assign apb_if.pslverr = 1'b0;

// reg interface
wire [15:0] offset = {apb_if.paddr[15:2], 2'b00};
wire        wren   = apb_if.pwrite & apb_if.penable & apb_if.psel;

spim_reg u_spim_reg (
    .rdata                      (apb_if.prdata),
    .clk                        (axilite_clk),
    .rstb                       (axilite_rstb),
    .wren                       (wren),
    .offset                     (offset),
    .wdata                      (apb_if.pwdata),
    .wstrb                      (apb_if.pstrb),
    .regs                       (regs)
);

genvar i;
generate for(i = 0; i < 16; i = i + 1) begin : spim_loop

    spim_controller u_spim_controller(
        .reg_rx_data            (regs.rd_data[i]),
        .reg_rx_valid           (regs.rd_flag[i]),
        .fifo_overflow          (regs.fifo_overflow[i]),
        .spi_done               (regs.spi_done[i]),

        .clk                    (axilite_clk),
        .rstb                   (axilite_rstb),
        .div_n                  (regs.div_n),
        .reg_tx_data            (regs.spim_ctrl[i]),
        .reg_tx_valid           (regs.spim_transfer[i]),
        .m_spi                  (m_spi[i])
    );

end : spim_loop
endgenerate

assign SPI_LOAD = regs.spim_load;

endmodule
