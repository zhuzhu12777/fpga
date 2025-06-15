`include "common_interface.svh"

module rfsoc_top(

    // SPI IO
    inout                   SPI_SCK,
    inout                   SPI_CS,
    inout                   SPI_IO0,
    inout                   SPI_IO1,

    //DDR4 IO
    output logic            C0_DDR4_0_act_n,
    output logic    [16:0]  C0_DDR4_0_adr,
    output logic    [1:0]   C0_DDR4_0_ba,
    output logic            C0_DDR4_0_bg,
    output logic            C0_DDR4_0_ck_c,
    output logic            C0_DDR4_0_ck_t,
    output logic            C0_DDR4_0_cke,
    output logic            C0_DDR4_0_cs_n,
    inout  logic    [3:0]   C0_DDR4_0_dm_n,
    inout  logic    [31:0]  C0_DDR4_0_dq,
    inout  logic    [3:0]   C0_DDR4_0_dqs_c,
    inout  logic    [3:0]   C0_DDR4_0_dqs_t,
    output logic            C0_DDR4_0_odt,
    output logic            C0_DDR4_0_reset_n,
    input  logic            C0_SYS_CLK_0_clk_n,
    input  logic            C0_SYS_CLK_0_clk_p,

    // ADC / DAC / GT clocks
    input  logic    [5:0]   adc_clk_p,
    input  logic    [5:0]   adc_clk_n,
    input  logic            dac_clk_p,
    input  logic            dac_clk_n,
    input  logic            rf_sysref_in_p,
    input  logic            rf_sysref_in_n,

    input  logic            gt_refclk_p,
    input  logic            gt_refclk_n,
    output logic    [5:0]   gt_txp,
    output logic    [5:0]   gt_txn,

    input  logic    [5:0]   vin_p,
    input  logic    [5:0]   vin_n,
    output logic            vout_p,
    output logic            vout_n

);

// interface
AXI4 #(4, 40, 256)  pl_m_axi_rd();
AXI4 #(4, 40, 128)  ps_m_axi_wr();
AXI4Lite            ps_s_axilite();

// clock & reset
wire    pl_clk0, pl_clk1;
wire    pl_resetn_0, pl_resetn_1;
wire    c0_init_calib_complete_0;


design_1_wrapper u_bd(
    .C0_DDR4_0_act_n            (C0_DDR4_0_act_n),
    .C0_DDR4_0_adr              (C0_DDR4_0_adr),
    .C0_DDR4_0_ba               (C0_DDR4_0_ba),
    .C0_DDR4_0_bg               (C0_DDR4_0_bg),
    .C0_DDR4_0_ck_c             (C0_DDR4_0_ck_c),
    .C0_DDR4_0_ck_t             (C0_DDR4_0_ck_t),
    .C0_DDR4_0_cke              (C0_DDR4_0_cke),
    .C0_DDR4_0_cs_n             (C0_DDR4_0_cs_n),
    .C0_DDR4_0_dm_n             (C0_DDR4_0_dm_n),
    .C0_DDR4_0_dq               (C0_DDR4_0_dq),
    .C0_DDR4_0_dqs_c            (C0_DDR4_0_dqs_c),
    .C0_DDR4_0_dqs_t            (C0_DDR4_0_dqs_t),
    .C0_DDR4_0_odt              (C0_DDR4_0_odt),
    .C0_DDR4_0_reset_n          (C0_DDR4_0_reset_n),
    .C0_SYS_CLK_0_clk_n         (C0_SYS_CLK_0_clk_n),
    .C0_SYS_CLK_0_clk_p         (C0_SYS_CLK_0_clk_p),
    .M_AXI_HPM0_LPD_0_araddr    (ps_s_axilite.araddr),
    .M_AXI_HPM0_LPD_0_arprot    (ps_s_axilite.arprot),
    .M_AXI_HPM0_LPD_0_arready   (ps_s_axilite.arready),
    .M_AXI_HPM0_LPD_0_arvalid   (ps_s_axilite.arvalid),
    .M_AXI_HPM0_LPD_0_awaddr    (ps_s_axilite.awaddr),
    .M_AXI_HPM0_LPD_0_awprot    (ps_s_axilite.awprot),
    .M_AXI_HPM0_LPD_0_awready   (ps_s_axilite.awready),
    .M_AXI_HPM0_LPD_0_awvalid   (ps_s_axilite.awvalid),
    .M_AXI_HPM0_LPD_0_bready    (ps_s_axilite.bready),
    .M_AXI_HPM0_LPD_0_bresp     (ps_s_axilite.bresp),
    .M_AXI_HPM0_LPD_0_bvalid    (ps_s_axilite.bvalid),
    .M_AXI_HPM0_LPD_0_rdata     (ps_s_axilite.rdata),
    .M_AXI_HPM0_LPD_0_rready    (ps_s_axilite.rready),
    .M_AXI_HPM0_LPD_0_rresp     (ps_s_axilite.rresp),
    .M_AXI_HPM0_LPD_0_rvalid    (ps_s_axilite.rvalid),
    .M_AXI_HPM0_LPD_0_wdata     (ps_s_axilite.wdata),
    .M_AXI_HPM0_LPD_0_wready    (ps_s_axilite.wready),
    .M_AXI_HPM0_LPD_0_wstrb     (ps_s_axilite.wstrb),
    .M_AXI_HPM0_LPD_0_wvalid    (ps_s_axilite.wvalid),
    .S01_AXI_0_araddr           (pl_m_axi_rd.araddr),
    .S01_AXI_0_arburst          (pl_m_axi_rd.arburst),
    .S01_AXI_0_arcache          (pl_m_axi_rd.arcache),
    .S01_AXI_0_arid             (pl_m_axi_rd.arid),
    .S01_AXI_0_arlen            (pl_m_axi_rd.arlen),
    .S01_AXI_0_arlock           ('0),
    .S01_AXI_0_arprot           (pl_m_axi_rd.arprot),
    .S01_AXI_0_arqos            ('0),
    .S01_AXI_0_arready          (pl_m_axi_rd.arready),
    .S01_AXI_0_arsize           (pl_m_axi_rd.arsize),
    .S01_AXI_0_arvalid          (pl_m_axi_rd.arvalid),
    .S01_AXI_0_awaddr           ('0),
    .S01_AXI_0_awburst          ('0),
    .S01_AXI_0_awcache          ('0),
    .S01_AXI_0_awid             ('0),
    .S01_AXI_0_awlen            ('0),
    .S01_AXI_0_awlock           ('0),
    .S01_AXI_0_awprot           ('0),
    .S01_AXI_0_awqos            ('0),
    .S01_AXI_0_awready          (),
    .S01_AXI_0_awsize           ('0),
    .S01_AXI_0_awvalid          ('0),
    .S01_AXI_0_bid              (),
    .S01_AXI_0_bready           ('1),
    .S01_AXI_0_bresp            (),
    .S01_AXI_0_bvalid           (),
    .S01_AXI_0_rdata            (pl_m_axi_rd.rdata),
    .S01_AXI_0_rid              (pl_m_axi_rd.rid),
    .S01_AXI_0_rlast            (pl_m_axi_rd.rlast),
    .S01_AXI_0_rready           (pl_m_axi_rd.rready),
    .S01_AXI_0_rresp            (pl_m_axi_rd.rresp),
    .S01_AXI_0_rvalid           (pl_m_axi_rd.rvalid),
    .S01_AXI_0_wdata            ('0),
    .S01_AXI_0_wlast            ('0),
    .S01_AXI_0_wready           (),
    .S01_AXI_0_wstrb            ('0),
    .S01_AXI_0_wvalid           ('0),
    .S_AXI_HP0_FPD_0_araddr     ('0),
    .S_AXI_HP0_FPD_0_arburst    ('0),
    .S_AXI_HP0_FPD_0_arcache    ('0),
    .S_AXI_HP0_FPD_0_arid       ('0),
    .S_AXI_HP0_FPD_0_arlen      ('0),
    .S_AXI_HP0_FPD_0_arlock     ('0),
    .S_AXI_HP0_FPD_0_arprot     ('0),
    .S_AXI_HP0_FPD_0_arqos      ('0),
    .S_AXI_HP0_FPD_0_arready    (),
    .S_AXI_HP0_FPD_0_arsize     ('0),
    .S_AXI_HP0_FPD_0_aruser     ('0),
    .S_AXI_HP0_FPD_0_arvalid    ('0),
    .S_AXI_HP0_FPD_0_awaddr     (ps_m_axi_wr.awaddr),
    .S_AXI_HP0_FPD_0_awburst    (ps_m_axi_wr.awburst),
    .S_AXI_HP0_FPD_0_awcache    (ps_m_axi_wr.awcache),
    .S_AXI_HP0_FPD_0_awid       (ps_m_axi_wr.awid),
    .S_AXI_HP0_FPD_0_awlen      (ps_m_axi_wr.awlen),
    .S_AXI_HP0_FPD_0_awlock     ('0),
    .S_AXI_HP0_FPD_0_awprot     (ps_m_axi_wr.awprot),
    .S_AXI_HP0_FPD_0_awqos      ('0),
    .S_AXI_HP0_FPD_0_awready    (ps_m_axi_wr.awready),
    .S_AXI_HP0_FPD_0_awsize     (ps_m_axi_wr.awsize),
    .S_AXI_HP0_FPD_0_awuser     ('0),
    .S_AXI_HP0_FPD_0_awvalid    (ps_m_axi_wr.awvalid),
    .S_AXI_HP0_FPD_0_bid        (ps_m_axi_wr.bid),
    .S_AXI_HP0_FPD_0_bready     (ps_m_axi_wr.bready),
    .S_AXI_HP0_FPD_0_bresp      (ps_m_axi_wr.bresp),
    .S_AXI_HP0_FPD_0_bvalid     (ps_m_axi_wr.bvalid),
    .S_AXI_HP0_FPD_0_rdata      (),
    .S_AXI_HP0_FPD_0_rid        (),
    .S_AXI_HP0_FPD_0_rlast      (),
    .S_AXI_HP0_FPD_0_rready     ('1),
    .S_AXI_HP0_FPD_0_rresp      (),
    .S_AXI_HP0_FPD_0_rvalid     (),
    .S_AXI_HP0_FPD_0_wdata      (ps_m_axi_wr.wdata),
    .S_AXI_HP0_FPD_0_wlast      (ps_m_axi_wr.wlast),
    .S_AXI_HP0_FPD_0_wready     (ps_m_axi_wr.wready),
    .S_AXI_HP0_FPD_0_wstrb      (ps_m_axi_wr.wstrb),
    .S_AXI_HP0_FPD_0_wvalid     (ps_m_axi_wr.wvalid),
    .SPI_0_0_io0_io             (SPI_IO0),
    .SPI_0_0_io1_io             (SPI_IO1),
    .SPI_0_0_sck_io             (SPI_SCK),
    .SPI_0_0_ss_io              (SPI_CS),
    .c0_init_calib_complete_0   (c0_init_calib_complete_0),
    .pl_clk0_0                  (pl_clk0_0),
    .pl_clk1_0                  (pl_clk1_0),
    .pl_resetn_0                (pl_resetn_0),
    .pl_resetn_1                (pl_resetn_1)
);

rfsoc_fpga u_rfsoc_fpga (
    .ps_clk                     (pl_clk1), 
    .ps_rstb                    (pl_resetn_1),               // 333.25MHz
    .axilite_clk                (pl_clk0), 
    .axilite_rstb               (pl_resetn_0),               // 100MHz

    // axi4 pl 256b
    .pl_m_axi_rd                (pl_m_axi_rd),

    // axi4 ps 128b
    .ps_m_axi_wr                (ps_m_axi_wr),

    // axi4l slave
    .ps_s_axilite               (ps_s_axilite),

    // adc/dac clocks
    .adc_clk_p                  (adc_clk_p),
    .adc_clk_n                  (adc_clk_n),
    .dac_clk_p                  (dac_clk_p),
    .dac_clk_n                  (dac_clk_n),
    .rf_sysref_in_p             (rf_sysref_in_p),
    .rf_sysref_in_n             (rf_sysref_in_n),

    .gt_refclk_p                (gt_refclk_p),
    .gt_refclk_n                (gt_refclk_n),
    .gt_txp                     (gt_txp),
    .gt_txn                     (gt_txn),

    .vin_p                      (vin_p),
    .vin_n                      (vin_n),
    .vout_p                     (vout_p),
    .vout_n                     (vout_n),
    .c0_init_calib_complete     (c0_init_calib_complete_0)
);


endmodule
