// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu May 15 20:03:26 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top axi_datamover_rd -prefix
//               axi_datamover_rd_ axi_datamover_rd_stub.v
// Design      : axi_datamover_rd
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu47dr-ffve1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axi_datamover,Vivado 2022.2" *)
module axi_datamover_rd(m_axi_mm2s_aclk, m_axi_mm2s_aresetn, 
  mm2s_err, m_axis_mm2s_cmdsts_aclk, m_axis_mm2s_cmdsts_aresetn, s_axis_mm2s_cmd_tvalid, 
  s_axis_mm2s_cmd_tready, s_axis_mm2s_cmd_tdata, m_axis_mm2s_sts_tvalid, 
  m_axis_mm2s_sts_tready, m_axis_mm2s_sts_tdata, m_axis_mm2s_sts_tkeep, 
  m_axis_mm2s_sts_tlast, m_axi_mm2s_arid, m_axi_mm2s_araddr, m_axi_mm2s_arlen, 
  m_axi_mm2s_arsize, m_axi_mm2s_arburst, m_axi_mm2s_arprot, m_axi_mm2s_arcache, 
  m_axi_mm2s_aruser, m_axi_mm2s_arvalid, m_axi_mm2s_arready, m_axi_mm2s_rdata, 
  m_axi_mm2s_rresp, m_axi_mm2s_rlast, m_axi_mm2s_rvalid, m_axi_mm2s_rready, 
  m_axis_mm2s_tdata, m_axis_mm2s_tkeep, m_axis_mm2s_tlast, m_axis_mm2s_tvalid, 
  m_axis_mm2s_tready)
/* synthesis syn_black_box black_box_pad_pin="m_axi_mm2s_aclk,m_axi_mm2s_aresetn,mm2s_err,m_axis_mm2s_cmdsts_aclk,m_axis_mm2s_cmdsts_aresetn,s_axis_mm2s_cmd_tvalid,s_axis_mm2s_cmd_tready,s_axis_mm2s_cmd_tdata[71:0],m_axis_mm2s_sts_tvalid,m_axis_mm2s_sts_tready,m_axis_mm2s_sts_tdata[7:0],m_axis_mm2s_sts_tkeep[0:0],m_axis_mm2s_sts_tlast,m_axi_mm2s_arid[3:0],m_axi_mm2s_araddr[31:0],m_axi_mm2s_arlen[7:0],m_axi_mm2s_arsize[2:0],m_axi_mm2s_arburst[1:0],m_axi_mm2s_arprot[2:0],m_axi_mm2s_arcache[3:0],m_axi_mm2s_aruser[3:0],m_axi_mm2s_arvalid,m_axi_mm2s_arready,m_axi_mm2s_rdata[255:0],m_axi_mm2s_rresp[1:0],m_axi_mm2s_rlast,m_axi_mm2s_rvalid,m_axi_mm2s_rready,m_axis_mm2s_tdata[255:0],m_axis_mm2s_tkeep[31:0],m_axis_mm2s_tlast,m_axis_mm2s_tvalid,m_axis_mm2s_tready" */;
  input m_axi_mm2s_aclk;
  input m_axi_mm2s_aresetn;
  output mm2s_err;
  input m_axis_mm2s_cmdsts_aclk;
  input m_axis_mm2s_cmdsts_aresetn;
  input s_axis_mm2s_cmd_tvalid;
  output s_axis_mm2s_cmd_tready;
  input [71:0]s_axis_mm2s_cmd_tdata;
  output m_axis_mm2s_sts_tvalid;
  input m_axis_mm2s_sts_tready;
  output [7:0]m_axis_mm2s_sts_tdata;
  output [0:0]m_axis_mm2s_sts_tkeep;
  output m_axis_mm2s_sts_tlast;
  output [3:0]m_axi_mm2s_arid;
  output [31:0]m_axi_mm2s_araddr;
  output [7:0]m_axi_mm2s_arlen;
  output [2:0]m_axi_mm2s_arsize;
  output [1:0]m_axi_mm2s_arburst;
  output [2:0]m_axi_mm2s_arprot;
  output [3:0]m_axi_mm2s_arcache;
  output [3:0]m_axi_mm2s_aruser;
  output m_axi_mm2s_arvalid;
  input m_axi_mm2s_arready;
  input [255:0]m_axi_mm2s_rdata;
  input [1:0]m_axi_mm2s_rresp;
  input m_axi_mm2s_rlast;
  input m_axi_mm2s_rvalid;
  output m_axi_mm2s_rready;
  output [255:0]m_axis_mm2s_tdata;
  output [31:0]m_axis_mm2s_tkeep;
  output m_axis_mm2s_tlast;
  output m_axis_mm2s_tvalid;
  input m_axis_mm2s_tready;
endmodule
