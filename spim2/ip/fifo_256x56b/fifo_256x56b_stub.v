// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Oct 18 12:38:02 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/git_resp/xilinx/spim2/spim2.gen/sources_1/ip/fifo_256x56b/fifo_256x56b_stub.v
// Design      : fifo_256x56b
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *)
module fifo_256x56b(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[55:0],wr_en,rd_en,dout[55:0],full,empty" */;
  input clk;
  input srst;
  input [55:0]din;
  input wr_en;
  input rd_en;
  output [55:0]dout;
  output full;
  output empty;
endmodule
