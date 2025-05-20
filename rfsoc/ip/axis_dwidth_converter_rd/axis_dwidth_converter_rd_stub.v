// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu May 15 20:01:07 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top axis_dwidth_converter_rd -prefix
//               axis_dwidth_converter_rd_ axis_dwidth_converter_rd_stub.v
// Design      : axis_dwidth_converter_rd
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu47dr-ffve1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_dwidth_converter_v1_1_26_axis_dwidth_converter,Vivado 2022.2" *)
module axis_dwidth_converter_rd(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[255:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[127:0]" */;
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [255:0]s_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  output [127:0]m_axis_tdata;
endmodule
