// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Jul 27 21:56:17 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/git_resp/xilinx/rfsoc/rfsoc.gen/sources_1/ip/fifo_gen_afifo_64b_32b/fifo_gen_afifo_64b_32b_sim_netlist.v
// Design      : fifo_gen_afifo_64b_32b
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu47dr-ffve1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_gen_afifo_64b_32b,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fifo_gen_afifo_64b_32b
   (wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  input wr_rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  input rd_rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [63:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [7:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [7:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "8" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "64" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "253" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "252" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "8" *) 
  (* C_WR_DEPTH = "256" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "8" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_gen_afifo_64b_32b_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[7:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(rd_rst),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[7:0]),
        .wr_en(wr_en),
        .wr_rst(wr_rst),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "8" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_gen_afifo_64b_32b_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [7:0]src_in_bin;
  input dest_clk;
  output [7:0]dest_out_bin;

  wire [7:0]async_path;
  wire [6:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[1] ;
  wire [7:0]dest_out_bin;
  wire [6:0]gray_enc;
  wire src_clk;
  wire [7:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[2]),
        .I2(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[2]),
        .O(binval[1]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[7]),
        .Q(async_path[7]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "9" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_gen_afifo_64b_32b_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [8:0]src_in_bin;
  input dest_clk;
  output [8:0]dest_out_bin;

  wire [8:0]async_path;
  wire [7:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[1] ;
  wire [8:0]dest_out_bin;
  wire [7:0]gray_enc;
  wire src_clk;
  wire [8:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[3]),
        .O(binval[2]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .I5(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[8]),
        .Q(async_path[8]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 108784)
`pragma protect data_block
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
XcqO5laxwJnHuDvMDmrD4uezqrge2tydv5BwRA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
