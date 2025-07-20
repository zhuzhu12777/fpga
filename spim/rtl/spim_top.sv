
module spim_top(
    inout           [53:0]          FIXED_IO_mio,
    inout                           FIXED_IO_ps_clk,
    inout                           FIXED_IO_ps_porb,
    inout                           FIXED_IO_ps_srstb,

    input           [15:0]          SPI_MISO,
    output          [15:0]          SPI_LOAD,
    output          [15:0]          SPI_SCK,
    output          [15:0]          SPI_CSN,
    output          [15:0]          SPI_MOSI

);

logic               ps_clk, ps_rstb;
AXI4Lite            ps_axil();
SPI_BUS             m_spi[16]();

spim_bd_wrapper u_spim_bd(
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
    .SPI_LOAD                           (SPI_LOAD),
    .axilite_clk                        (ps_clk),
    .axilite_rstb                       (ps_rstb),
    .ps_axil                            (ps_axil),
    .m_spi                              (m_spi)
);

genvar i;
generate for(i = 0; i < 16; i = i + 1) begin : m_spi_assign
    assign m_spi[i].miso = SPI_MISO[i];
    assign SPI_SCK[i]    = m_spi[i].sck;
    assign SPI_CSN[i]    = m_spi[i].csn;
    assign SPI_MOSI[i]   = m_spi[i].mosi;
end : m_spi_assign
endgenerate

endmodule
