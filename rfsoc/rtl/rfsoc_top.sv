`include "common_interface.svh"

module rfsoc_top(
    output                  ADG918_CTRL,

    // SPI IO
    output                  SPI_SCK,
    output                  SPI_CS,
    input                   SPI_MISO,
    output                  SPI_MOSI,
    output                  SPI_RSTB,

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
    input  logic    [2:0]   adc_clk_p,
    input  logic    [2:0]   adc_clk_n,
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
AXI4 #(5, 40, 256)  pl_m_axi_rd();
AXI4 #(6, 40, 128)  ps_m_axi_wr();
AXI4Lite            ps_axil_reg();
AXI4Lite            ps_axil_rf();

// clock & reset
wire    pl_clk0, pl_clk1;
wire    pl_resetn_0, pl_resetn_1;
wire    c0_init_calib_complete_0;
wire    spi_clk, spi_arstn;


//reg [31:0] cnt0 = '0;
//always@(posedge pl_clk0) begin
//    if(cnt0 < 1000000)
//        cnt0 <= cnt0 + 1'b1;
//end
//assign pl_resetn_0 = cnt0 >= 1000000;      //10ms / 10ns = 100_0000

//reg [31:0] cnt1 = '0;
//always@(posedge pl_clk1) begin
//    if(cnt1 < 3333333)
//        cnt1 <= cnt1 + 1'b1;
//end
//assign pl_resetn_1 = cnt1 >= 3333333;     //10ms / 3.0ns = 333_3333

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
    .M_AXI_HPM0_LPD_0_araddr    (ps_axil_rf.araddr),
    .M_AXI_HPM0_LPD_0_arprot    (ps_axil_rf.arprot),
    .M_AXI_HPM0_LPD_0_arready   (ps_axil_rf.arready),
    .M_AXI_HPM0_LPD_0_arvalid   (ps_axil_rf.arvalid),
    .M_AXI_HPM0_LPD_0_awaddr    (ps_axil_rf.awaddr),
    .M_AXI_HPM0_LPD_0_awprot    (ps_axil_rf.awprot),
    .M_AXI_HPM0_LPD_0_awready   (ps_axil_rf.awready),
    .M_AXI_HPM0_LPD_0_awvalid   (ps_axil_rf.awvalid),
    .M_AXI_HPM0_LPD_0_bready    (ps_axil_rf.bready),
    .M_AXI_HPM0_LPD_0_bresp     (ps_axil_rf.bresp),
    .M_AXI_HPM0_LPD_0_bvalid    (ps_axil_rf.bvalid),
    .M_AXI_HPM0_LPD_0_rdata     (ps_axil_rf.rdata),
    .M_AXI_HPM0_LPD_0_rready    (ps_axil_rf.rready),
    .M_AXI_HPM0_LPD_0_rresp     (ps_axil_rf.rresp),
    .M_AXI_HPM0_LPD_0_rvalid    (ps_axil_rf.rvalid),
    .M_AXI_HPM0_LPD_0_wdata     (ps_axil_rf.wdata),
    .M_AXI_HPM0_LPD_0_wready    (ps_axil_rf.wready),
    .M_AXI_HPM0_LPD_0_wstrb     (ps_axil_rf.wstrb),
    .M_AXI_HPM0_LPD_0_wvalid    (ps_axil_rf.wvalid),
    .M_AXI_HPM0_LPD_1_araddr    (ps_axil_reg.araddr),
    .M_AXI_HPM0_LPD_1_arprot    (ps_axil_reg.arprot),
    .M_AXI_HPM0_LPD_1_arready   (ps_axil_reg.arready),
    .M_AXI_HPM0_LPD_1_arvalid   (ps_axil_reg.arvalid),
    .M_AXI_HPM0_LPD_1_awaddr    (ps_axil_reg.awaddr),
    .M_AXI_HPM0_LPD_1_awprot    (ps_axil_reg.awprot),
    .M_AXI_HPM0_LPD_1_awready   (ps_axil_reg.awready),
    .M_AXI_HPM0_LPD_1_awvalid   (ps_axil_reg.awvalid),
    .M_AXI_HPM0_LPD_1_bready    (ps_axil_reg.bready),
    .M_AXI_HPM0_LPD_1_bresp     (ps_axil_reg.bresp),
    .M_AXI_HPM0_LPD_1_bvalid    (ps_axil_reg.bvalid),
    .M_AXI_HPM0_LPD_1_rdata     (ps_axil_reg.rdata),
    .M_AXI_HPM0_LPD_1_rready    (ps_axil_reg.rready),
    .M_AXI_HPM0_LPD_1_rresp     (ps_axil_reg.rresp),
    .M_AXI_HPM0_LPD_1_rvalid    (ps_axil_reg.rvalid),
    .M_AXI_HPM0_LPD_1_wdata     (ps_axil_reg.wdata),
    .M_AXI_HPM0_LPD_1_wready    (ps_axil_reg.wready),
    .M_AXI_HPM0_LPD_1_wstrb     (ps_axil_reg.wstrb),
    .M_AXI_HPM0_LPD_1_wvalid    (ps_axil_reg.wvalid),
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
    .c0_init_calib_complete_0   (c0_init_calib_complete_0),
    .pl_clk0_0                  (pl_clk0),
    .pl_clk1_0                  (pl_clk1),
    .pl_resetn_0                (pl_resetn_0),
    .pl_resetn_1                (pl_resetn_1),
    .spi_clk                    (spi_clk),
    .spi_rstb                   (spi_arstn)
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
    .ps_axil_rf                 (ps_axil_rf),
    .ps_axil_reg                (ps_axil_reg),

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

AU5619_cfg_top u_AU5619_cfg_top(
    .clk_10m                    (spi_clk        ),
    .arst_n                     (spi_arstn       ),
    .init_complete              (               ),
    .user_cfg_valid             (1'b0           ),
    .user_cfg_data              (32'd0          ),
    .uesr_rd_valid              (               ),
    .uesr_rd_data               (               ),
    .pll_rstn                   (SPI_RSTB       ),
    .m_spi_sdo                  (SPI_MISO       ),
    .m_spi_sck                  (SPI_SCK        ),
    .m_spi_ncs                  (SPI_CS         ),
    .m_spi_sdi                  (SPI_MOSI       )
);

assign ADG918_CTRL = 1'b0;



endmodule
