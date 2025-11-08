
module spim2_top(
    inout           [53:0]          FIXED_IO_mio,
    inout                           FIXED_IO_ps_clk,
    inout                           FIXED_IO_ps_porb,
    inout                           FIXED_IO_ps_srstb,

    inout           [14:0]          DDR_0_addr,
    inout           [2:0]           DDR_0_ba,
    inout                           DDR_0_cas_n,
    inout                           DDR_0_ck_n,
    inout                           DDR_0_ck_p,
    inout                           DDR_0_cke,
    inout                           DDR_0_cs_n,
    inout           [3:0]           DDR_0_dm,
    inout           [31:0]          DDR_0_dq,
    inout           [3:0]           DDR_0_dqs_n,
    inout           [3:0]           DDR_0_dqs_p,
    inout                           DDR_0_odt,
    inout                           DDR_0_ras_n,
    inout                           DDR_0_reset_n,
    inout                           DDR_0_we_n,
    inout                           FIXED_IO_ddr_vrn,
    inout                           FIXED_IO_ddr_vrp,

    inout           [7:0]           LED_tri_io,

    input           [8:0]           SPI_MISO,
    output          [8:0]           SPI_SYSRST,
    output          [8:0]           SPI_LOAD,
    output          [8:0]           SPI_SCK,
    output          [8:0]           SPI_CSN,
    output          [8:0]           SPI_MOSI

);

logic               ps_clk, ps_rstb;
AXI4Lite            ps_axil();
SPI_BUS             m_spi[9]();

spim_bd_wrapper u_spim_bd(
    .DDR_0_addr                         (DDR_0_addr             ),
    .DDR_0_ba                           (DDR_0_ba               ),
    .DDR_0_cas_n                        (DDR_0_cas_n            ),
    .DDR_0_ck_n                         (DDR_0_ck_n             ),
    .DDR_0_ck_p                         (DDR_0_ck_p             ),
    .DDR_0_cke                          (DDR_0_cke              ),
    .DDR_0_cs_n                         (DDR_0_cs_n             ),
    .DDR_0_dm                           (DDR_0_dm               ),
    .DDR_0_dq                           (DDR_0_dq               ),
    .DDR_0_dqs_n                        (DDR_0_dqs_n            ),
    .DDR_0_dqs_p                        (DDR_0_dqs_p            ),
    .DDR_0_odt                          (DDR_0_odt              ),
    .DDR_0_ras_n                        (DDR_0_ras_n            ),
    .DDR_0_reset_n                      (DDR_0_reset_n          ),
    .DDR_0_we_n                         (DDR_0_we_n             ),
    .FIXED_IO_ddr_vrn                   (FIXED_IO_ddr_vrn       ),
    .FIXED_IO_ddr_vrp                   (FIXED_IO_ddr_vrp       ),
    .LED_tri_io                         (LED_tri_io             ), 
    .FIXED_IO_mio                       (FIXED_IO_mio           ),
    .FIXED_IO_ps_clk                    (FIXED_IO_ps_clk        ),
    .FIXED_IO_ps_porb                   (FIXED_IO_ps_porb       ),
    .FIXED_IO_ps_srstb                  (FIXED_IO_ps_srstb      ),
    .M00_AXI_araddr                     (ps_axil.araddr         ),
    .M00_AXI_arprot                     (ps_axil.arprot         ),
    .M00_AXI_arready                    (ps_axil.arready        ),
    .M00_AXI_arvalid                    (ps_axil.arvalid        ),
    .M00_AXI_awaddr                     (ps_axil.awaddr         ),
    .M00_AXI_awprot                     (ps_axil.awprot         ),
    .M00_AXI_awready                    (ps_axil.awready        ),
    .M00_AXI_awvalid                    (ps_axil.awvalid        ),
    .M00_AXI_bready                     (ps_axil.bready         ),
    .M00_AXI_bresp                      (ps_axil.bresp          ),
    .M00_AXI_bvalid                     (ps_axil.bvalid         ),
    .M00_AXI_rdata                      (ps_axil.rdata          ),
    .M00_AXI_rready                     (ps_axil.rready         ),
    .M00_AXI_rresp                      (ps_axil.rresp          ),
    .M00_AXI_rvalid                     (ps_axil.rvalid         ),
    .M00_AXI_wdata                      (ps_axil.wdata          ),
    .M00_AXI_wready                     (ps_axil.wready         ),
    .M00_AXI_wstrb                      (ps_axil.wstrb          ),
    .M00_AXI_wvalid                     (ps_axil.wvalid         ),
    .PS_CLK                             (ps_clk                 ),
    .PS_RSTB                            (ps_rstb                )
);

spim_fpga u_spim_fpga(
    .SPI_SYSRST                         (SPI_SYSRST),
    .SPI_LOAD                           (SPI_LOAD),
    .axilite_clk                        (ps_clk),
    .axilite_rstb                       (ps_rstb),
    .ps_axil                            (ps_axil),
    .m_spi                              (m_spi)
);

genvar i;
generate for(i = 0; i < 9; i = i + 1) begin : m_spi_assign
    assign m_spi[i].miso = SPI_MISO[i];
    assign SPI_SCK[i]    = m_spi[i].sck;
    assign SPI_CSN[i]    = m_spi[i].csn;
    assign SPI_MOSI[i]   = m_spi[i].mosi;
end : m_spi_assign
endgenerate

endmodule
