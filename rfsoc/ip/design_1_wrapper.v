//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Sat Jun 14 23:04:36 2025
//Host        : slfan running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (C0_DDR4_0_act_n,
    C0_DDR4_0_adr,
    C0_DDR4_0_ba,
    C0_DDR4_0_bg,
    C0_DDR4_0_ck_c,
    C0_DDR4_0_ck_t,
    C0_DDR4_0_cke,
    C0_DDR4_0_cs_n,
    C0_DDR4_0_dm_n,
    C0_DDR4_0_dq,
    C0_DDR4_0_dqs_c,
    C0_DDR4_0_dqs_t,
    C0_DDR4_0_odt,
    C0_DDR4_0_reset_n,
    C0_SYS_CLK_0_clk_n,
    C0_SYS_CLK_0_clk_p,
    M_AXI_HPM0_LPD_0_araddr,
    M_AXI_HPM0_LPD_0_arprot,
    M_AXI_HPM0_LPD_0_arready,
    M_AXI_HPM0_LPD_0_arvalid,
    M_AXI_HPM0_LPD_0_awaddr,
    M_AXI_HPM0_LPD_0_awprot,
    M_AXI_HPM0_LPD_0_awready,
    M_AXI_HPM0_LPD_0_awvalid,
    M_AXI_HPM0_LPD_0_bready,
    M_AXI_HPM0_LPD_0_bresp,
    M_AXI_HPM0_LPD_0_bvalid,
    M_AXI_HPM0_LPD_0_rdata,
    M_AXI_HPM0_LPD_0_rready,
    M_AXI_HPM0_LPD_0_rresp,
    M_AXI_HPM0_LPD_0_rvalid,
    M_AXI_HPM0_LPD_0_wdata,
    M_AXI_HPM0_LPD_0_wready,
    M_AXI_HPM0_LPD_0_wstrb,
    M_AXI_HPM0_LPD_0_wvalid,
    S01_AXI_0_araddr,
    S01_AXI_0_arburst,
    S01_AXI_0_arcache,
    S01_AXI_0_arid,
    S01_AXI_0_arlen,
    S01_AXI_0_arlock,
    S01_AXI_0_arprot,
    S01_AXI_0_arqos,
    S01_AXI_0_arready,
    S01_AXI_0_arsize,
    S01_AXI_0_arvalid,
    S01_AXI_0_awaddr,
    S01_AXI_0_awburst,
    S01_AXI_0_awcache,
    S01_AXI_0_awid,
    S01_AXI_0_awlen,
    S01_AXI_0_awlock,
    S01_AXI_0_awprot,
    S01_AXI_0_awqos,
    S01_AXI_0_awready,
    S01_AXI_0_awsize,
    S01_AXI_0_awvalid,
    S01_AXI_0_bid,
    S01_AXI_0_bready,
    S01_AXI_0_bresp,
    S01_AXI_0_bvalid,
    S01_AXI_0_rdata,
    S01_AXI_0_rid,
    S01_AXI_0_rlast,
    S01_AXI_0_rready,
    S01_AXI_0_rresp,
    S01_AXI_0_rvalid,
    S01_AXI_0_wdata,
    S01_AXI_0_wlast,
    S01_AXI_0_wready,
    S01_AXI_0_wstrb,
    S01_AXI_0_wvalid,
    SPI_0_0_io0_io,
    SPI_0_0_io1_io,
    SPI_0_0_sck_io,
    SPI_0_0_ss_io,
    S_AXI_HP0_FPD_0_araddr,
    S_AXI_HP0_FPD_0_arburst,
    S_AXI_HP0_FPD_0_arcache,
    S_AXI_HP0_FPD_0_arid,
    S_AXI_HP0_FPD_0_arlen,
    S_AXI_HP0_FPD_0_arlock,
    S_AXI_HP0_FPD_0_arprot,
    S_AXI_HP0_FPD_0_arqos,
    S_AXI_HP0_FPD_0_arready,
    S_AXI_HP0_FPD_0_arsize,
    S_AXI_HP0_FPD_0_aruser,
    S_AXI_HP0_FPD_0_arvalid,
    S_AXI_HP0_FPD_0_awaddr,
    S_AXI_HP0_FPD_0_awburst,
    S_AXI_HP0_FPD_0_awcache,
    S_AXI_HP0_FPD_0_awid,
    S_AXI_HP0_FPD_0_awlen,
    S_AXI_HP0_FPD_0_awlock,
    S_AXI_HP0_FPD_0_awprot,
    S_AXI_HP0_FPD_0_awqos,
    S_AXI_HP0_FPD_0_awready,
    S_AXI_HP0_FPD_0_awsize,
    S_AXI_HP0_FPD_0_awuser,
    S_AXI_HP0_FPD_0_awvalid,
    S_AXI_HP0_FPD_0_bid,
    S_AXI_HP0_FPD_0_bready,
    S_AXI_HP0_FPD_0_bresp,
    S_AXI_HP0_FPD_0_bvalid,
    S_AXI_HP0_FPD_0_rdata,
    S_AXI_HP0_FPD_0_rid,
    S_AXI_HP0_FPD_0_rlast,
    S_AXI_HP0_FPD_0_rready,
    S_AXI_HP0_FPD_0_rresp,
    S_AXI_HP0_FPD_0_rvalid,
    S_AXI_HP0_FPD_0_wdata,
    S_AXI_HP0_FPD_0_wlast,
    S_AXI_HP0_FPD_0_wready,
    S_AXI_HP0_FPD_0_wstrb,
    S_AXI_HP0_FPD_0_wvalid,
    c0_init_calib_complete_0,
    pl_clk0_0,
    pl_clk1_0,
    pl_resetn_0,
    pl_resetn_1);
  output C0_DDR4_0_act_n;
  output [16:0]C0_DDR4_0_adr;
  output [1:0]C0_DDR4_0_ba;
  output [0:0]C0_DDR4_0_bg;
  output [0:0]C0_DDR4_0_ck_c;
  output [0:0]C0_DDR4_0_ck_t;
  output [0:0]C0_DDR4_0_cke;
  output [0:0]C0_DDR4_0_cs_n;
  inout [3:0]C0_DDR4_0_dm_n;
  inout [31:0]C0_DDR4_0_dq;
  inout [3:0]C0_DDR4_0_dqs_c;
  inout [3:0]C0_DDR4_0_dqs_t;
  output [0:0]C0_DDR4_0_odt;
  output C0_DDR4_0_reset_n;
  input C0_SYS_CLK_0_clk_n;
  input C0_SYS_CLK_0_clk_p;
  output [39:0]M_AXI_HPM0_LPD_0_araddr;
  output [2:0]M_AXI_HPM0_LPD_0_arprot;
  input M_AXI_HPM0_LPD_0_arready;
  output M_AXI_HPM0_LPD_0_arvalid;
  output [39:0]M_AXI_HPM0_LPD_0_awaddr;
  output [2:0]M_AXI_HPM0_LPD_0_awprot;
  input M_AXI_HPM0_LPD_0_awready;
  output M_AXI_HPM0_LPD_0_awvalid;
  output M_AXI_HPM0_LPD_0_bready;
  input [1:0]M_AXI_HPM0_LPD_0_bresp;
  input M_AXI_HPM0_LPD_0_bvalid;
  input [31:0]M_AXI_HPM0_LPD_0_rdata;
  output M_AXI_HPM0_LPD_0_rready;
  input [1:0]M_AXI_HPM0_LPD_0_rresp;
  input M_AXI_HPM0_LPD_0_rvalid;
  output [31:0]M_AXI_HPM0_LPD_0_wdata;
  input M_AXI_HPM0_LPD_0_wready;
  output [3:0]M_AXI_HPM0_LPD_0_wstrb;
  output M_AXI_HPM0_LPD_0_wvalid;
  input [39:0]S01_AXI_0_araddr;
  input [1:0]S01_AXI_0_arburst;
  input [3:0]S01_AXI_0_arcache;
  input [0:0]S01_AXI_0_arid;
  input [7:0]S01_AXI_0_arlen;
  input [0:0]S01_AXI_0_arlock;
  input [2:0]S01_AXI_0_arprot;
  input [3:0]S01_AXI_0_arqos;
  output S01_AXI_0_arready;
  input [2:0]S01_AXI_0_arsize;
  input S01_AXI_0_arvalid;
  input [39:0]S01_AXI_0_awaddr;
  input [1:0]S01_AXI_0_awburst;
  input [3:0]S01_AXI_0_awcache;
  input [0:0]S01_AXI_0_awid;
  input [7:0]S01_AXI_0_awlen;
  input [0:0]S01_AXI_0_awlock;
  input [2:0]S01_AXI_0_awprot;
  input [3:0]S01_AXI_0_awqos;
  output S01_AXI_0_awready;
  input [2:0]S01_AXI_0_awsize;
  input S01_AXI_0_awvalid;
  output [0:0]S01_AXI_0_bid;
  input S01_AXI_0_bready;
  output [1:0]S01_AXI_0_bresp;
  output S01_AXI_0_bvalid;
  output [255:0]S01_AXI_0_rdata;
  output [0:0]S01_AXI_0_rid;
  output S01_AXI_0_rlast;
  input S01_AXI_0_rready;
  output [1:0]S01_AXI_0_rresp;
  output S01_AXI_0_rvalid;
  input [255:0]S01_AXI_0_wdata;
  input S01_AXI_0_wlast;
  output S01_AXI_0_wready;
  input [31:0]S01_AXI_0_wstrb;
  input S01_AXI_0_wvalid;
  inout SPI_0_0_io0_io;
  inout SPI_0_0_io1_io;
  inout SPI_0_0_sck_io;
  inout SPI_0_0_ss_io;
  input [48:0]S_AXI_HP0_FPD_0_araddr;
  input [1:0]S_AXI_HP0_FPD_0_arburst;
  input [3:0]S_AXI_HP0_FPD_0_arcache;
  input [5:0]S_AXI_HP0_FPD_0_arid;
  input [7:0]S_AXI_HP0_FPD_0_arlen;
  input S_AXI_HP0_FPD_0_arlock;
  input [2:0]S_AXI_HP0_FPD_0_arprot;
  input [3:0]S_AXI_HP0_FPD_0_arqos;
  output S_AXI_HP0_FPD_0_arready;
  input [2:0]S_AXI_HP0_FPD_0_arsize;
  input S_AXI_HP0_FPD_0_aruser;
  input S_AXI_HP0_FPD_0_arvalid;
  input [48:0]S_AXI_HP0_FPD_0_awaddr;
  input [1:0]S_AXI_HP0_FPD_0_awburst;
  input [3:0]S_AXI_HP0_FPD_0_awcache;
  input [5:0]S_AXI_HP0_FPD_0_awid;
  input [7:0]S_AXI_HP0_FPD_0_awlen;
  input S_AXI_HP0_FPD_0_awlock;
  input [2:0]S_AXI_HP0_FPD_0_awprot;
  input [3:0]S_AXI_HP0_FPD_0_awqos;
  output S_AXI_HP0_FPD_0_awready;
  input [2:0]S_AXI_HP0_FPD_0_awsize;
  input S_AXI_HP0_FPD_0_awuser;
  input S_AXI_HP0_FPD_0_awvalid;
  output [5:0]S_AXI_HP0_FPD_0_bid;
  input S_AXI_HP0_FPD_0_bready;
  output [1:0]S_AXI_HP0_FPD_0_bresp;
  output S_AXI_HP0_FPD_0_bvalid;
  output [127:0]S_AXI_HP0_FPD_0_rdata;
  output [5:0]S_AXI_HP0_FPD_0_rid;
  output S_AXI_HP0_FPD_0_rlast;
  input S_AXI_HP0_FPD_0_rready;
  output [1:0]S_AXI_HP0_FPD_0_rresp;
  output S_AXI_HP0_FPD_0_rvalid;
  input [127:0]S_AXI_HP0_FPD_0_wdata;
  input S_AXI_HP0_FPD_0_wlast;
  output S_AXI_HP0_FPD_0_wready;
  input [15:0]S_AXI_HP0_FPD_0_wstrb;
  input S_AXI_HP0_FPD_0_wvalid;
  output c0_init_calib_complete_0;
  output pl_clk0_0;
  output pl_clk1_0;
  output [0:0]pl_resetn_0;
  output [0:0]pl_resetn_1;

  wire C0_DDR4_0_act_n;
  wire [16:0]C0_DDR4_0_adr;
  wire [1:0]C0_DDR4_0_ba;
  wire [0:0]C0_DDR4_0_bg;
  wire [0:0]C0_DDR4_0_ck_c;
  wire [0:0]C0_DDR4_0_ck_t;
  wire [0:0]C0_DDR4_0_cke;
  wire [0:0]C0_DDR4_0_cs_n;
  wire [3:0]C0_DDR4_0_dm_n;
  wire [31:0]C0_DDR4_0_dq;
  wire [3:0]C0_DDR4_0_dqs_c;
  wire [3:0]C0_DDR4_0_dqs_t;
  wire [0:0]C0_DDR4_0_odt;
  wire C0_DDR4_0_reset_n;
  wire C0_SYS_CLK_0_clk_n;
  wire C0_SYS_CLK_0_clk_p;
  wire [39:0]M_AXI_HPM0_LPD_0_araddr;
  wire [2:0]M_AXI_HPM0_LPD_0_arprot;
  wire M_AXI_HPM0_LPD_0_arready;
  wire M_AXI_HPM0_LPD_0_arvalid;
  wire [39:0]M_AXI_HPM0_LPD_0_awaddr;
  wire [2:0]M_AXI_HPM0_LPD_0_awprot;
  wire M_AXI_HPM0_LPD_0_awready;
  wire M_AXI_HPM0_LPD_0_awvalid;
  wire M_AXI_HPM0_LPD_0_bready;
  wire [1:0]M_AXI_HPM0_LPD_0_bresp;
  wire M_AXI_HPM0_LPD_0_bvalid;
  wire [31:0]M_AXI_HPM0_LPD_0_rdata;
  wire M_AXI_HPM0_LPD_0_rready;
  wire [1:0]M_AXI_HPM0_LPD_0_rresp;
  wire M_AXI_HPM0_LPD_0_rvalid;
  wire [31:0]M_AXI_HPM0_LPD_0_wdata;
  wire M_AXI_HPM0_LPD_0_wready;
  wire [3:0]M_AXI_HPM0_LPD_0_wstrb;
  wire M_AXI_HPM0_LPD_0_wvalid;
  wire [39:0]S01_AXI_0_araddr;
  wire [1:0]S01_AXI_0_arburst;
  wire [3:0]S01_AXI_0_arcache;
  wire [0:0]S01_AXI_0_arid;
  wire [7:0]S01_AXI_0_arlen;
  wire [0:0]S01_AXI_0_arlock;
  wire [2:0]S01_AXI_0_arprot;
  wire [3:0]S01_AXI_0_arqos;
  wire S01_AXI_0_arready;
  wire [2:0]S01_AXI_0_arsize;
  wire S01_AXI_0_arvalid;
  wire [39:0]S01_AXI_0_awaddr;
  wire [1:0]S01_AXI_0_awburst;
  wire [3:0]S01_AXI_0_awcache;
  wire [0:0]S01_AXI_0_awid;
  wire [7:0]S01_AXI_0_awlen;
  wire [0:0]S01_AXI_0_awlock;
  wire [2:0]S01_AXI_0_awprot;
  wire [3:0]S01_AXI_0_awqos;
  wire S01_AXI_0_awready;
  wire [2:0]S01_AXI_0_awsize;
  wire S01_AXI_0_awvalid;
  wire [0:0]S01_AXI_0_bid;
  wire S01_AXI_0_bready;
  wire [1:0]S01_AXI_0_bresp;
  wire S01_AXI_0_bvalid;
  wire [255:0]S01_AXI_0_rdata;
  wire [0:0]S01_AXI_0_rid;
  wire S01_AXI_0_rlast;
  wire S01_AXI_0_rready;
  wire [1:0]S01_AXI_0_rresp;
  wire S01_AXI_0_rvalid;
  wire [255:0]S01_AXI_0_wdata;
  wire S01_AXI_0_wlast;
  wire S01_AXI_0_wready;
  wire [31:0]S01_AXI_0_wstrb;
  wire S01_AXI_0_wvalid;
  wire SPI_0_0_io0_i;
  wire SPI_0_0_io0_io;
  wire SPI_0_0_io0_o;
  wire SPI_0_0_io0_t;
  wire SPI_0_0_io1_i;
  wire SPI_0_0_io1_io;
  wire SPI_0_0_io1_o;
  wire SPI_0_0_io1_t;
  wire SPI_0_0_sck_i;
  wire SPI_0_0_sck_io;
  wire SPI_0_0_sck_o;
  wire SPI_0_0_sck_t;
  wire SPI_0_0_ss_i;
  wire SPI_0_0_ss_io;
  wire SPI_0_0_ss_o;
  wire SPI_0_0_ss_t;
  wire [48:0]S_AXI_HP0_FPD_0_araddr;
  wire [1:0]S_AXI_HP0_FPD_0_arburst;
  wire [3:0]S_AXI_HP0_FPD_0_arcache;
  wire [5:0]S_AXI_HP0_FPD_0_arid;
  wire [7:0]S_AXI_HP0_FPD_0_arlen;
  wire S_AXI_HP0_FPD_0_arlock;
  wire [2:0]S_AXI_HP0_FPD_0_arprot;
  wire [3:0]S_AXI_HP0_FPD_0_arqos;
  wire S_AXI_HP0_FPD_0_arready;
  wire [2:0]S_AXI_HP0_FPD_0_arsize;
  wire S_AXI_HP0_FPD_0_aruser;
  wire S_AXI_HP0_FPD_0_arvalid;
  wire [48:0]S_AXI_HP0_FPD_0_awaddr;
  wire [1:0]S_AXI_HP0_FPD_0_awburst;
  wire [3:0]S_AXI_HP0_FPD_0_awcache;
  wire [5:0]S_AXI_HP0_FPD_0_awid;
  wire [7:0]S_AXI_HP0_FPD_0_awlen;
  wire S_AXI_HP0_FPD_0_awlock;
  wire [2:0]S_AXI_HP0_FPD_0_awprot;
  wire [3:0]S_AXI_HP0_FPD_0_awqos;
  wire S_AXI_HP0_FPD_0_awready;
  wire [2:0]S_AXI_HP0_FPD_0_awsize;
  wire S_AXI_HP0_FPD_0_awuser;
  wire S_AXI_HP0_FPD_0_awvalid;
  wire [5:0]S_AXI_HP0_FPD_0_bid;
  wire S_AXI_HP0_FPD_0_bready;
  wire [1:0]S_AXI_HP0_FPD_0_bresp;
  wire S_AXI_HP0_FPD_0_bvalid;
  wire [127:0]S_AXI_HP0_FPD_0_rdata;
  wire [5:0]S_AXI_HP0_FPD_0_rid;
  wire S_AXI_HP0_FPD_0_rlast;
  wire S_AXI_HP0_FPD_0_rready;
  wire [1:0]S_AXI_HP0_FPD_0_rresp;
  wire S_AXI_HP0_FPD_0_rvalid;
  wire [127:0]S_AXI_HP0_FPD_0_wdata;
  wire S_AXI_HP0_FPD_0_wlast;
  wire S_AXI_HP0_FPD_0_wready;
  wire [15:0]S_AXI_HP0_FPD_0_wstrb;
  wire S_AXI_HP0_FPD_0_wvalid;
  wire c0_init_calib_complete_0;
  wire pl_clk0_0;
  wire pl_clk1_0;
  wire [0:0]pl_resetn_0;
  wire [0:0]pl_resetn_1;

  IOBUF SPI_0_0_io0_iobuf
       (.I(SPI_0_0_io0_o),
        .IO(SPI_0_0_io0_io),
        .O(SPI_0_0_io0_i),
        .T(SPI_0_0_io0_t));
  IOBUF SPI_0_0_io1_iobuf
       (.I(SPI_0_0_io1_o),
        .IO(SPI_0_0_io1_io),
        .O(SPI_0_0_io1_i),
        .T(SPI_0_0_io1_t));
  IOBUF SPI_0_0_sck_iobuf
       (.I(SPI_0_0_sck_o),
        .IO(SPI_0_0_sck_io),
        .O(SPI_0_0_sck_i),
        .T(SPI_0_0_sck_t));
  IOBUF SPI_0_0_ss_iobuf
       (.I(SPI_0_0_ss_o),
        .IO(SPI_0_0_ss_io),
        .O(SPI_0_0_ss_i),
        .T(SPI_0_0_ss_t));
  design_1 design_1_i
       (.C0_DDR4_0_act_n(C0_DDR4_0_act_n),
        .C0_DDR4_0_adr(C0_DDR4_0_adr),
        .C0_DDR4_0_ba(C0_DDR4_0_ba),
        .C0_DDR4_0_bg(C0_DDR4_0_bg),
        .C0_DDR4_0_ck_c(C0_DDR4_0_ck_c),
        .C0_DDR4_0_ck_t(C0_DDR4_0_ck_t),
        .C0_DDR4_0_cke(C0_DDR4_0_cke),
        .C0_DDR4_0_cs_n(C0_DDR4_0_cs_n),
        .C0_DDR4_0_dm_n(C0_DDR4_0_dm_n),
        .C0_DDR4_0_dq(C0_DDR4_0_dq),
        .C0_DDR4_0_dqs_c(C0_DDR4_0_dqs_c),
        .C0_DDR4_0_dqs_t(C0_DDR4_0_dqs_t),
        .C0_DDR4_0_odt(C0_DDR4_0_odt),
        .C0_DDR4_0_reset_n(C0_DDR4_0_reset_n),
        .C0_SYS_CLK_0_clk_n(C0_SYS_CLK_0_clk_n),
        .C0_SYS_CLK_0_clk_p(C0_SYS_CLK_0_clk_p),
        .M_AXI_HPM0_LPD_0_araddr(M_AXI_HPM0_LPD_0_araddr),
        .M_AXI_HPM0_LPD_0_arprot(M_AXI_HPM0_LPD_0_arprot),
        .M_AXI_HPM0_LPD_0_arready(M_AXI_HPM0_LPD_0_arready),
        .M_AXI_HPM0_LPD_0_arvalid(M_AXI_HPM0_LPD_0_arvalid),
        .M_AXI_HPM0_LPD_0_awaddr(M_AXI_HPM0_LPD_0_awaddr),
        .M_AXI_HPM0_LPD_0_awprot(M_AXI_HPM0_LPD_0_awprot),
        .M_AXI_HPM0_LPD_0_awready(M_AXI_HPM0_LPD_0_awready),
        .M_AXI_HPM0_LPD_0_awvalid(M_AXI_HPM0_LPD_0_awvalid),
        .M_AXI_HPM0_LPD_0_bready(M_AXI_HPM0_LPD_0_bready),
        .M_AXI_HPM0_LPD_0_bresp(M_AXI_HPM0_LPD_0_bresp),
        .M_AXI_HPM0_LPD_0_bvalid(M_AXI_HPM0_LPD_0_bvalid),
        .M_AXI_HPM0_LPD_0_rdata(M_AXI_HPM0_LPD_0_rdata),
        .M_AXI_HPM0_LPD_0_rready(M_AXI_HPM0_LPD_0_rready),
        .M_AXI_HPM0_LPD_0_rresp(M_AXI_HPM0_LPD_0_rresp),
        .M_AXI_HPM0_LPD_0_rvalid(M_AXI_HPM0_LPD_0_rvalid),
        .M_AXI_HPM0_LPD_0_wdata(M_AXI_HPM0_LPD_0_wdata),
        .M_AXI_HPM0_LPD_0_wready(M_AXI_HPM0_LPD_0_wready),
        .M_AXI_HPM0_LPD_0_wstrb(M_AXI_HPM0_LPD_0_wstrb),
        .M_AXI_HPM0_LPD_0_wvalid(M_AXI_HPM0_LPD_0_wvalid),
        .S01_AXI_0_araddr(S01_AXI_0_araddr),
        .S01_AXI_0_arburst(S01_AXI_0_arburst),
        .S01_AXI_0_arcache(S01_AXI_0_arcache),
        .S01_AXI_0_arid(S01_AXI_0_arid),
        .S01_AXI_0_arlen(S01_AXI_0_arlen),
        .S01_AXI_0_arlock(S01_AXI_0_arlock),
        .S01_AXI_0_arprot(S01_AXI_0_arprot),
        .S01_AXI_0_arqos(S01_AXI_0_arqos),
        .S01_AXI_0_arready(S01_AXI_0_arready),
        .S01_AXI_0_arsize(S01_AXI_0_arsize),
        .S01_AXI_0_arvalid(S01_AXI_0_arvalid),
        .S01_AXI_0_awaddr(S01_AXI_0_awaddr),
        .S01_AXI_0_awburst(S01_AXI_0_awburst),
        .S01_AXI_0_awcache(S01_AXI_0_awcache),
        .S01_AXI_0_awid(S01_AXI_0_awid),
        .S01_AXI_0_awlen(S01_AXI_0_awlen),
        .S01_AXI_0_awlock(S01_AXI_0_awlock),
        .S01_AXI_0_awprot(S01_AXI_0_awprot),
        .S01_AXI_0_awqos(S01_AXI_0_awqos),
        .S01_AXI_0_awready(S01_AXI_0_awready),
        .S01_AXI_0_awsize(S01_AXI_0_awsize),
        .S01_AXI_0_awvalid(S01_AXI_0_awvalid),
        .S01_AXI_0_bid(S01_AXI_0_bid),
        .S01_AXI_0_bready(S01_AXI_0_bready),
        .S01_AXI_0_bresp(S01_AXI_0_bresp),
        .S01_AXI_0_bvalid(S01_AXI_0_bvalid),
        .S01_AXI_0_rdata(S01_AXI_0_rdata),
        .S01_AXI_0_rid(S01_AXI_0_rid),
        .S01_AXI_0_rlast(S01_AXI_0_rlast),
        .S01_AXI_0_rready(S01_AXI_0_rready),
        .S01_AXI_0_rresp(S01_AXI_0_rresp),
        .S01_AXI_0_rvalid(S01_AXI_0_rvalid),
        .S01_AXI_0_wdata(S01_AXI_0_wdata),
        .S01_AXI_0_wlast(S01_AXI_0_wlast),
        .S01_AXI_0_wready(S01_AXI_0_wready),
        .S01_AXI_0_wstrb(S01_AXI_0_wstrb),
        .S01_AXI_0_wvalid(S01_AXI_0_wvalid),
        .SPI_0_0_io0_i(SPI_0_0_io0_i),
        .SPI_0_0_io0_o(SPI_0_0_io0_o),
        .SPI_0_0_io0_t(SPI_0_0_io0_t),
        .SPI_0_0_io1_i(SPI_0_0_io1_i),
        .SPI_0_0_io1_o(SPI_0_0_io1_o),
        .SPI_0_0_io1_t(SPI_0_0_io1_t),
        .SPI_0_0_sck_i(SPI_0_0_sck_i),
        .SPI_0_0_sck_o(SPI_0_0_sck_o),
        .SPI_0_0_sck_t(SPI_0_0_sck_t),
        .SPI_0_0_ss_i(SPI_0_0_ss_i),
        .SPI_0_0_ss_o(SPI_0_0_ss_o),
        .SPI_0_0_ss_t(SPI_0_0_ss_t),
        .S_AXI_HP0_FPD_0_araddr(S_AXI_HP0_FPD_0_araddr),
        .S_AXI_HP0_FPD_0_arburst(S_AXI_HP0_FPD_0_arburst),
        .S_AXI_HP0_FPD_0_arcache(S_AXI_HP0_FPD_0_arcache),
        .S_AXI_HP0_FPD_0_arid(S_AXI_HP0_FPD_0_arid),
        .S_AXI_HP0_FPD_0_arlen(S_AXI_HP0_FPD_0_arlen),
        .S_AXI_HP0_FPD_0_arlock(S_AXI_HP0_FPD_0_arlock),
        .S_AXI_HP0_FPD_0_arprot(S_AXI_HP0_FPD_0_arprot),
        .S_AXI_HP0_FPD_0_arqos(S_AXI_HP0_FPD_0_arqos),
        .S_AXI_HP0_FPD_0_arready(S_AXI_HP0_FPD_0_arready),
        .S_AXI_HP0_FPD_0_arsize(S_AXI_HP0_FPD_0_arsize),
        .S_AXI_HP0_FPD_0_aruser(S_AXI_HP0_FPD_0_aruser),
        .S_AXI_HP0_FPD_0_arvalid(S_AXI_HP0_FPD_0_arvalid),
        .S_AXI_HP0_FPD_0_awaddr(S_AXI_HP0_FPD_0_awaddr),
        .S_AXI_HP0_FPD_0_awburst(S_AXI_HP0_FPD_0_awburst),
        .S_AXI_HP0_FPD_0_awcache(S_AXI_HP0_FPD_0_awcache),
        .S_AXI_HP0_FPD_0_awid(S_AXI_HP0_FPD_0_awid),
        .S_AXI_HP0_FPD_0_awlen(S_AXI_HP0_FPD_0_awlen),
        .S_AXI_HP0_FPD_0_awlock(S_AXI_HP0_FPD_0_awlock),
        .S_AXI_HP0_FPD_0_awprot(S_AXI_HP0_FPD_0_awprot),
        .S_AXI_HP0_FPD_0_awqos(S_AXI_HP0_FPD_0_awqos),
        .S_AXI_HP0_FPD_0_awready(S_AXI_HP0_FPD_0_awready),
        .S_AXI_HP0_FPD_0_awsize(S_AXI_HP0_FPD_0_awsize),
        .S_AXI_HP0_FPD_0_awuser(S_AXI_HP0_FPD_0_awuser),
        .S_AXI_HP0_FPD_0_awvalid(S_AXI_HP0_FPD_0_awvalid),
        .S_AXI_HP0_FPD_0_bid(S_AXI_HP0_FPD_0_bid),
        .S_AXI_HP0_FPD_0_bready(S_AXI_HP0_FPD_0_bready),
        .S_AXI_HP0_FPD_0_bresp(S_AXI_HP0_FPD_0_bresp),
        .S_AXI_HP0_FPD_0_bvalid(S_AXI_HP0_FPD_0_bvalid),
        .S_AXI_HP0_FPD_0_rdata(S_AXI_HP0_FPD_0_rdata),
        .S_AXI_HP0_FPD_0_rid(S_AXI_HP0_FPD_0_rid),
        .S_AXI_HP0_FPD_0_rlast(S_AXI_HP0_FPD_0_rlast),
        .S_AXI_HP0_FPD_0_rready(S_AXI_HP0_FPD_0_rready),
        .S_AXI_HP0_FPD_0_rresp(S_AXI_HP0_FPD_0_rresp),
        .S_AXI_HP0_FPD_0_rvalid(S_AXI_HP0_FPD_0_rvalid),
        .S_AXI_HP0_FPD_0_wdata(S_AXI_HP0_FPD_0_wdata),
        .S_AXI_HP0_FPD_0_wlast(S_AXI_HP0_FPD_0_wlast),
        .S_AXI_HP0_FPD_0_wready(S_AXI_HP0_FPD_0_wready),
        .S_AXI_HP0_FPD_0_wstrb(S_AXI_HP0_FPD_0_wstrb),
        .S_AXI_HP0_FPD_0_wvalid(S_AXI_HP0_FPD_0_wvalid),
        .c0_init_calib_complete_0(c0_init_calib_complete_0),
        .pl_clk0_0(pl_clk0_0),
        .pl_clk1_0(pl_clk1_0),
        .pl_resetn_0(pl_resetn_0),
        .pl_resetn_1(pl_resetn_1));
endmodule
