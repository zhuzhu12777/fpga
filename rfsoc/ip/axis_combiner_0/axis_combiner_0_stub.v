// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun May  4 21:49:53 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top axis_combiner_0 -prefix
//               axis_combiner_0_ axis_combiner_0_stub.v
// Design      : axis_combiner_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu47dr-ffve1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_combiner_v1_1_25_top,Vivado 2022.2" *)
module axis_combiner_0(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid[5:0],s_axis_tready[5:0],s_axis_tdata[191:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[191:0]" */;
  input aclk;
  input aresetn;
  input [5:0]s_axis_tvalid;
  output [5:0]s_axis_tready;
  input [191:0]s_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  output [191:0]m_axis_tdata;
endmodule
