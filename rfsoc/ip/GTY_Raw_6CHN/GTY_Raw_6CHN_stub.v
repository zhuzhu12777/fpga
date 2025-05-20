// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu May 15 19:56:15 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top GTY_Raw_6CHN -prefix
//               GTY_Raw_6CHN_ GTY_Raw_6CHN_stub.v
// Design      : GTY_Raw_6CHN
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu47dr-ffve1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "GTY_Raw_6CHN_gtwizard_top,Vivado 2022.2" *)
module GTY_Raw_6CHN(gtwiz_userclk_tx_reset_in, 
  gtwiz_userclk_tx_active_in, gtwiz_userclk_rx_active_in, gtwiz_reset_clk_freerun_in, 
  gtwiz_reset_all_in, gtwiz_reset_tx_pll_and_datapath_in, gtwiz_reset_tx_datapath_in, 
  gtwiz_reset_rx_pll_and_datapath_in, gtwiz_reset_rx_datapath_in, 
  gtwiz_reset_rx_cdr_stable_out, gtwiz_reset_tx_done_out, gtwiz_reset_rx_done_out, 
  gtwiz_userdata_tx_in, gtwiz_userdata_rx_out, drpclk_in, gtrefclk0_in, gtyrxn_in, gtyrxp_in, 
  rxusrclk_in, rxusrclk2_in, txusrclk_in, txusrclk2_in, gtpowergood_out, gtytxn_out, 
  gtytxp_out, rxoutclk_out, rxpmaresetdone_out, txoutclk_out, txpmaresetdone_out)
/* synthesis syn_black_box black_box_pad_pin="gtwiz_userclk_tx_reset_in[0:0],gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[191:0],gtwiz_userdata_rx_out[191:0],drpclk_in[5:0],gtrefclk0_in[5:0],gtyrxn_in[5:0],gtyrxp_in[5:0],rxusrclk_in[5:0],rxusrclk2_in[5:0],txusrclk_in[5:0],txusrclk2_in[5:0],gtpowergood_out[5:0],gtytxn_out[5:0],gtytxp_out[5:0],rxoutclk_out[5:0],rxpmaresetdone_out[5:0],txoutclk_out[5:0],txpmaresetdone_out[5:0]" */;
  input [0:0]gtwiz_userclk_tx_reset_in;
  input [0:0]gtwiz_userclk_tx_active_in;
  input [0:0]gtwiz_userclk_rx_active_in;
  input [0:0]gtwiz_reset_clk_freerun_in;
  input [0:0]gtwiz_reset_all_in;
  input [0:0]gtwiz_reset_tx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_tx_datapath_in;
  input [0:0]gtwiz_reset_rx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_rx_datapath_in;
  output [0:0]gtwiz_reset_rx_cdr_stable_out;
  output [0:0]gtwiz_reset_tx_done_out;
  output [0:0]gtwiz_reset_rx_done_out;
  input [191:0]gtwiz_userdata_tx_in;
  output [191:0]gtwiz_userdata_rx_out;
  input [5:0]drpclk_in;
  input [5:0]gtrefclk0_in;
  input [5:0]gtyrxn_in;
  input [5:0]gtyrxp_in;
  input [5:0]rxusrclk_in;
  input [5:0]rxusrclk2_in;
  input [5:0]txusrclk_in;
  input [5:0]txusrclk2_in;
  output [5:0]gtpowergood_out;
  output [5:0]gtytxn_out;
  output [5:0]gtytxp_out;
  output [5:0]rxoutclk_out;
  output [5:0]rxpmaresetdone_out;
  output [5:0]txoutclk_out;
  output [5:0]txpmaresetdone_out;
endmodule
