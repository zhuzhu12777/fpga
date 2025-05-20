// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu May 15 19:58:46 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top axis_dwidth_converter_wr -prefix
//               axis_dwidth_converter_wr_ axis_dwidth_converter_wr_sim_netlist.v
// Design      : axis_dwidth_converter_wr
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu47dr-ffve1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* C_AXIS_SIGNAL_SET = "3" *) (* C_AXIS_TDEST_WIDTH = "1" *) (* C_AXIS_TID_WIDTH = "1" *) 
(* C_FAMILY = "zynquplus" *) (* C_M_AXIS_TDATA_WIDTH = "128" *) (* C_M_AXIS_TUSER_WIDTH = "1" *) 
(* C_S_AXIS_TDATA_WIDTH = "192" *) (* C_S_AXIS_TUSER_WIDTH = "1" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TREADY = "0" *) 
(* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TDATA = "2" *) 
(* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TREADY = "1" *) (* G_MASK_SS_TSTRB = "4" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_INFO = "0" *) 
(* G_TASK_SEVERITY_WARNING = "1" *) (* P_AXIS_SIGNAL_SET = "32'b00000000000000000000000000000011" *) (* P_D1_REG_CONFIG = "0" *) 
(* P_D1_TUSER_WIDTH = "24" *) (* P_D2_TDATA_WIDTH = "384" *) (* P_D2_TUSER_WIDTH = "48" *) 
(* P_D3_REG_CONFIG = "0" *) (* P_D3_TUSER_WIDTH = "16" *) (* P_M_RATIO = "3" *) 
(* P_SS_TKEEP_REQUIRED = "0" *) (* P_S_RATIO = "2" *) 
module axis_dwidth_converter_wr_axis_dwidth_converter_v1_1_26_axis_dwidth_converter
   (aclk,
    aresetn,
    aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser);
  input aclk;
  input aresetn;
  input aclken;
  input s_axis_tvalid;
  output s_axis_tready;
  input [191:0]s_axis_tdata;
  input [23:0]s_axis_tstrb;
  input [23:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [127:0]m_axis_tdata;
  output [15:0]m_axis_tstrb;
  output [15:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;

  wire \<const0> ;
  wire aclk;
  wire areset_r;
  wire aresetn;
  wire [383:0]d2_data;
  wire d2_ready;
  wire d2_valid;
  wire [127:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire p_0_in;
  wire [191:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;

  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[15] = \<const0> ;
  assign m_axis_tkeep[14] = \<const0> ;
  assign m_axis_tkeep[13] = \<const0> ;
  assign m_axis_tkeep[12] = \<const0> ;
  assign m_axis_tkeep[11] = \<const0> ;
  assign m_axis_tkeep[10] = \<const0> ;
  assign m_axis_tkeep[9] = \<const0> ;
  assign m_axis_tkeep[8] = \<const0> ;
  assign m_axis_tkeep[7] = \<const0> ;
  assign m_axis_tkeep[6] = \<const0> ;
  assign m_axis_tkeep[5] = \<const0> ;
  assign m_axis_tkeep[4] = \<const0> ;
  assign m_axis_tkeep[3] = \<const0> ;
  assign m_axis_tkeep[2] = \<const0> ;
  assign m_axis_tkeep[1] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[15] = \<const0> ;
  assign m_axis_tstrb[14] = \<const0> ;
  assign m_axis_tstrb[13] = \<const0> ;
  assign m_axis_tstrb[12] = \<const0> ;
  assign m_axis_tstrb[11] = \<const0> ;
  assign m_axis_tstrb[10] = \<const0> ;
  assign m_axis_tstrb[9] = \<const0> ;
  assign m_axis_tstrb[8] = \<const0> ;
  assign m_axis_tstrb[7] = \<const0> ;
  assign m_axis_tstrb[6] = \<const0> ;
  assign m_axis_tstrb[5] = \<const0> ;
  assign m_axis_tstrb[4] = \<const0> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    areset_r_i_1
       (.I0(aresetn),
        .O(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    areset_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(areset_r),
        .R(1'b0));
  axis_dwidth_converter_wr_axis_dwidth_converter_v1_1_26_axisc_downsizer \gen_downsizer_conversion.axisc_downsizer_0 
       (.D(d2_data),
        .aclk(aclk),
        .areset_r(areset_r),
        .d2_ready(d2_ready),
        .d2_valid(d2_valid),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .\state_reg[1]_0 (m_axis_tvalid));
  axis_dwidth_converter_wr_axis_dwidth_converter_v1_1_26_axisc_upsizer \gen_upsizer_conversion.axisc_upsizer_0 
       (.D(d2_data),
        .aclk(aclk),
        .areset_r(areset_r),
        .d2_ready(d2_ready),
        .d2_valid(d2_valid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid),
        .\state_reg[0]_0 (s_axis_tready));
endmodule

module axis_dwidth_converter_wr_axis_dwidth_converter_v1_1_26_axisc_downsizer
   (\state_reg[1]_0 ,
    d2_ready,
    m_axis_tdata,
    aclk,
    areset_r,
    m_axis_tready,
    d2_valid,
    D);
  output \state_reg[1]_0 ;
  output d2_ready;
  output [127:0]m_axis_tdata;
  input aclk;
  input areset_r;
  input m_axis_tready;
  input d2_valid;
  input [383:0]D;

  wire [383:0]D;
  wire aclk;
  wire areset_r;
  wire d2_ready;
  wire d2_valid;
  wire [127:0]m_axis_tdata;
  wire m_axis_tready;
  wire [383:0]p_0_in1_in;
  wire [1:0]p_1_in;
  wire \r0_data_reg_n_0_[256] ;
  wire \r0_data_reg_n_0_[257] ;
  wire \r0_data_reg_n_0_[258] ;
  wire \r0_data_reg_n_0_[259] ;
  wire \r0_data_reg_n_0_[260] ;
  wire \r0_data_reg_n_0_[261] ;
  wire \r0_data_reg_n_0_[262] ;
  wire \r0_data_reg_n_0_[263] ;
  wire \r0_data_reg_n_0_[264] ;
  wire \r0_data_reg_n_0_[265] ;
  wire \r0_data_reg_n_0_[266] ;
  wire \r0_data_reg_n_0_[267] ;
  wire \r0_data_reg_n_0_[268] ;
  wire \r0_data_reg_n_0_[269] ;
  wire \r0_data_reg_n_0_[270] ;
  wire \r0_data_reg_n_0_[271] ;
  wire \r0_data_reg_n_0_[272] ;
  wire \r0_data_reg_n_0_[273] ;
  wire \r0_data_reg_n_0_[274] ;
  wire \r0_data_reg_n_0_[275] ;
  wire \r0_data_reg_n_0_[276] ;
  wire \r0_data_reg_n_0_[277] ;
  wire \r0_data_reg_n_0_[278] ;
  wire \r0_data_reg_n_0_[279] ;
  wire \r0_data_reg_n_0_[280] ;
  wire \r0_data_reg_n_0_[281] ;
  wire \r0_data_reg_n_0_[282] ;
  wire \r0_data_reg_n_0_[283] ;
  wire \r0_data_reg_n_0_[284] ;
  wire \r0_data_reg_n_0_[285] ;
  wire \r0_data_reg_n_0_[286] ;
  wire \r0_data_reg_n_0_[287] ;
  wire \r0_data_reg_n_0_[288] ;
  wire \r0_data_reg_n_0_[289] ;
  wire \r0_data_reg_n_0_[290] ;
  wire \r0_data_reg_n_0_[291] ;
  wire \r0_data_reg_n_0_[292] ;
  wire \r0_data_reg_n_0_[293] ;
  wire \r0_data_reg_n_0_[294] ;
  wire \r0_data_reg_n_0_[295] ;
  wire \r0_data_reg_n_0_[296] ;
  wire \r0_data_reg_n_0_[297] ;
  wire \r0_data_reg_n_0_[298] ;
  wire \r0_data_reg_n_0_[299] ;
  wire \r0_data_reg_n_0_[300] ;
  wire \r0_data_reg_n_0_[301] ;
  wire \r0_data_reg_n_0_[302] ;
  wire \r0_data_reg_n_0_[303] ;
  wire \r0_data_reg_n_0_[304] ;
  wire \r0_data_reg_n_0_[305] ;
  wire \r0_data_reg_n_0_[306] ;
  wire \r0_data_reg_n_0_[307] ;
  wire \r0_data_reg_n_0_[308] ;
  wire \r0_data_reg_n_0_[309] ;
  wire \r0_data_reg_n_0_[310] ;
  wire \r0_data_reg_n_0_[311] ;
  wire \r0_data_reg_n_0_[312] ;
  wire \r0_data_reg_n_0_[313] ;
  wire \r0_data_reg_n_0_[314] ;
  wire \r0_data_reg_n_0_[315] ;
  wire \r0_data_reg_n_0_[316] ;
  wire \r0_data_reg_n_0_[317] ;
  wire \r0_data_reg_n_0_[318] ;
  wire \r0_data_reg_n_0_[319] ;
  wire \r0_data_reg_n_0_[320] ;
  wire \r0_data_reg_n_0_[321] ;
  wire \r0_data_reg_n_0_[322] ;
  wire \r0_data_reg_n_0_[323] ;
  wire \r0_data_reg_n_0_[324] ;
  wire \r0_data_reg_n_0_[325] ;
  wire \r0_data_reg_n_0_[326] ;
  wire \r0_data_reg_n_0_[327] ;
  wire \r0_data_reg_n_0_[328] ;
  wire \r0_data_reg_n_0_[329] ;
  wire \r0_data_reg_n_0_[330] ;
  wire \r0_data_reg_n_0_[331] ;
  wire \r0_data_reg_n_0_[332] ;
  wire \r0_data_reg_n_0_[333] ;
  wire \r0_data_reg_n_0_[334] ;
  wire \r0_data_reg_n_0_[335] ;
  wire \r0_data_reg_n_0_[336] ;
  wire \r0_data_reg_n_0_[337] ;
  wire \r0_data_reg_n_0_[338] ;
  wire \r0_data_reg_n_0_[339] ;
  wire \r0_data_reg_n_0_[340] ;
  wire \r0_data_reg_n_0_[341] ;
  wire \r0_data_reg_n_0_[342] ;
  wire \r0_data_reg_n_0_[343] ;
  wire \r0_data_reg_n_0_[344] ;
  wire \r0_data_reg_n_0_[345] ;
  wire \r0_data_reg_n_0_[346] ;
  wire \r0_data_reg_n_0_[347] ;
  wire \r0_data_reg_n_0_[348] ;
  wire \r0_data_reg_n_0_[349] ;
  wire \r0_data_reg_n_0_[350] ;
  wire \r0_data_reg_n_0_[351] ;
  wire \r0_data_reg_n_0_[352] ;
  wire \r0_data_reg_n_0_[353] ;
  wire \r0_data_reg_n_0_[354] ;
  wire \r0_data_reg_n_0_[355] ;
  wire \r0_data_reg_n_0_[356] ;
  wire \r0_data_reg_n_0_[357] ;
  wire \r0_data_reg_n_0_[358] ;
  wire \r0_data_reg_n_0_[359] ;
  wire \r0_data_reg_n_0_[360] ;
  wire \r0_data_reg_n_0_[361] ;
  wire \r0_data_reg_n_0_[362] ;
  wire \r0_data_reg_n_0_[363] ;
  wire \r0_data_reg_n_0_[364] ;
  wire \r0_data_reg_n_0_[365] ;
  wire \r0_data_reg_n_0_[366] ;
  wire \r0_data_reg_n_0_[367] ;
  wire \r0_data_reg_n_0_[368] ;
  wire \r0_data_reg_n_0_[369] ;
  wire \r0_data_reg_n_0_[370] ;
  wire \r0_data_reg_n_0_[371] ;
  wire \r0_data_reg_n_0_[372] ;
  wire \r0_data_reg_n_0_[373] ;
  wire \r0_data_reg_n_0_[374] ;
  wire \r0_data_reg_n_0_[375] ;
  wire \r0_data_reg_n_0_[376] ;
  wire \r0_data_reg_n_0_[377] ;
  wire \r0_data_reg_n_0_[378] ;
  wire \r0_data_reg_n_0_[379] ;
  wire \r0_data_reg_n_0_[380] ;
  wire \r0_data_reg_n_0_[381] ;
  wire \r0_data_reg_n_0_[382] ;
  wire \r0_data_reg_n_0_[383] ;
  wire r0_load;
  wire r0_out_sel_next_r;
  wire \r0_out_sel_next_r[1]_i_1_n_0 ;
  wire \r0_out_sel_next_r_reg_n_0_[1] ;
  wire \r0_out_sel_r[0]_i_1_n_0 ;
  wire \r0_out_sel_r[0]_i_2_n_0 ;
  wire \r0_out_sel_r[1]_i_1_n_0 ;
  wire \r0_out_sel_r_reg_n_0_[0] ;
  wire \r0_out_sel_r_reg_n_0_[1] ;
  wire \r1_data[0]_i_1_n_0 ;
  wire \r1_data[100]_i_1_n_0 ;
  wire \r1_data[101]_i_1_n_0 ;
  wire \r1_data[102]_i_1_n_0 ;
  wire \r1_data[103]_i_1_n_0 ;
  wire \r1_data[104]_i_1_n_0 ;
  wire \r1_data[105]_i_1_n_0 ;
  wire \r1_data[106]_i_1_n_0 ;
  wire \r1_data[107]_i_1_n_0 ;
  wire \r1_data[108]_i_1_n_0 ;
  wire \r1_data[109]_i_1_n_0 ;
  wire \r1_data[10]_i_1_n_0 ;
  wire \r1_data[110]_i_1_n_0 ;
  wire \r1_data[111]_i_1_n_0 ;
  wire \r1_data[112]_i_1_n_0 ;
  wire \r1_data[113]_i_1_n_0 ;
  wire \r1_data[114]_i_1_n_0 ;
  wire \r1_data[115]_i_1_n_0 ;
  wire \r1_data[116]_i_1_n_0 ;
  wire \r1_data[117]_i_1_n_0 ;
  wire \r1_data[118]_i_1_n_0 ;
  wire \r1_data[119]_i_1_n_0 ;
  wire \r1_data[11]_i_1_n_0 ;
  wire \r1_data[120]_i_1_n_0 ;
  wire \r1_data[121]_i_1_n_0 ;
  wire \r1_data[122]_i_1_n_0 ;
  wire \r1_data[123]_i_1_n_0 ;
  wire \r1_data[124]_i_1_n_0 ;
  wire \r1_data[125]_i_1_n_0 ;
  wire \r1_data[126]_i_1_n_0 ;
  wire \r1_data[127]_i_2_n_0 ;
  wire \r1_data[12]_i_1_n_0 ;
  wire \r1_data[13]_i_1_n_0 ;
  wire \r1_data[14]_i_1_n_0 ;
  wire \r1_data[15]_i_1_n_0 ;
  wire \r1_data[16]_i_1_n_0 ;
  wire \r1_data[17]_i_1_n_0 ;
  wire \r1_data[18]_i_1_n_0 ;
  wire \r1_data[19]_i_1_n_0 ;
  wire \r1_data[1]_i_1_n_0 ;
  wire \r1_data[20]_i_1_n_0 ;
  wire \r1_data[21]_i_1_n_0 ;
  wire \r1_data[22]_i_1_n_0 ;
  wire \r1_data[23]_i_1_n_0 ;
  wire \r1_data[24]_i_1_n_0 ;
  wire \r1_data[25]_i_1_n_0 ;
  wire \r1_data[26]_i_1_n_0 ;
  wire \r1_data[27]_i_1_n_0 ;
  wire \r1_data[28]_i_1_n_0 ;
  wire \r1_data[29]_i_1_n_0 ;
  wire \r1_data[2]_i_1_n_0 ;
  wire \r1_data[30]_i_1_n_0 ;
  wire \r1_data[31]_i_1_n_0 ;
  wire \r1_data[32]_i_1_n_0 ;
  wire \r1_data[33]_i_1_n_0 ;
  wire \r1_data[34]_i_1_n_0 ;
  wire \r1_data[35]_i_1_n_0 ;
  wire \r1_data[36]_i_1_n_0 ;
  wire \r1_data[37]_i_1_n_0 ;
  wire \r1_data[38]_i_1_n_0 ;
  wire \r1_data[39]_i_1_n_0 ;
  wire \r1_data[3]_i_1_n_0 ;
  wire \r1_data[40]_i_1_n_0 ;
  wire \r1_data[41]_i_1_n_0 ;
  wire \r1_data[42]_i_1_n_0 ;
  wire \r1_data[43]_i_1_n_0 ;
  wire \r1_data[44]_i_1_n_0 ;
  wire \r1_data[45]_i_1_n_0 ;
  wire \r1_data[46]_i_1_n_0 ;
  wire \r1_data[47]_i_1_n_0 ;
  wire \r1_data[48]_i_1_n_0 ;
  wire \r1_data[49]_i_1_n_0 ;
  wire \r1_data[4]_i_1_n_0 ;
  wire \r1_data[50]_i_1_n_0 ;
  wire \r1_data[51]_i_1_n_0 ;
  wire \r1_data[52]_i_1_n_0 ;
  wire \r1_data[53]_i_1_n_0 ;
  wire \r1_data[54]_i_1_n_0 ;
  wire \r1_data[55]_i_1_n_0 ;
  wire \r1_data[56]_i_1_n_0 ;
  wire \r1_data[57]_i_1_n_0 ;
  wire \r1_data[58]_i_1_n_0 ;
  wire \r1_data[59]_i_1_n_0 ;
  wire \r1_data[5]_i_1_n_0 ;
  wire \r1_data[60]_i_1_n_0 ;
  wire \r1_data[61]_i_1_n_0 ;
  wire \r1_data[62]_i_1_n_0 ;
  wire \r1_data[63]_i_1_n_0 ;
  wire \r1_data[64]_i_1_n_0 ;
  wire \r1_data[65]_i_1_n_0 ;
  wire \r1_data[66]_i_1_n_0 ;
  wire \r1_data[67]_i_1_n_0 ;
  wire \r1_data[68]_i_1_n_0 ;
  wire \r1_data[69]_i_1_n_0 ;
  wire \r1_data[6]_i_1_n_0 ;
  wire \r1_data[70]_i_1_n_0 ;
  wire \r1_data[71]_i_1_n_0 ;
  wire \r1_data[72]_i_1_n_0 ;
  wire \r1_data[73]_i_1_n_0 ;
  wire \r1_data[74]_i_1_n_0 ;
  wire \r1_data[75]_i_1_n_0 ;
  wire \r1_data[76]_i_1_n_0 ;
  wire \r1_data[77]_i_1_n_0 ;
  wire \r1_data[78]_i_1_n_0 ;
  wire \r1_data[79]_i_1_n_0 ;
  wire \r1_data[7]_i_1_n_0 ;
  wire \r1_data[80]_i_1_n_0 ;
  wire \r1_data[81]_i_1_n_0 ;
  wire \r1_data[82]_i_1_n_0 ;
  wire \r1_data[83]_i_1_n_0 ;
  wire \r1_data[84]_i_1_n_0 ;
  wire \r1_data[85]_i_1_n_0 ;
  wire \r1_data[86]_i_1_n_0 ;
  wire \r1_data[87]_i_1_n_0 ;
  wire \r1_data[88]_i_1_n_0 ;
  wire \r1_data[89]_i_1_n_0 ;
  wire \r1_data[8]_i_1_n_0 ;
  wire \r1_data[90]_i_1_n_0 ;
  wire \r1_data[91]_i_1_n_0 ;
  wire \r1_data[92]_i_1_n_0 ;
  wire \r1_data[93]_i_1_n_0 ;
  wire \r1_data[94]_i_1_n_0 ;
  wire \r1_data[95]_i_1_n_0 ;
  wire \r1_data[96]_i_1_n_0 ;
  wire \r1_data[97]_i_1_n_0 ;
  wire \r1_data[98]_i_1_n_0 ;
  wire \r1_data[99]_i_1_n_0 ;
  wire \r1_data[9]_i_1_n_0 ;
  wire r1_load;
  wire [2:0]state;
  wire \state_reg[1]_0 ;
  wire \state_reg_n_0_[2] ;

  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[0]_INST_0 
       (.I0(p_0_in1_in[128]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[256]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[0]),
        .O(m_axis_tdata[0]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[100]_INST_0 
       (.I0(p_0_in1_in[228]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[356]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[100]),
        .O(m_axis_tdata[100]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[101]_INST_0 
       (.I0(p_0_in1_in[229]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[357]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[101]),
        .O(m_axis_tdata[101]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[102]_INST_0 
       (.I0(p_0_in1_in[230]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[358]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[102]),
        .O(m_axis_tdata[102]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[103]_INST_0 
       (.I0(p_0_in1_in[231]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[359]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[103]),
        .O(m_axis_tdata[103]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[104]_INST_0 
       (.I0(p_0_in1_in[232]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[360]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[104]),
        .O(m_axis_tdata[104]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[105]_INST_0 
       (.I0(p_0_in1_in[233]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[361]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[105]),
        .O(m_axis_tdata[105]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[106]_INST_0 
       (.I0(p_0_in1_in[234]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[362]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[106]),
        .O(m_axis_tdata[106]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[107]_INST_0 
       (.I0(p_0_in1_in[235]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[363]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[107]),
        .O(m_axis_tdata[107]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[108]_INST_0 
       (.I0(p_0_in1_in[236]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[364]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[108]),
        .O(m_axis_tdata[108]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[109]_INST_0 
       (.I0(p_0_in1_in[237]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[365]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[109]),
        .O(m_axis_tdata[109]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[10]_INST_0 
       (.I0(p_0_in1_in[138]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[266]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[10]),
        .O(m_axis_tdata[10]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[110]_INST_0 
       (.I0(p_0_in1_in[238]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[366]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[110]),
        .O(m_axis_tdata[110]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[111]_INST_0 
       (.I0(p_0_in1_in[239]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[367]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[111]),
        .O(m_axis_tdata[111]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[112]_INST_0 
       (.I0(p_0_in1_in[240]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[368]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[112]),
        .O(m_axis_tdata[112]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[113]_INST_0 
       (.I0(p_0_in1_in[241]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[369]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[113]),
        .O(m_axis_tdata[113]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[114]_INST_0 
       (.I0(p_0_in1_in[242]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[370]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[114]),
        .O(m_axis_tdata[114]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[115]_INST_0 
       (.I0(p_0_in1_in[243]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[371]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[115]),
        .O(m_axis_tdata[115]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[116]_INST_0 
       (.I0(p_0_in1_in[244]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[372]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[116]),
        .O(m_axis_tdata[116]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[117]_INST_0 
       (.I0(p_0_in1_in[245]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[373]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[117]),
        .O(m_axis_tdata[117]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[118]_INST_0 
       (.I0(p_0_in1_in[246]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[374]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[118]),
        .O(m_axis_tdata[118]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[119]_INST_0 
       (.I0(p_0_in1_in[247]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[375]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[119]),
        .O(m_axis_tdata[119]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[11]_INST_0 
       (.I0(p_0_in1_in[139]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[267]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[11]),
        .O(m_axis_tdata[11]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[120]_INST_0 
       (.I0(p_0_in1_in[248]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[376]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[120]),
        .O(m_axis_tdata[120]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[121]_INST_0 
       (.I0(p_0_in1_in[249]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[377]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[121]),
        .O(m_axis_tdata[121]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[122]_INST_0 
       (.I0(p_0_in1_in[250]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[378]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[122]),
        .O(m_axis_tdata[122]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[123]_INST_0 
       (.I0(p_0_in1_in[251]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[379]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[123]),
        .O(m_axis_tdata[123]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[124]_INST_0 
       (.I0(p_0_in1_in[252]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[380]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[124]),
        .O(m_axis_tdata[124]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[125]_INST_0 
       (.I0(p_0_in1_in[253]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[381]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[125]),
        .O(m_axis_tdata[125]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[126]_INST_0 
       (.I0(p_0_in1_in[254]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[382]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[126]),
        .O(m_axis_tdata[126]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[127]_INST_0 
       (.I0(p_0_in1_in[255]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[383]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[127]),
        .O(m_axis_tdata[127]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[12]_INST_0 
       (.I0(p_0_in1_in[140]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[268]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[12]),
        .O(m_axis_tdata[12]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[13]_INST_0 
       (.I0(p_0_in1_in[141]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[269]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[13]),
        .O(m_axis_tdata[13]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[14]_INST_0 
       (.I0(p_0_in1_in[142]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[270]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[14]),
        .O(m_axis_tdata[14]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[15]_INST_0 
       (.I0(p_0_in1_in[143]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[271]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[15]),
        .O(m_axis_tdata[15]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[16]_INST_0 
       (.I0(p_0_in1_in[144]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[272]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[16]),
        .O(m_axis_tdata[16]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[17]_INST_0 
       (.I0(p_0_in1_in[145]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[273]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[17]),
        .O(m_axis_tdata[17]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[18]_INST_0 
       (.I0(p_0_in1_in[146]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[274]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[18]),
        .O(m_axis_tdata[18]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[19]_INST_0 
       (.I0(p_0_in1_in[147]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[275]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[19]),
        .O(m_axis_tdata[19]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[1]_INST_0 
       (.I0(p_0_in1_in[129]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[257]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[1]),
        .O(m_axis_tdata[1]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[20]_INST_0 
       (.I0(p_0_in1_in[148]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[276]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[20]),
        .O(m_axis_tdata[20]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[21]_INST_0 
       (.I0(p_0_in1_in[149]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[277]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[21]),
        .O(m_axis_tdata[21]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[22]_INST_0 
       (.I0(p_0_in1_in[150]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[278]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[22]),
        .O(m_axis_tdata[22]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[23]_INST_0 
       (.I0(p_0_in1_in[151]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[279]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[23]),
        .O(m_axis_tdata[23]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[24]_INST_0 
       (.I0(p_0_in1_in[152]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[280]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[24]),
        .O(m_axis_tdata[24]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[25]_INST_0 
       (.I0(p_0_in1_in[153]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[281]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[25]),
        .O(m_axis_tdata[25]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[26]_INST_0 
       (.I0(p_0_in1_in[154]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[282]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[26]),
        .O(m_axis_tdata[26]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[27]_INST_0 
       (.I0(p_0_in1_in[155]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[283]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[27]),
        .O(m_axis_tdata[27]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[28]_INST_0 
       (.I0(p_0_in1_in[156]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[284]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[28]),
        .O(m_axis_tdata[28]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[29]_INST_0 
       (.I0(p_0_in1_in[157]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[285]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[29]),
        .O(m_axis_tdata[29]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[2]_INST_0 
       (.I0(p_0_in1_in[130]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[258]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[2]),
        .O(m_axis_tdata[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[30]_INST_0 
       (.I0(p_0_in1_in[158]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[286]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[30]),
        .O(m_axis_tdata[30]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[31]_INST_0 
       (.I0(p_0_in1_in[159]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[287]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[31]),
        .O(m_axis_tdata[31]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[32]_INST_0 
       (.I0(p_0_in1_in[160]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[288]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[32]),
        .O(m_axis_tdata[32]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[33]_INST_0 
       (.I0(p_0_in1_in[161]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[289]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[33]),
        .O(m_axis_tdata[33]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[34]_INST_0 
       (.I0(p_0_in1_in[162]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[290]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[34]),
        .O(m_axis_tdata[34]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[35]_INST_0 
       (.I0(p_0_in1_in[163]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[291]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[35]),
        .O(m_axis_tdata[35]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[36]_INST_0 
       (.I0(p_0_in1_in[164]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[292]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[36]),
        .O(m_axis_tdata[36]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[37]_INST_0 
       (.I0(p_0_in1_in[165]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[293]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[37]),
        .O(m_axis_tdata[37]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[38]_INST_0 
       (.I0(p_0_in1_in[166]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[294]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[38]),
        .O(m_axis_tdata[38]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[39]_INST_0 
       (.I0(p_0_in1_in[167]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[295]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[39]),
        .O(m_axis_tdata[39]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[3]_INST_0 
       (.I0(p_0_in1_in[131]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[259]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[3]),
        .O(m_axis_tdata[3]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[40]_INST_0 
       (.I0(p_0_in1_in[168]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[296]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[40]),
        .O(m_axis_tdata[40]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[41]_INST_0 
       (.I0(p_0_in1_in[169]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[297]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[41]),
        .O(m_axis_tdata[41]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[42]_INST_0 
       (.I0(p_0_in1_in[170]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[298]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[42]),
        .O(m_axis_tdata[42]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[43]_INST_0 
       (.I0(p_0_in1_in[171]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[299]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[43]),
        .O(m_axis_tdata[43]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[44]_INST_0 
       (.I0(p_0_in1_in[172]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[300]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[44]),
        .O(m_axis_tdata[44]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[45]_INST_0 
       (.I0(p_0_in1_in[173]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[301]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[45]),
        .O(m_axis_tdata[45]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[46]_INST_0 
       (.I0(p_0_in1_in[174]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[302]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[46]),
        .O(m_axis_tdata[46]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[47]_INST_0 
       (.I0(p_0_in1_in[175]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[303]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[47]),
        .O(m_axis_tdata[47]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[48]_INST_0 
       (.I0(p_0_in1_in[176]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[304]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[48]),
        .O(m_axis_tdata[48]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[49]_INST_0 
       (.I0(p_0_in1_in[177]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[305]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[49]),
        .O(m_axis_tdata[49]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[4]_INST_0 
       (.I0(p_0_in1_in[132]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[260]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[4]),
        .O(m_axis_tdata[4]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[50]_INST_0 
       (.I0(p_0_in1_in[178]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[306]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[50]),
        .O(m_axis_tdata[50]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[51]_INST_0 
       (.I0(p_0_in1_in[179]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[307]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[51]),
        .O(m_axis_tdata[51]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[52]_INST_0 
       (.I0(p_0_in1_in[180]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[308]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[52]),
        .O(m_axis_tdata[52]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[53]_INST_0 
       (.I0(p_0_in1_in[181]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[309]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[53]),
        .O(m_axis_tdata[53]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[54]_INST_0 
       (.I0(p_0_in1_in[182]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[310]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[54]),
        .O(m_axis_tdata[54]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[55]_INST_0 
       (.I0(p_0_in1_in[183]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[311]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[55]),
        .O(m_axis_tdata[55]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[56]_INST_0 
       (.I0(p_0_in1_in[184]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[312]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[56]),
        .O(m_axis_tdata[56]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[57]_INST_0 
       (.I0(p_0_in1_in[185]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[313]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[57]),
        .O(m_axis_tdata[57]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[58]_INST_0 
       (.I0(p_0_in1_in[186]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[314]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[58]),
        .O(m_axis_tdata[58]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[59]_INST_0 
       (.I0(p_0_in1_in[187]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[315]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[59]),
        .O(m_axis_tdata[59]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[5]_INST_0 
       (.I0(p_0_in1_in[133]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[261]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[5]),
        .O(m_axis_tdata[5]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[60]_INST_0 
       (.I0(p_0_in1_in[188]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[316]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[60]),
        .O(m_axis_tdata[60]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[61]_INST_0 
       (.I0(p_0_in1_in[189]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[317]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[61]),
        .O(m_axis_tdata[61]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[62]_INST_0 
       (.I0(p_0_in1_in[190]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[318]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[62]),
        .O(m_axis_tdata[62]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[63]_INST_0 
       (.I0(p_0_in1_in[191]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[319]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[63]),
        .O(m_axis_tdata[63]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[64]_INST_0 
       (.I0(p_0_in1_in[192]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[320]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[64]),
        .O(m_axis_tdata[64]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[65]_INST_0 
       (.I0(p_0_in1_in[193]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[321]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[65]),
        .O(m_axis_tdata[65]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[66]_INST_0 
       (.I0(p_0_in1_in[194]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[322]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[66]),
        .O(m_axis_tdata[66]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[67]_INST_0 
       (.I0(p_0_in1_in[195]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[323]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[67]),
        .O(m_axis_tdata[67]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[68]_INST_0 
       (.I0(p_0_in1_in[196]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[324]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[68]),
        .O(m_axis_tdata[68]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[69]_INST_0 
       (.I0(p_0_in1_in[197]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[325]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[69]),
        .O(m_axis_tdata[69]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[6]_INST_0 
       (.I0(p_0_in1_in[134]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[262]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[6]),
        .O(m_axis_tdata[6]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[70]_INST_0 
       (.I0(p_0_in1_in[198]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[326]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[70]),
        .O(m_axis_tdata[70]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[71]_INST_0 
       (.I0(p_0_in1_in[199]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[327]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[71]),
        .O(m_axis_tdata[71]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[72]_INST_0 
       (.I0(p_0_in1_in[200]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[328]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[72]),
        .O(m_axis_tdata[72]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[73]_INST_0 
       (.I0(p_0_in1_in[201]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[329]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[73]),
        .O(m_axis_tdata[73]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[74]_INST_0 
       (.I0(p_0_in1_in[202]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[330]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[74]),
        .O(m_axis_tdata[74]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[75]_INST_0 
       (.I0(p_0_in1_in[203]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[331]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[75]),
        .O(m_axis_tdata[75]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[76]_INST_0 
       (.I0(p_0_in1_in[204]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[332]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[76]),
        .O(m_axis_tdata[76]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[77]_INST_0 
       (.I0(p_0_in1_in[205]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[333]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[77]),
        .O(m_axis_tdata[77]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[78]_INST_0 
       (.I0(p_0_in1_in[206]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[334]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[78]),
        .O(m_axis_tdata[78]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[79]_INST_0 
       (.I0(p_0_in1_in[207]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[335]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[79]),
        .O(m_axis_tdata[79]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[7]_INST_0 
       (.I0(p_0_in1_in[135]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[263]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[7]),
        .O(m_axis_tdata[7]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[80]_INST_0 
       (.I0(p_0_in1_in[208]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[336]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[80]),
        .O(m_axis_tdata[80]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[81]_INST_0 
       (.I0(p_0_in1_in[209]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[337]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[81]),
        .O(m_axis_tdata[81]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[82]_INST_0 
       (.I0(p_0_in1_in[210]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[338]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[82]),
        .O(m_axis_tdata[82]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[83]_INST_0 
       (.I0(p_0_in1_in[211]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[339]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[83]),
        .O(m_axis_tdata[83]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[84]_INST_0 
       (.I0(p_0_in1_in[212]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[340]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[84]),
        .O(m_axis_tdata[84]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[85]_INST_0 
       (.I0(p_0_in1_in[213]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[341]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[85]),
        .O(m_axis_tdata[85]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[86]_INST_0 
       (.I0(p_0_in1_in[214]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[342]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[86]),
        .O(m_axis_tdata[86]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[87]_INST_0 
       (.I0(p_0_in1_in[215]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[343]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[87]),
        .O(m_axis_tdata[87]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[88]_INST_0 
       (.I0(p_0_in1_in[216]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[344]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[88]),
        .O(m_axis_tdata[88]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[89]_INST_0 
       (.I0(p_0_in1_in[217]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[345]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[89]),
        .O(m_axis_tdata[89]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[8]_INST_0 
       (.I0(p_0_in1_in[136]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[264]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[8]),
        .O(m_axis_tdata[8]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[90]_INST_0 
       (.I0(p_0_in1_in[218]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[346]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[90]),
        .O(m_axis_tdata[90]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[91]_INST_0 
       (.I0(p_0_in1_in[219]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[347]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[91]),
        .O(m_axis_tdata[91]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[92]_INST_0 
       (.I0(p_0_in1_in[220]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[348]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[92]),
        .O(m_axis_tdata[92]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[93]_INST_0 
       (.I0(p_0_in1_in[221]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[349]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[93]),
        .O(m_axis_tdata[93]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[94]_INST_0 
       (.I0(p_0_in1_in[222]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[350]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[94]),
        .O(m_axis_tdata[94]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[95]_INST_0 
       (.I0(p_0_in1_in[223]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[351]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[95]),
        .O(m_axis_tdata[95]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[96]_INST_0 
       (.I0(p_0_in1_in[224]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[352]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[96]),
        .O(m_axis_tdata[96]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[97]_INST_0 
       (.I0(p_0_in1_in[225]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[353]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[97]),
        .O(m_axis_tdata[97]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[98]_INST_0 
       (.I0(p_0_in1_in[226]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[354]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[98]),
        .O(m_axis_tdata[98]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[99]_INST_0 
       (.I0(p_0_in1_in[227]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[355]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[99]),
        .O(m_axis_tdata[99]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \m_axis_tdata[9]_INST_0 
       (.I0(p_0_in1_in[137]),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(p_0_in1_in[265]),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[9]),
        .O(m_axis_tdata[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \r0_data[383]_i_1 
       (.I0(d2_ready),
        .I1(\state_reg_n_0_[2] ),
        .O(r0_load));
  FDRE \r0_data_reg[0] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[0]),
        .Q(p_0_in1_in[0]),
        .R(1'b0));
  FDRE \r0_data_reg[100] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[100]),
        .Q(p_0_in1_in[100]),
        .R(1'b0));
  FDRE \r0_data_reg[101] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[101]),
        .Q(p_0_in1_in[101]),
        .R(1'b0));
  FDRE \r0_data_reg[102] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[102]),
        .Q(p_0_in1_in[102]),
        .R(1'b0));
  FDRE \r0_data_reg[103] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[103]),
        .Q(p_0_in1_in[103]),
        .R(1'b0));
  FDRE \r0_data_reg[104] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[104]),
        .Q(p_0_in1_in[104]),
        .R(1'b0));
  FDRE \r0_data_reg[105] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[105]),
        .Q(p_0_in1_in[105]),
        .R(1'b0));
  FDRE \r0_data_reg[106] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[106]),
        .Q(p_0_in1_in[106]),
        .R(1'b0));
  FDRE \r0_data_reg[107] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[107]),
        .Q(p_0_in1_in[107]),
        .R(1'b0));
  FDRE \r0_data_reg[108] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[108]),
        .Q(p_0_in1_in[108]),
        .R(1'b0));
  FDRE \r0_data_reg[109] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[109]),
        .Q(p_0_in1_in[109]),
        .R(1'b0));
  FDRE \r0_data_reg[10] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[10]),
        .Q(p_0_in1_in[10]),
        .R(1'b0));
  FDRE \r0_data_reg[110] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[110]),
        .Q(p_0_in1_in[110]),
        .R(1'b0));
  FDRE \r0_data_reg[111] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[111]),
        .Q(p_0_in1_in[111]),
        .R(1'b0));
  FDRE \r0_data_reg[112] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[112]),
        .Q(p_0_in1_in[112]),
        .R(1'b0));
  FDRE \r0_data_reg[113] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[113]),
        .Q(p_0_in1_in[113]),
        .R(1'b0));
  FDRE \r0_data_reg[114] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[114]),
        .Q(p_0_in1_in[114]),
        .R(1'b0));
  FDRE \r0_data_reg[115] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[115]),
        .Q(p_0_in1_in[115]),
        .R(1'b0));
  FDRE \r0_data_reg[116] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[116]),
        .Q(p_0_in1_in[116]),
        .R(1'b0));
  FDRE \r0_data_reg[117] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[117]),
        .Q(p_0_in1_in[117]),
        .R(1'b0));
  FDRE \r0_data_reg[118] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[118]),
        .Q(p_0_in1_in[118]),
        .R(1'b0));
  FDRE \r0_data_reg[119] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[119]),
        .Q(p_0_in1_in[119]),
        .R(1'b0));
  FDRE \r0_data_reg[11] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[11]),
        .Q(p_0_in1_in[11]),
        .R(1'b0));
  FDRE \r0_data_reg[120] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[120]),
        .Q(p_0_in1_in[120]),
        .R(1'b0));
  FDRE \r0_data_reg[121] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[121]),
        .Q(p_0_in1_in[121]),
        .R(1'b0));
  FDRE \r0_data_reg[122] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[122]),
        .Q(p_0_in1_in[122]),
        .R(1'b0));
  FDRE \r0_data_reg[123] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[123]),
        .Q(p_0_in1_in[123]),
        .R(1'b0));
  FDRE \r0_data_reg[124] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[124]),
        .Q(p_0_in1_in[124]),
        .R(1'b0));
  FDRE \r0_data_reg[125] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[125]),
        .Q(p_0_in1_in[125]),
        .R(1'b0));
  FDRE \r0_data_reg[126] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[126]),
        .Q(p_0_in1_in[126]),
        .R(1'b0));
  FDRE \r0_data_reg[127] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[127]),
        .Q(p_0_in1_in[127]),
        .R(1'b0));
  FDRE \r0_data_reg[128] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[128]),
        .Q(p_0_in1_in[128]),
        .R(1'b0));
  FDRE \r0_data_reg[129] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[129]),
        .Q(p_0_in1_in[129]),
        .R(1'b0));
  FDRE \r0_data_reg[12] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[12]),
        .Q(p_0_in1_in[12]),
        .R(1'b0));
  FDRE \r0_data_reg[130] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[130]),
        .Q(p_0_in1_in[130]),
        .R(1'b0));
  FDRE \r0_data_reg[131] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[131]),
        .Q(p_0_in1_in[131]),
        .R(1'b0));
  FDRE \r0_data_reg[132] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[132]),
        .Q(p_0_in1_in[132]),
        .R(1'b0));
  FDRE \r0_data_reg[133] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[133]),
        .Q(p_0_in1_in[133]),
        .R(1'b0));
  FDRE \r0_data_reg[134] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[134]),
        .Q(p_0_in1_in[134]),
        .R(1'b0));
  FDRE \r0_data_reg[135] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[135]),
        .Q(p_0_in1_in[135]),
        .R(1'b0));
  FDRE \r0_data_reg[136] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[136]),
        .Q(p_0_in1_in[136]),
        .R(1'b0));
  FDRE \r0_data_reg[137] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[137]),
        .Q(p_0_in1_in[137]),
        .R(1'b0));
  FDRE \r0_data_reg[138] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[138]),
        .Q(p_0_in1_in[138]),
        .R(1'b0));
  FDRE \r0_data_reg[139] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[139]),
        .Q(p_0_in1_in[139]),
        .R(1'b0));
  FDRE \r0_data_reg[13] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[13]),
        .Q(p_0_in1_in[13]),
        .R(1'b0));
  FDRE \r0_data_reg[140] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[140]),
        .Q(p_0_in1_in[140]),
        .R(1'b0));
  FDRE \r0_data_reg[141] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[141]),
        .Q(p_0_in1_in[141]),
        .R(1'b0));
  FDRE \r0_data_reg[142] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[142]),
        .Q(p_0_in1_in[142]),
        .R(1'b0));
  FDRE \r0_data_reg[143] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[143]),
        .Q(p_0_in1_in[143]),
        .R(1'b0));
  FDRE \r0_data_reg[144] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[144]),
        .Q(p_0_in1_in[144]),
        .R(1'b0));
  FDRE \r0_data_reg[145] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[145]),
        .Q(p_0_in1_in[145]),
        .R(1'b0));
  FDRE \r0_data_reg[146] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[146]),
        .Q(p_0_in1_in[146]),
        .R(1'b0));
  FDRE \r0_data_reg[147] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[147]),
        .Q(p_0_in1_in[147]),
        .R(1'b0));
  FDRE \r0_data_reg[148] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[148]),
        .Q(p_0_in1_in[148]),
        .R(1'b0));
  FDRE \r0_data_reg[149] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[149]),
        .Q(p_0_in1_in[149]),
        .R(1'b0));
  FDRE \r0_data_reg[14] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[14]),
        .Q(p_0_in1_in[14]),
        .R(1'b0));
  FDRE \r0_data_reg[150] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[150]),
        .Q(p_0_in1_in[150]),
        .R(1'b0));
  FDRE \r0_data_reg[151] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[151]),
        .Q(p_0_in1_in[151]),
        .R(1'b0));
  FDRE \r0_data_reg[152] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[152]),
        .Q(p_0_in1_in[152]),
        .R(1'b0));
  FDRE \r0_data_reg[153] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[153]),
        .Q(p_0_in1_in[153]),
        .R(1'b0));
  FDRE \r0_data_reg[154] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[154]),
        .Q(p_0_in1_in[154]),
        .R(1'b0));
  FDRE \r0_data_reg[155] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[155]),
        .Q(p_0_in1_in[155]),
        .R(1'b0));
  FDRE \r0_data_reg[156] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[156]),
        .Q(p_0_in1_in[156]),
        .R(1'b0));
  FDRE \r0_data_reg[157] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[157]),
        .Q(p_0_in1_in[157]),
        .R(1'b0));
  FDRE \r0_data_reg[158] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[158]),
        .Q(p_0_in1_in[158]),
        .R(1'b0));
  FDRE \r0_data_reg[159] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[159]),
        .Q(p_0_in1_in[159]),
        .R(1'b0));
  FDRE \r0_data_reg[15] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[15]),
        .Q(p_0_in1_in[15]),
        .R(1'b0));
  FDRE \r0_data_reg[160] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[160]),
        .Q(p_0_in1_in[160]),
        .R(1'b0));
  FDRE \r0_data_reg[161] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[161]),
        .Q(p_0_in1_in[161]),
        .R(1'b0));
  FDRE \r0_data_reg[162] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[162]),
        .Q(p_0_in1_in[162]),
        .R(1'b0));
  FDRE \r0_data_reg[163] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[163]),
        .Q(p_0_in1_in[163]),
        .R(1'b0));
  FDRE \r0_data_reg[164] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[164]),
        .Q(p_0_in1_in[164]),
        .R(1'b0));
  FDRE \r0_data_reg[165] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[165]),
        .Q(p_0_in1_in[165]),
        .R(1'b0));
  FDRE \r0_data_reg[166] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[166]),
        .Q(p_0_in1_in[166]),
        .R(1'b0));
  FDRE \r0_data_reg[167] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[167]),
        .Q(p_0_in1_in[167]),
        .R(1'b0));
  FDRE \r0_data_reg[168] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[168]),
        .Q(p_0_in1_in[168]),
        .R(1'b0));
  FDRE \r0_data_reg[169] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[169]),
        .Q(p_0_in1_in[169]),
        .R(1'b0));
  FDRE \r0_data_reg[16] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[16]),
        .Q(p_0_in1_in[16]),
        .R(1'b0));
  FDRE \r0_data_reg[170] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[170]),
        .Q(p_0_in1_in[170]),
        .R(1'b0));
  FDRE \r0_data_reg[171] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[171]),
        .Q(p_0_in1_in[171]),
        .R(1'b0));
  FDRE \r0_data_reg[172] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[172]),
        .Q(p_0_in1_in[172]),
        .R(1'b0));
  FDRE \r0_data_reg[173] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[173]),
        .Q(p_0_in1_in[173]),
        .R(1'b0));
  FDRE \r0_data_reg[174] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[174]),
        .Q(p_0_in1_in[174]),
        .R(1'b0));
  FDRE \r0_data_reg[175] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[175]),
        .Q(p_0_in1_in[175]),
        .R(1'b0));
  FDRE \r0_data_reg[176] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[176]),
        .Q(p_0_in1_in[176]),
        .R(1'b0));
  FDRE \r0_data_reg[177] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[177]),
        .Q(p_0_in1_in[177]),
        .R(1'b0));
  FDRE \r0_data_reg[178] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[178]),
        .Q(p_0_in1_in[178]),
        .R(1'b0));
  FDRE \r0_data_reg[179] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[179]),
        .Q(p_0_in1_in[179]),
        .R(1'b0));
  FDRE \r0_data_reg[17] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[17]),
        .Q(p_0_in1_in[17]),
        .R(1'b0));
  FDRE \r0_data_reg[180] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[180]),
        .Q(p_0_in1_in[180]),
        .R(1'b0));
  FDRE \r0_data_reg[181] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[181]),
        .Q(p_0_in1_in[181]),
        .R(1'b0));
  FDRE \r0_data_reg[182] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[182]),
        .Q(p_0_in1_in[182]),
        .R(1'b0));
  FDRE \r0_data_reg[183] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[183]),
        .Q(p_0_in1_in[183]),
        .R(1'b0));
  FDRE \r0_data_reg[184] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[184]),
        .Q(p_0_in1_in[184]),
        .R(1'b0));
  FDRE \r0_data_reg[185] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[185]),
        .Q(p_0_in1_in[185]),
        .R(1'b0));
  FDRE \r0_data_reg[186] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[186]),
        .Q(p_0_in1_in[186]),
        .R(1'b0));
  FDRE \r0_data_reg[187] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[187]),
        .Q(p_0_in1_in[187]),
        .R(1'b0));
  FDRE \r0_data_reg[188] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[188]),
        .Q(p_0_in1_in[188]),
        .R(1'b0));
  FDRE \r0_data_reg[189] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[189]),
        .Q(p_0_in1_in[189]),
        .R(1'b0));
  FDRE \r0_data_reg[18] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[18]),
        .Q(p_0_in1_in[18]),
        .R(1'b0));
  FDRE \r0_data_reg[190] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[190]),
        .Q(p_0_in1_in[190]),
        .R(1'b0));
  FDRE \r0_data_reg[191] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[191]),
        .Q(p_0_in1_in[191]),
        .R(1'b0));
  FDRE \r0_data_reg[192] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[192]),
        .Q(p_0_in1_in[192]),
        .R(1'b0));
  FDRE \r0_data_reg[193] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[193]),
        .Q(p_0_in1_in[193]),
        .R(1'b0));
  FDRE \r0_data_reg[194] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[194]),
        .Q(p_0_in1_in[194]),
        .R(1'b0));
  FDRE \r0_data_reg[195] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[195]),
        .Q(p_0_in1_in[195]),
        .R(1'b0));
  FDRE \r0_data_reg[196] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[196]),
        .Q(p_0_in1_in[196]),
        .R(1'b0));
  FDRE \r0_data_reg[197] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[197]),
        .Q(p_0_in1_in[197]),
        .R(1'b0));
  FDRE \r0_data_reg[198] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[198]),
        .Q(p_0_in1_in[198]),
        .R(1'b0));
  FDRE \r0_data_reg[199] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[199]),
        .Q(p_0_in1_in[199]),
        .R(1'b0));
  FDRE \r0_data_reg[19] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[19]),
        .Q(p_0_in1_in[19]),
        .R(1'b0));
  FDRE \r0_data_reg[1] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[1]),
        .Q(p_0_in1_in[1]),
        .R(1'b0));
  FDRE \r0_data_reg[200] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[200]),
        .Q(p_0_in1_in[200]),
        .R(1'b0));
  FDRE \r0_data_reg[201] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[201]),
        .Q(p_0_in1_in[201]),
        .R(1'b0));
  FDRE \r0_data_reg[202] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[202]),
        .Q(p_0_in1_in[202]),
        .R(1'b0));
  FDRE \r0_data_reg[203] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[203]),
        .Q(p_0_in1_in[203]),
        .R(1'b0));
  FDRE \r0_data_reg[204] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[204]),
        .Q(p_0_in1_in[204]),
        .R(1'b0));
  FDRE \r0_data_reg[205] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[205]),
        .Q(p_0_in1_in[205]),
        .R(1'b0));
  FDRE \r0_data_reg[206] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[206]),
        .Q(p_0_in1_in[206]),
        .R(1'b0));
  FDRE \r0_data_reg[207] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[207]),
        .Q(p_0_in1_in[207]),
        .R(1'b0));
  FDRE \r0_data_reg[208] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[208]),
        .Q(p_0_in1_in[208]),
        .R(1'b0));
  FDRE \r0_data_reg[209] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[209]),
        .Q(p_0_in1_in[209]),
        .R(1'b0));
  FDRE \r0_data_reg[20] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[20]),
        .Q(p_0_in1_in[20]),
        .R(1'b0));
  FDRE \r0_data_reg[210] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[210]),
        .Q(p_0_in1_in[210]),
        .R(1'b0));
  FDRE \r0_data_reg[211] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[211]),
        .Q(p_0_in1_in[211]),
        .R(1'b0));
  FDRE \r0_data_reg[212] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[212]),
        .Q(p_0_in1_in[212]),
        .R(1'b0));
  FDRE \r0_data_reg[213] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[213]),
        .Q(p_0_in1_in[213]),
        .R(1'b0));
  FDRE \r0_data_reg[214] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[214]),
        .Q(p_0_in1_in[214]),
        .R(1'b0));
  FDRE \r0_data_reg[215] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[215]),
        .Q(p_0_in1_in[215]),
        .R(1'b0));
  FDRE \r0_data_reg[216] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[216]),
        .Q(p_0_in1_in[216]),
        .R(1'b0));
  FDRE \r0_data_reg[217] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[217]),
        .Q(p_0_in1_in[217]),
        .R(1'b0));
  FDRE \r0_data_reg[218] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[218]),
        .Q(p_0_in1_in[218]),
        .R(1'b0));
  FDRE \r0_data_reg[219] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[219]),
        .Q(p_0_in1_in[219]),
        .R(1'b0));
  FDRE \r0_data_reg[21] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[21]),
        .Q(p_0_in1_in[21]),
        .R(1'b0));
  FDRE \r0_data_reg[220] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[220]),
        .Q(p_0_in1_in[220]),
        .R(1'b0));
  FDRE \r0_data_reg[221] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[221]),
        .Q(p_0_in1_in[221]),
        .R(1'b0));
  FDRE \r0_data_reg[222] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[222]),
        .Q(p_0_in1_in[222]),
        .R(1'b0));
  FDRE \r0_data_reg[223] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[223]),
        .Q(p_0_in1_in[223]),
        .R(1'b0));
  FDRE \r0_data_reg[224] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[224]),
        .Q(p_0_in1_in[224]),
        .R(1'b0));
  FDRE \r0_data_reg[225] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[225]),
        .Q(p_0_in1_in[225]),
        .R(1'b0));
  FDRE \r0_data_reg[226] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[226]),
        .Q(p_0_in1_in[226]),
        .R(1'b0));
  FDRE \r0_data_reg[227] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[227]),
        .Q(p_0_in1_in[227]),
        .R(1'b0));
  FDRE \r0_data_reg[228] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[228]),
        .Q(p_0_in1_in[228]),
        .R(1'b0));
  FDRE \r0_data_reg[229] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[229]),
        .Q(p_0_in1_in[229]),
        .R(1'b0));
  FDRE \r0_data_reg[22] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[22]),
        .Q(p_0_in1_in[22]),
        .R(1'b0));
  FDRE \r0_data_reg[230] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[230]),
        .Q(p_0_in1_in[230]),
        .R(1'b0));
  FDRE \r0_data_reg[231] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[231]),
        .Q(p_0_in1_in[231]),
        .R(1'b0));
  FDRE \r0_data_reg[232] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[232]),
        .Q(p_0_in1_in[232]),
        .R(1'b0));
  FDRE \r0_data_reg[233] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[233]),
        .Q(p_0_in1_in[233]),
        .R(1'b0));
  FDRE \r0_data_reg[234] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[234]),
        .Q(p_0_in1_in[234]),
        .R(1'b0));
  FDRE \r0_data_reg[235] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[235]),
        .Q(p_0_in1_in[235]),
        .R(1'b0));
  FDRE \r0_data_reg[236] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[236]),
        .Q(p_0_in1_in[236]),
        .R(1'b0));
  FDRE \r0_data_reg[237] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[237]),
        .Q(p_0_in1_in[237]),
        .R(1'b0));
  FDRE \r0_data_reg[238] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[238]),
        .Q(p_0_in1_in[238]),
        .R(1'b0));
  FDRE \r0_data_reg[239] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[239]),
        .Q(p_0_in1_in[239]),
        .R(1'b0));
  FDRE \r0_data_reg[23] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[23]),
        .Q(p_0_in1_in[23]),
        .R(1'b0));
  FDRE \r0_data_reg[240] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[240]),
        .Q(p_0_in1_in[240]),
        .R(1'b0));
  FDRE \r0_data_reg[241] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[241]),
        .Q(p_0_in1_in[241]),
        .R(1'b0));
  FDRE \r0_data_reg[242] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[242]),
        .Q(p_0_in1_in[242]),
        .R(1'b0));
  FDRE \r0_data_reg[243] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[243]),
        .Q(p_0_in1_in[243]),
        .R(1'b0));
  FDRE \r0_data_reg[244] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[244]),
        .Q(p_0_in1_in[244]),
        .R(1'b0));
  FDRE \r0_data_reg[245] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[245]),
        .Q(p_0_in1_in[245]),
        .R(1'b0));
  FDRE \r0_data_reg[246] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[246]),
        .Q(p_0_in1_in[246]),
        .R(1'b0));
  FDRE \r0_data_reg[247] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[247]),
        .Q(p_0_in1_in[247]),
        .R(1'b0));
  FDRE \r0_data_reg[248] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[248]),
        .Q(p_0_in1_in[248]),
        .R(1'b0));
  FDRE \r0_data_reg[249] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[249]),
        .Q(p_0_in1_in[249]),
        .R(1'b0));
  FDRE \r0_data_reg[24] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[24]),
        .Q(p_0_in1_in[24]),
        .R(1'b0));
  FDRE \r0_data_reg[250] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[250]),
        .Q(p_0_in1_in[250]),
        .R(1'b0));
  FDRE \r0_data_reg[251] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[251]),
        .Q(p_0_in1_in[251]),
        .R(1'b0));
  FDRE \r0_data_reg[252] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[252]),
        .Q(p_0_in1_in[252]),
        .R(1'b0));
  FDRE \r0_data_reg[253] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[253]),
        .Q(p_0_in1_in[253]),
        .R(1'b0));
  FDRE \r0_data_reg[254] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[254]),
        .Q(p_0_in1_in[254]),
        .R(1'b0));
  FDRE \r0_data_reg[255] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[255]),
        .Q(p_0_in1_in[255]),
        .R(1'b0));
  FDRE \r0_data_reg[256] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[256]),
        .Q(\r0_data_reg_n_0_[256] ),
        .R(1'b0));
  FDRE \r0_data_reg[257] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[257]),
        .Q(\r0_data_reg_n_0_[257] ),
        .R(1'b0));
  FDRE \r0_data_reg[258] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[258]),
        .Q(\r0_data_reg_n_0_[258] ),
        .R(1'b0));
  FDRE \r0_data_reg[259] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[259]),
        .Q(\r0_data_reg_n_0_[259] ),
        .R(1'b0));
  FDRE \r0_data_reg[25] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[25]),
        .Q(p_0_in1_in[25]),
        .R(1'b0));
  FDRE \r0_data_reg[260] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[260]),
        .Q(\r0_data_reg_n_0_[260] ),
        .R(1'b0));
  FDRE \r0_data_reg[261] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[261]),
        .Q(\r0_data_reg_n_0_[261] ),
        .R(1'b0));
  FDRE \r0_data_reg[262] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[262]),
        .Q(\r0_data_reg_n_0_[262] ),
        .R(1'b0));
  FDRE \r0_data_reg[263] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[263]),
        .Q(\r0_data_reg_n_0_[263] ),
        .R(1'b0));
  FDRE \r0_data_reg[264] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[264]),
        .Q(\r0_data_reg_n_0_[264] ),
        .R(1'b0));
  FDRE \r0_data_reg[265] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[265]),
        .Q(\r0_data_reg_n_0_[265] ),
        .R(1'b0));
  FDRE \r0_data_reg[266] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[266]),
        .Q(\r0_data_reg_n_0_[266] ),
        .R(1'b0));
  FDRE \r0_data_reg[267] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[267]),
        .Q(\r0_data_reg_n_0_[267] ),
        .R(1'b0));
  FDRE \r0_data_reg[268] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[268]),
        .Q(\r0_data_reg_n_0_[268] ),
        .R(1'b0));
  FDRE \r0_data_reg[269] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[269]),
        .Q(\r0_data_reg_n_0_[269] ),
        .R(1'b0));
  FDRE \r0_data_reg[26] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[26]),
        .Q(p_0_in1_in[26]),
        .R(1'b0));
  FDRE \r0_data_reg[270] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[270]),
        .Q(\r0_data_reg_n_0_[270] ),
        .R(1'b0));
  FDRE \r0_data_reg[271] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[271]),
        .Q(\r0_data_reg_n_0_[271] ),
        .R(1'b0));
  FDRE \r0_data_reg[272] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[272]),
        .Q(\r0_data_reg_n_0_[272] ),
        .R(1'b0));
  FDRE \r0_data_reg[273] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[273]),
        .Q(\r0_data_reg_n_0_[273] ),
        .R(1'b0));
  FDRE \r0_data_reg[274] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[274]),
        .Q(\r0_data_reg_n_0_[274] ),
        .R(1'b0));
  FDRE \r0_data_reg[275] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[275]),
        .Q(\r0_data_reg_n_0_[275] ),
        .R(1'b0));
  FDRE \r0_data_reg[276] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[276]),
        .Q(\r0_data_reg_n_0_[276] ),
        .R(1'b0));
  FDRE \r0_data_reg[277] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[277]),
        .Q(\r0_data_reg_n_0_[277] ),
        .R(1'b0));
  FDRE \r0_data_reg[278] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[278]),
        .Q(\r0_data_reg_n_0_[278] ),
        .R(1'b0));
  FDRE \r0_data_reg[279] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[279]),
        .Q(\r0_data_reg_n_0_[279] ),
        .R(1'b0));
  FDRE \r0_data_reg[27] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[27]),
        .Q(p_0_in1_in[27]),
        .R(1'b0));
  FDRE \r0_data_reg[280] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[280]),
        .Q(\r0_data_reg_n_0_[280] ),
        .R(1'b0));
  FDRE \r0_data_reg[281] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[281]),
        .Q(\r0_data_reg_n_0_[281] ),
        .R(1'b0));
  FDRE \r0_data_reg[282] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[282]),
        .Q(\r0_data_reg_n_0_[282] ),
        .R(1'b0));
  FDRE \r0_data_reg[283] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[283]),
        .Q(\r0_data_reg_n_0_[283] ),
        .R(1'b0));
  FDRE \r0_data_reg[284] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[284]),
        .Q(\r0_data_reg_n_0_[284] ),
        .R(1'b0));
  FDRE \r0_data_reg[285] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[285]),
        .Q(\r0_data_reg_n_0_[285] ),
        .R(1'b0));
  FDRE \r0_data_reg[286] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[286]),
        .Q(\r0_data_reg_n_0_[286] ),
        .R(1'b0));
  FDRE \r0_data_reg[287] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[287]),
        .Q(\r0_data_reg_n_0_[287] ),
        .R(1'b0));
  FDRE \r0_data_reg[288] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[288]),
        .Q(\r0_data_reg_n_0_[288] ),
        .R(1'b0));
  FDRE \r0_data_reg[289] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[289]),
        .Q(\r0_data_reg_n_0_[289] ),
        .R(1'b0));
  FDRE \r0_data_reg[28] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[28]),
        .Q(p_0_in1_in[28]),
        .R(1'b0));
  FDRE \r0_data_reg[290] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[290]),
        .Q(\r0_data_reg_n_0_[290] ),
        .R(1'b0));
  FDRE \r0_data_reg[291] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[291]),
        .Q(\r0_data_reg_n_0_[291] ),
        .R(1'b0));
  FDRE \r0_data_reg[292] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[292]),
        .Q(\r0_data_reg_n_0_[292] ),
        .R(1'b0));
  FDRE \r0_data_reg[293] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[293]),
        .Q(\r0_data_reg_n_0_[293] ),
        .R(1'b0));
  FDRE \r0_data_reg[294] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[294]),
        .Q(\r0_data_reg_n_0_[294] ),
        .R(1'b0));
  FDRE \r0_data_reg[295] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[295]),
        .Q(\r0_data_reg_n_0_[295] ),
        .R(1'b0));
  FDRE \r0_data_reg[296] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[296]),
        .Q(\r0_data_reg_n_0_[296] ),
        .R(1'b0));
  FDRE \r0_data_reg[297] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[297]),
        .Q(\r0_data_reg_n_0_[297] ),
        .R(1'b0));
  FDRE \r0_data_reg[298] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[298]),
        .Q(\r0_data_reg_n_0_[298] ),
        .R(1'b0));
  FDRE \r0_data_reg[299] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[299]),
        .Q(\r0_data_reg_n_0_[299] ),
        .R(1'b0));
  FDRE \r0_data_reg[29] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[29]),
        .Q(p_0_in1_in[29]),
        .R(1'b0));
  FDRE \r0_data_reg[2] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[2]),
        .Q(p_0_in1_in[2]),
        .R(1'b0));
  FDRE \r0_data_reg[300] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[300]),
        .Q(\r0_data_reg_n_0_[300] ),
        .R(1'b0));
  FDRE \r0_data_reg[301] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[301]),
        .Q(\r0_data_reg_n_0_[301] ),
        .R(1'b0));
  FDRE \r0_data_reg[302] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[302]),
        .Q(\r0_data_reg_n_0_[302] ),
        .R(1'b0));
  FDRE \r0_data_reg[303] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[303]),
        .Q(\r0_data_reg_n_0_[303] ),
        .R(1'b0));
  FDRE \r0_data_reg[304] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[304]),
        .Q(\r0_data_reg_n_0_[304] ),
        .R(1'b0));
  FDRE \r0_data_reg[305] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[305]),
        .Q(\r0_data_reg_n_0_[305] ),
        .R(1'b0));
  FDRE \r0_data_reg[306] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[306]),
        .Q(\r0_data_reg_n_0_[306] ),
        .R(1'b0));
  FDRE \r0_data_reg[307] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[307]),
        .Q(\r0_data_reg_n_0_[307] ),
        .R(1'b0));
  FDRE \r0_data_reg[308] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[308]),
        .Q(\r0_data_reg_n_0_[308] ),
        .R(1'b0));
  FDRE \r0_data_reg[309] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[309]),
        .Q(\r0_data_reg_n_0_[309] ),
        .R(1'b0));
  FDRE \r0_data_reg[30] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[30]),
        .Q(p_0_in1_in[30]),
        .R(1'b0));
  FDRE \r0_data_reg[310] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[310]),
        .Q(\r0_data_reg_n_0_[310] ),
        .R(1'b0));
  FDRE \r0_data_reg[311] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[311]),
        .Q(\r0_data_reg_n_0_[311] ),
        .R(1'b0));
  FDRE \r0_data_reg[312] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[312]),
        .Q(\r0_data_reg_n_0_[312] ),
        .R(1'b0));
  FDRE \r0_data_reg[313] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[313]),
        .Q(\r0_data_reg_n_0_[313] ),
        .R(1'b0));
  FDRE \r0_data_reg[314] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[314]),
        .Q(\r0_data_reg_n_0_[314] ),
        .R(1'b0));
  FDRE \r0_data_reg[315] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[315]),
        .Q(\r0_data_reg_n_0_[315] ),
        .R(1'b0));
  FDRE \r0_data_reg[316] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[316]),
        .Q(\r0_data_reg_n_0_[316] ),
        .R(1'b0));
  FDRE \r0_data_reg[317] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[317]),
        .Q(\r0_data_reg_n_0_[317] ),
        .R(1'b0));
  FDRE \r0_data_reg[318] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[318]),
        .Q(\r0_data_reg_n_0_[318] ),
        .R(1'b0));
  FDRE \r0_data_reg[319] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[319]),
        .Q(\r0_data_reg_n_0_[319] ),
        .R(1'b0));
  FDRE \r0_data_reg[31] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[31]),
        .Q(p_0_in1_in[31]),
        .R(1'b0));
  FDRE \r0_data_reg[320] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[320]),
        .Q(\r0_data_reg_n_0_[320] ),
        .R(1'b0));
  FDRE \r0_data_reg[321] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[321]),
        .Q(\r0_data_reg_n_0_[321] ),
        .R(1'b0));
  FDRE \r0_data_reg[322] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[322]),
        .Q(\r0_data_reg_n_0_[322] ),
        .R(1'b0));
  FDRE \r0_data_reg[323] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[323]),
        .Q(\r0_data_reg_n_0_[323] ),
        .R(1'b0));
  FDRE \r0_data_reg[324] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[324]),
        .Q(\r0_data_reg_n_0_[324] ),
        .R(1'b0));
  FDRE \r0_data_reg[325] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[325]),
        .Q(\r0_data_reg_n_0_[325] ),
        .R(1'b0));
  FDRE \r0_data_reg[326] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[326]),
        .Q(\r0_data_reg_n_0_[326] ),
        .R(1'b0));
  FDRE \r0_data_reg[327] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[327]),
        .Q(\r0_data_reg_n_0_[327] ),
        .R(1'b0));
  FDRE \r0_data_reg[328] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[328]),
        .Q(\r0_data_reg_n_0_[328] ),
        .R(1'b0));
  FDRE \r0_data_reg[329] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[329]),
        .Q(\r0_data_reg_n_0_[329] ),
        .R(1'b0));
  FDRE \r0_data_reg[32] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[32]),
        .Q(p_0_in1_in[32]),
        .R(1'b0));
  FDRE \r0_data_reg[330] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[330]),
        .Q(\r0_data_reg_n_0_[330] ),
        .R(1'b0));
  FDRE \r0_data_reg[331] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[331]),
        .Q(\r0_data_reg_n_0_[331] ),
        .R(1'b0));
  FDRE \r0_data_reg[332] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[332]),
        .Q(\r0_data_reg_n_0_[332] ),
        .R(1'b0));
  FDRE \r0_data_reg[333] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[333]),
        .Q(\r0_data_reg_n_0_[333] ),
        .R(1'b0));
  FDRE \r0_data_reg[334] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[334]),
        .Q(\r0_data_reg_n_0_[334] ),
        .R(1'b0));
  FDRE \r0_data_reg[335] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[335]),
        .Q(\r0_data_reg_n_0_[335] ),
        .R(1'b0));
  FDRE \r0_data_reg[336] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[336]),
        .Q(\r0_data_reg_n_0_[336] ),
        .R(1'b0));
  FDRE \r0_data_reg[337] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[337]),
        .Q(\r0_data_reg_n_0_[337] ),
        .R(1'b0));
  FDRE \r0_data_reg[338] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[338]),
        .Q(\r0_data_reg_n_0_[338] ),
        .R(1'b0));
  FDRE \r0_data_reg[339] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[339]),
        .Q(\r0_data_reg_n_0_[339] ),
        .R(1'b0));
  FDRE \r0_data_reg[33] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[33]),
        .Q(p_0_in1_in[33]),
        .R(1'b0));
  FDRE \r0_data_reg[340] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[340]),
        .Q(\r0_data_reg_n_0_[340] ),
        .R(1'b0));
  FDRE \r0_data_reg[341] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[341]),
        .Q(\r0_data_reg_n_0_[341] ),
        .R(1'b0));
  FDRE \r0_data_reg[342] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[342]),
        .Q(\r0_data_reg_n_0_[342] ),
        .R(1'b0));
  FDRE \r0_data_reg[343] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[343]),
        .Q(\r0_data_reg_n_0_[343] ),
        .R(1'b0));
  FDRE \r0_data_reg[344] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[344]),
        .Q(\r0_data_reg_n_0_[344] ),
        .R(1'b0));
  FDRE \r0_data_reg[345] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[345]),
        .Q(\r0_data_reg_n_0_[345] ),
        .R(1'b0));
  FDRE \r0_data_reg[346] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[346]),
        .Q(\r0_data_reg_n_0_[346] ),
        .R(1'b0));
  FDRE \r0_data_reg[347] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[347]),
        .Q(\r0_data_reg_n_0_[347] ),
        .R(1'b0));
  FDRE \r0_data_reg[348] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[348]),
        .Q(\r0_data_reg_n_0_[348] ),
        .R(1'b0));
  FDRE \r0_data_reg[349] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[349]),
        .Q(\r0_data_reg_n_0_[349] ),
        .R(1'b0));
  FDRE \r0_data_reg[34] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[34]),
        .Q(p_0_in1_in[34]),
        .R(1'b0));
  FDRE \r0_data_reg[350] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[350]),
        .Q(\r0_data_reg_n_0_[350] ),
        .R(1'b0));
  FDRE \r0_data_reg[351] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[351]),
        .Q(\r0_data_reg_n_0_[351] ),
        .R(1'b0));
  FDRE \r0_data_reg[352] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[352]),
        .Q(\r0_data_reg_n_0_[352] ),
        .R(1'b0));
  FDRE \r0_data_reg[353] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[353]),
        .Q(\r0_data_reg_n_0_[353] ),
        .R(1'b0));
  FDRE \r0_data_reg[354] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[354]),
        .Q(\r0_data_reg_n_0_[354] ),
        .R(1'b0));
  FDRE \r0_data_reg[355] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[355]),
        .Q(\r0_data_reg_n_0_[355] ),
        .R(1'b0));
  FDRE \r0_data_reg[356] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[356]),
        .Q(\r0_data_reg_n_0_[356] ),
        .R(1'b0));
  FDRE \r0_data_reg[357] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[357]),
        .Q(\r0_data_reg_n_0_[357] ),
        .R(1'b0));
  FDRE \r0_data_reg[358] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[358]),
        .Q(\r0_data_reg_n_0_[358] ),
        .R(1'b0));
  FDRE \r0_data_reg[359] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[359]),
        .Q(\r0_data_reg_n_0_[359] ),
        .R(1'b0));
  FDRE \r0_data_reg[35] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[35]),
        .Q(p_0_in1_in[35]),
        .R(1'b0));
  FDRE \r0_data_reg[360] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[360]),
        .Q(\r0_data_reg_n_0_[360] ),
        .R(1'b0));
  FDRE \r0_data_reg[361] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[361]),
        .Q(\r0_data_reg_n_0_[361] ),
        .R(1'b0));
  FDRE \r0_data_reg[362] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[362]),
        .Q(\r0_data_reg_n_0_[362] ),
        .R(1'b0));
  FDRE \r0_data_reg[363] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[363]),
        .Q(\r0_data_reg_n_0_[363] ),
        .R(1'b0));
  FDRE \r0_data_reg[364] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[364]),
        .Q(\r0_data_reg_n_0_[364] ),
        .R(1'b0));
  FDRE \r0_data_reg[365] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[365]),
        .Q(\r0_data_reg_n_0_[365] ),
        .R(1'b0));
  FDRE \r0_data_reg[366] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[366]),
        .Q(\r0_data_reg_n_0_[366] ),
        .R(1'b0));
  FDRE \r0_data_reg[367] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[367]),
        .Q(\r0_data_reg_n_0_[367] ),
        .R(1'b0));
  FDRE \r0_data_reg[368] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[368]),
        .Q(\r0_data_reg_n_0_[368] ),
        .R(1'b0));
  FDRE \r0_data_reg[369] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[369]),
        .Q(\r0_data_reg_n_0_[369] ),
        .R(1'b0));
  FDRE \r0_data_reg[36] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[36]),
        .Q(p_0_in1_in[36]),
        .R(1'b0));
  FDRE \r0_data_reg[370] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[370]),
        .Q(\r0_data_reg_n_0_[370] ),
        .R(1'b0));
  FDRE \r0_data_reg[371] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[371]),
        .Q(\r0_data_reg_n_0_[371] ),
        .R(1'b0));
  FDRE \r0_data_reg[372] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[372]),
        .Q(\r0_data_reg_n_0_[372] ),
        .R(1'b0));
  FDRE \r0_data_reg[373] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[373]),
        .Q(\r0_data_reg_n_0_[373] ),
        .R(1'b0));
  FDRE \r0_data_reg[374] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[374]),
        .Q(\r0_data_reg_n_0_[374] ),
        .R(1'b0));
  FDRE \r0_data_reg[375] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[375]),
        .Q(\r0_data_reg_n_0_[375] ),
        .R(1'b0));
  FDRE \r0_data_reg[376] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[376]),
        .Q(\r0_data_reg_n_0_[376] ),
        .R(1'b0));
  FDRE \r0_data_reg[377] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[377]),
        .Q(\r0_data_reg_n_0_[377] ),
        .R(1'b0));
  FDRE \r0_data_reg[378] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[378]),
        .Q(\r0_data_reg_n_0_[378] ),
        .R(1'b0));
  FDRE \r0_data_reg[379] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[379]),
        .Q(\r0_data_reg_n_0_[379] ),
        .R(1'b0));
  FDRE \r0_data_reg[37] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[37]),
        .Q(p_0_in1_in[37]),
        .R(1'b0));
  FDRE \r0_data_reg[380] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[380]),
        .Q(\r0_data_reg_n_0_[380] ),
        .R(1'b0));
  FDRE \r0_data_reg[381] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[381]),
        .Q(\r0_data_reg_n_0_[381] ),
        .R(1'b0));
  FDRE \r0_data_reg[382] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[382]),
        .Q(\r0_data_reg_n_0_[382] ),
        .R(1'b0));
  FDRE \r0_data_reg[383] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[383]),
        .Q(\r0_data_reg_n_0_[383] ),
        .R(1'b0));
  FDRE \r0_data_reg[38] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[38]),
        .Q(p_0_in1_in[38]),
        .R(1'b0));
  FDRE \r0_data_reg[39] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[39]),
        .Q(p_0_in1_in[39]),
        .R(1'b0));
  FDRE \r0_data_reg[3] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[3]),
        .Q(p_0_in1_in[3]),
        .R(1'b0));
  FDRE \r0_data_reg[40] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[40]),
        .Q(p_0_in1_in[40]),
        .R(1'b0));
  FDRE \r0_data_reg[41] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[41]),
        .Q(p_0_in1_in[41]),
        .R(1'b0));
  FDRE \r0_data_reg[42] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[42]),
        .Q(p_0_in1_in[42]),
        .R(1'b0));
  FDRE \r0_data_reg[43] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[43]),
        .Q(p_0_in1_in[43]),
        .R(1'b0));
  FDRE \r0_data_reg[44] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[44]),
        .Q(p_0_in1_in[44]),
        .R(1'b0));
  FDRE \r0_data_reg[45] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[45]),
        .Q(p_0_in1_in[45]),
        .R(1'b0));
  FDRE \r0_data_reg[46] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[46]),
        .Q(p_0_in1_in[46]),
        .R(1'b0));
  FDRE \r0_data_reg[47] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[47]),
        .Q(p_0_in1_in[47]),
        .R(1'b0));
  FDRE \r0_data_reg[48] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[48]),
        .Q(p_0_in1_in[48]),
        .R(1'b0));
  FDRE \r0_data_reg[49] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[49]),
        .Q(p_0_in1_in[49]),
        .R(1'b0));
  FDRE \r0_data_reg[4] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[4]),
        .Q(p_0_in1_in[4]),
        .R(1'b0));
  FDRE \r0_data_reg[50] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[50]),
        .Q(p_0_in1_in[50]),
        .R(1'b0));
  FDRE \r0_data_reg[51] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[51]),
        .Q(p_0_in1_in[51]),
        .R(1'b0));
  FDRE \r0_data_reg[52] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[52]),
        .Q(p_0_in1_in[52]),
        .R(1'b0));
  FDRE \r0_data_reg[53] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[53]),
        .Q(p_0_in1_in[53]),
        .R(1'b0));
  FDRE \r0_data_reg[54] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[54]),
        .Q(p_0_in1_in[54]),
        .R(1'b0));
  FDRE \r0_data_reg[55] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[55]),
        .Q(p_0_in1_in[55]),
        .R(1'b0));
  FDRE \r0_data_reg[56] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[56]),
        .Q(p_0_in1_in[56]),
        .R(1'b0));
  FDRE \r0_data_reg[57] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[57]),
        .Q(p_0_in1_in[57]),
        .R(1'b0));
  FDRE \r0_data_reg[58] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[58]),
        .Q(p_0_in1_in[58]),
        .R(1'b0));
  FDRE \r0_data_reg[59] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[59]),
        .Q(p_0_in1_in[59]),
        .R(1'b0));
  FDRE \r0_data_reg[5] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[5]),
        .Q(p_0_in1_in[5]),
        .R(1'b0));
  FDRE \r0_data_reg[60] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[60]),
        .Q(p_0_in1_in[60]),
        .R(1'b0));
  FDRE \r0_data_reg[61] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[61]),
        .Q(p_0_in1_in[61]),
        .R(1'b0));
  FDRE \r0_data_reg[62] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[62]),
        .Q(p_0_in1_in[62]),
        .R(1'b0));
  FDRE \r0_data_reg[63] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[63]),
        .Q(p_0_in1_in[63]),
        .R(1'b0));
  FDRE \r0_data_reg[64] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[64]),
        .Q(p_0_in1_in[64]),
        .R(1'b0));
  FDRE \r0_data_reg[65] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[65]),
        .Q(p_0_in1_in[65]),
        .R(1'b0));
  FDRE \r0_data_reg[66] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[66]),
        .Q(p_0_in1_in[66]),
        .R(1'b0));
  FDRE \r0_data_reg[67] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[67]),
        .Q(p_0_in1_in[67]),
        .R(1'b0));
  FDRE \r0_data_reg[68] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[68]),
        .Q(p_0_in1_in[68]),
        .R(1'b0));
  FDRE \r0_data_reg[69] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[69]),
        .Q(p_0_in1_in[69]),
        .R(1'b0));
  FDRE \r0_data_reg[6] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[6]),
        .Q(p_0_in1_in[6]),
        .R(1'b0));
  FDRE \r0_data_reg[70] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[70]),
        .Q(p_0_in1_in[70]),
        .R(1'b0));
  FDRE \r0_data_reg[71] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[71]),
        .Q(p_0_in1_in[71]),
        .R(1'b0));
  FDRE \r0_data_reg[72] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[72]),
        .Q(p_0_in1_in[72]),
        .R(1'b0));
  FDRE \r0_data_reg[73] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[73]),
        .Q(p_0_in1_in[73]),
        .R(1'b0));
  FDRE \r0_data_reg[74] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[74]),
        .Q(p_0_in1_in[74]),
        .R(1'b0));
  FDRE \r0_data_reg[75] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[75]),
        .Q(p_0_in1_in[75]),
        .R(1'b0));
  FDRE \r0_data_reg[76] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[76]),
        .Q(p_0_in1_in[76]),
        .R(1'b0));
  FDRE \r0_data_reg[77] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[77]),
        .Q(p_0_in1_in[77]),
        .R(1'b0));
  FDRE \r0_data_reg[78] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[78]),
        .Q(p_0_in1_in[78]),
        .R(1'b0));
  FDRE \r0_data_reg[79] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[79]),
        .Q(p_0_in1_in[79]),
        .R(1'b0));
  FDRE \r0_data_reg[7] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[7]),
        .Q(p_0_in1_in[7]),
        .R(1'b0));
  FDRE \r0_data_reg[80] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[80]),
        .Q(p_0_in1_in[80]),
        .R(1'b0));
  FDRE \r0_data_reg[81] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[81]),
        .Q(p_0_in1_in[81]),
        .R(1'b0));
  FDRE \r0_data_reg[82] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[82]),
        .Q(p_0_in1_in[82]),
        .R(1'b0));
  FDRE \r0_data_reg[83] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[83]),
        .Q(p_0_in1_in[83]),
        .R(1'b0));
  FDRE \r0_data_reg[84] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[84]),
        .Q(p_0_in1_in[84]),
        .R(1'b0));
  FDRE \r0_data_reg[85] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[85]),
        .Q(p_0_in1_in[85]),
        .R(1'b0));
  FDRE \r0_data_reg[86] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[86]),
        .Q(p_0_in1_in[86]),
        .R(1'b0));
  FDRE \r0_data_reg[87] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[87]),
        .Q(p_0_in1_in[87]),
        .R(1'b0));
  FDRE \r0_data_reg[88] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[88]),
        .Q(p_0_in1_in[88]),
        .R(1'b0));
  FDRE \r0_data_reg[89] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[89]),
        .Q(p_0_in1_in[89]),
        .R(1'b0));
  FDRE \r0_data_reg[8] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[8]),
        .Q(p_0_in1_in[8]),
        .R(1'b0));
  FDRE \r0_data_reg[90] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[90]),
        .Q(p_0_in1_in[90]),
        .R(1'b0));
  FDRE \r0_data_reg[91] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[91]),
        .Q(p_0_in1_in[91]),
        .R(1'b0));
  FDRE \r0_data_reg[92] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[92]),
        .Q(p_0_in1_in[92]),
        .R(1'b0));
  FDRE \r0_data_reg[93] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[93]),
        .Q(p_0_in1_in[93]),
        .R(1'b0));
  FDRE \r0_data_reg[94] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[94]),
        .Q(p_0_in1_in[94]),
        .R(1'b0));
  FDRE \r0_data_reg[95] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[95]),
        .Q(p_0_in1_in[95]),
        .R(1'b0));
  FDRE \r0_data_reg[96] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[96]),
        .Q(p_0_in1_in[96]),
        .R(1'b0));
  FDRE \r0_data_reg[97] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[97]),
        .Q(p_0_in1_in[97]),
        .R(1'b0));
  FDRE \r0_data_reg[98] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[98]),
        .Q(p_0_in1_in[98]),
        .R(1'b0));
  FDRE \r0_data_reg[99] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[99]),
        .Q(p_0_in1_in[99]),
        .R(1'b0));
  FDRE \r0_data_reg[9] 
       (.C(aclk),
        .CE(r0_load),
        .D(D[9]),
        .Q(p_0_in1_in[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r0_out_sel_next_r[0]_i_1 
       (.I0(p_1_in[1]),
        .O(p_1_in[0]));
  LUT5 #(
    .INIT(32'hFFFFF444)) 
    \r0_out_sel_next_r[1]_i_1 
       (.I0(\state_reg[1]_0 ),
        .I1(r0_load),
        .I2(m_axis_tready),
        .I3(\r0_out_sel_r_reg_n_0_[1] ),
        .I4(areset_r),
        .O(\r0_out_sel_next_r[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \r0_out_sel_next_r[1]_i_2 
       (.I0(m_axis_tready),
        .I1(\r0_out_sel_next_r_reg_n_0_[1] ),
        .O(r0_out_sel_next_r));
  FDSE #(
    .INIT(1'b1)) 
    \r0_out_sel_next_r_reg[0] 
       (.C(aclk),
        .CE(r0_out_sel_next_r),
        .D(p_1_in[0]),
        .Q(p_1_in[1]),
        .S(\r0_out_sel_next_r[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r0_out_sel_next_r_reg[1] 
       (.C(aclk),
        .CE(r0_out_sel_next_r),
        .D(p_1_in[1]),
        .Q(\r0_out_sel_next_r_reg_n_0_[1] ),
        .R(\r0_out_sel_next_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000015150015)) 
    \r0_out_sel_r[0]_i_1 
       (.I0(areset_r),
        .I1(\r0_out_sel_r_reg_n_0_[1] ),
        .I2(m_axis_tready),
        .I3(r0_load),
        .I4(\state_reg[1]_0 ),
        .I5(\r0_out_sel_r[0]_i_2_n_0 ),
        .O(\r0_out_sel_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hA3F3)) 
    \r0_out_sel_r[0]_i_2 
       (.I0(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I1(\r0_out_sel_r_reg_n_0_[0] ),
        .I2(m_axis_tready),
        .I3(p_1_in[1]),
        .O(\r0_out_sel_r[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0230023000000230)) 
    \r0_out_sel_r[1]_i_1 
       (.I0(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I1(areset_r),
        .I2(\r0_out_sel_r_reg_n_0_[1] ),
        .I3(m_axis_tready),
        .I4(r0_load),
        .I5(\state_reg[1]_0 ),
        .O(\r0_out_sel_r[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r0_out_sel_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\r0_out_sel_r[0]_i_1_n_0 ),
        .Q(\r0_out_sel_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r0_out_sel_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\r0_out_sel_r[1]_i_1_n_0 ),
        .Q(\r0_out_sel_r_reg_n_0_[1] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[0]_i_1 
       (.I0(p_0_in1_in[128]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[256] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[0]),
        .O(\r1_data[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[100]_i_1 
       (.I0(p_0_in1_in[228]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[356] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[100]),
        .O(\r1_data[100]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[101]_i_1 
       (.I0(p_0_in1_in[229]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[357] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[101]),
        .O(\r1_data[101]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[102]_i_1 
       (.I0(p_0_in1_in[230]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[358] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[102]),
        .O(\r1_data[102]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[103]_i_1 
       (.I0(p_0_in1_in[231]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[359] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[103]),
        .O(\r1_data[103]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[104]_i_1 
       (.I0(p_0_in1_in[232]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[360] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[104]),
        .O(\r1_data[104]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[105]_i_1 
       (.I0(p_0_in1_in[233]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[361] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[105]),
        .O(\r1_data[105]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[106]_i_1 
       (.I0(p_0_in1_in[234]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[362] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[106]),
        .O(\r1_data[106]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[107]_i_1 
       (.I0(p_0_in1_in[235]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[363] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[107]),
        .O(\r1_data[107]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[108]_i_1 
       (.I0(p_0_in1_in[236]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[364] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[108]),
        .O(\r1_data[108]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[109]_i_1 
       (.I0(p_0_in1_in[237]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[365] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[109]),
        .O(\r1_data[109]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[10]_i_1 
       (.I0(p_0_in1_in[138]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[266] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[10]),
        .O(\r1_data[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[110]_i_1 
       (.I0(p_0_in1_in[238]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[366] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[110]),
        .O(\r1_data[110]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[111]_i_1 
       (.I0(p_0_in1_in[239]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[367] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[111]),
        .O(\r1_data[111]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[112]_i_1 
       (.I0(p_0_in1_in[240]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[368] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[112]),
        .O(\r1_data[112]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[113]_i_1 
       (.I0(p_0_in1_in[241]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[369] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[113]),
        .O(\r1_data[113]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[114]_i_1 
       (.I0(p_0_in1_in[242]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[370] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[114]),
        .O(\r1_data[114]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[115]_i_1 
       (.I0(p_0_in1_in[243]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[371] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[115]),
        .O(\r1_data[115]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[116]_i_1 
       (.I0(p_0_in1_in[244]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[372] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[116]),
        .O(\r1_data[116]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[117]_i_1 
       (.I0(p_0_in1_in[245]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[373] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[117]),
        .O(\r1_data[117]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[118]_i_1 
       (.I0(p_0_in1_in[246]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[374] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[118]),
        .O(\r1_data[118]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[119]_i_1 
       (.I0(p_0_in1_in[247]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[375] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[119]),
        .O(\r1_data[119]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[11]_i_1 
       (.I0(p_0_in1_in[139]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[267] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[11]),
        .O(\r1_data[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[120]_i_1 
       (.I0(p_0_in1_in[248]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[376] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[120]),
        .O(\r1_data[120]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[121]_i_1 
       (.I0(p_0_in1_in[249]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[377] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[121]),
        .O(\r1_data[121]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[122]_i_1 
       (.I0(p_0_in1_in[250]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[378] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[122]),
        .O(\r1_data[122]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[123]_i_1 
       (.I0(p_0_in1_in[251]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[379] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[123]),
        .O(\r1_data[123]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[124]_i_1 
       (.I0(p_0_in1_in[252]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[380] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[124]),
        .O(\r1_data[124]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[125]_i_1 
       (.I0(p_0_in1_in[253]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[381] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[125]),
        .O(\r1_data[125]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[126]_i_1 
       (.I0(p_0_in1_in[254]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[382] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[126]),
        .O(\r1_data[126]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \r1_data[127]_i_1 
       (.I0(d2_ready),
        .I1(\state_reg[1]_0 ),
        .I2(\state_reg_n_0_[2] ),
        .O(r1_load));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[127]_i_2 
       (.I0(p_0_in1_in[255]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[383] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[127]),
        .O(\r1_data[127]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[12]_i_1 
       (.I0(p_0_in1_in[140]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[268] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[12]),
        .O(\r1_data[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[13]_i_1 
       (.I0(p_0_in1_in[141]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[269] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[13]),
        .O(\r1_data[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[14]_i_1 
       (.I0(p_0_in1_in[142]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[270] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[14]),
        .O(\r1_data[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[15]_i_1 
       (.I0(p_0_in1_in[143]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[271] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[15]),
        .O(\r1_data[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[16]_i_1 
       (.I0(p_0_in1_in[144]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[272] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[16]),
        .O(\r1_data[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[17]_i_1 
       (.I0(p_0_in1_in[145]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[273] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[17]),
        .O(\r1_data[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[18]_i_1 
       (.I0(p_0_in1_in[146]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[274] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[18]),
        .O(\r1_data[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[19]_i_1 
       (.I0(p_0_in1_in[147]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[275] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[19]),
        .O(\r1_data[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[1]_i_1 
       (.I0(p_0_in1_in[129]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[257] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[1]),
        .O(\r1_data[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[20]_i_1 
       (.I0(p_0_in1_in[148]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[276] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[20]),
        .O(\r1_data[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[21]_i_1 
       (.I0(p_0_in1_in[149]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[277] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[21]),
        .O(\r1_data[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[22]_i_1 
       (.I0(p_0_in1_in[150]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[278] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[22]),
        .O(\r1_data[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[23]_i_1 
       (.I0(p_0_in1_in[151]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[279] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[23]),
        .O(\r1_data[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[24]_i_1 
       (.I0(p_0_in1_in[152]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[280] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[24]),
        .O(\r1_data[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[25]_i_1 
       (.I0(p_0_in1_in[153]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[281] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[25]),
        .O(\r1_data[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[26]_i_1 
       (.I0(p_0_in1_in[154]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[282] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[26]),
        .O(\r1_data[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[27]_i_1 
       (.I0(p_0_in1_in[155]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[283] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[27]),
        .O(\r1_data[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[28]_i_1 
       (.I0(p_0_in1_in[156]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[284] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[28]),
        .O(\r1_data[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[29]_i_1 
       (.I0(p_0_in1_in[157]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[285] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[29]),
        .O(\r1_data[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[2]_i_1 
       (.I0(p_0_in1_in[130]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[258] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[2]),
        .O(\r1_data[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[30]_i_1 
       (.I0(p_0_in1_in[158]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[286] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[30]),
        .O(\r1_data[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[31]_i_1 
       (.I0(p_0_in1_in[159]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[287] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[31]),
        .O(\r1_data[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[32]_i_1 
       (.I0(p_0_in1_in[160]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[288] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[32]),
        .O(\r1_data[32]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[33]_i_1 
       (.I0(p_0_in1_in[161]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[289] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[33]),
        .O(\r1_data[33]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[34]_i_1 
       (.I0(p_0_in1_in[162]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[290] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[34]),
        .O(\r1_data[34]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[35]_i_1 
       (.I0(p_0_in1_in[163]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[291] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[35]),
        .O(\r1_data[35]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[36]_i_1 
       (.I0(p_0_in1_in[164]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[292] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[36]),
        .O(\r1_data[36]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[37]_i_1 
       (.I0(p_0_in1_in[165]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[293] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[37]),
        .O(\r1_data[37]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[38]_i_1 
       (.I0(p_0_in1_in[166]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[294] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[38]),
        .O(\r1_data[38]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[39]_i_1 
       (.I0(p_0_in1_in[167]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[295] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[39]),
        .O(\r1_data[39]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[3]_i_1 
       (.I0(p_0_in1_in[131]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[259] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[3]),
        .O(\r1_data[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[40]_i_1 
       (.I0(p_0_in1_in[168]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[296] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[40]),
        .O(\r1_data[40]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[41]_i_1 
       (.I0(p_0_in1_in[169]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[297] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[41]),
        .O(\r1_data[41]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[42]_i_1 
       (.I0(p_0_in1_in[170]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[298] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[42]),
        .O(\r1_data[42]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[43]_i_1 
       (.I0(p_0_in1_in[171]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[299] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[43]),
        .O(\r1_data[43]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[44]_i_1 
       (.I0(p_0_in1_in[172]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[300] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[44]),
        .O(\r1_data[44]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[45]_i_1 
       (.I0(p_0_in1_in[173]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[301] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[45]),
        .O(\r1_data[45]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[46]_i_1 
       (.I0(p_0_in1_in[174]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[302] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[46]),
        .O(\r1_data[46]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[47]_i_1 
       (.I0(p_0_in1_in[175]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[303] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[47]),
        .O(\r1_data[47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[48]_i_1 
       (.I0(p_0_in1_in[176]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[304] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[48]),
        .O(\r1_data[48]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[49]_i_1 
       (.I0(p_0_in1_in[177]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[305] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[49]),
        .O(\r1_data[49]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[4]_i_1 
       (.I0(p_0_in1_in[132]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[260] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[4]),
        .O(\r1_data[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[50]_i_1 
       (.I0(p_0_in1_in[178]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[306] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[50]),
        .O(\r1_data[50]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[51]_i_1 
       (.I0(p_0_in1_in[179]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[307] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[51]),
        .O(\r1_data[51]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[52]_i_1 
       (.I0(p_0_in1_in[180]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[308] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[52]),
        .O(\r1_data[52]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[53]_i_1 
       (.I0(p_0_in1_in[181]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[309] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[53]),
        .O(\r1_data[53]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[54]_i_1 
       (.I0(p_0_in1_in[182]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[310] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[54]),
        .O(\r1_data[54]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[55]_i_1 
       (.I0(p_0_in1_in[183]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[311] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[55]),
        .O(\r1_data[55]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[56]_i_1 
       (.I0(p_0_in1_in[184]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[312] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[56]),
        .O(\r1_data[56]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[57]_i_1 
       (.I0(p_0_in1_in[185]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[313] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[57]),
        .O(\r1_data[57]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[58]_i_1 
       (.I0(p_0_in1_in[186]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[314] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[58]),
        .O(\r1_data[58]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[59]_i_1 
       (.I0(p_0_in1_in[187]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[315] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[59]),
        .O(\r1_data[59]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[5]_i_1 
       (.I0(p_0_in1_in[133]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[261] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[5]),
        .O(\r1_data[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[60]_i_1 
       (.I0(p_0_in1_in[188]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[316] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[60]),
        .O(\r1_data[60]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[61]_i_1 
       (.I0(p_0_in1_in[189]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[317] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[61]),
        .O(\r1_data[61]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[62]_i_1 
       (.I0(p_0_in1_in[190]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[318] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[62]),
        .O(\r1_data[62]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[63]_i_1 
       (.I0(p_0_in1_in[191]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[319] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[63]),
        .O(\r1_data[63]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[64]_i_1 
       (.I0(p_0_in1_in[192]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[320] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[64]),
        .O(\r1_data[64]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[65]_i_1 
       (.I0(p_0_in1_in[193]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[321] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[65]),
        .O(\r1_data[65]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[66]_i_1 
       (.I0(p_0_in1_in[194]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[322] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[66]),
        .O(\r1_data[66]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[67]_i_1 
       (.I0(p_0_in1_in[195]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[323] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[67]),
        .O(\r1_data[67]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[68]_i_1 
       (.I0(p_0_in1_in[196]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[324] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[68]),
        .O(\r1_data[68]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[69]_i_1 
       (.I0(p_0_in1_in[197]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[325] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[69]),
        .O(\r1_data[69]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[6]_i_1 
       (.I0(p_0_in1_in[134]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[262] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[6]),
        .O(\r1_data[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[70]_i_1 
       (.I0(p_0_in1_in[198]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[326] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[70]),
        .O(\r1_data[70]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[71]_i_1 
       (.I0(p_0_in1_in[199]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[327] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[71]),
        .O(\r1_data[71]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[72]_i_1 
       (.I0(p_0_in1_in[200]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[328] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[72]),
        .O(\r1_data[72]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[73]_i_1 
       (.I0(p_0_in1_in[201]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[329] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[73]),
        .O(\r1_data[73]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[74]_i_1 
       (.I0(p_0_in1_in[202]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[330] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[74]),
        .O(\r1_data[74]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[75]_i_1 
       (.I0(p_0_in1_in[203]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[331] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[75]),
        .O(\r1_data[75]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[76]_i_1 
       (.I0(p_0_in1_in[204]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[332] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[76]),
        .O(\r1_data[76]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[77]_i_1 
       (.I0(p_0_in1_in[205]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[333] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[77]),
        .O(\r1_data[77]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[78]_i_1 
       (.I0(p_0_in1_in[206]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[334] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[78]),
        .O(\r1_data[78]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[79]_i_1 
       (.I0(p_0_in1_in[207]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[335] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[79]),
        .O(\r1_data[79]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[7]_i_1 
       (.I0(p_0_in1_in[135]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[263] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[7]),
        .O(\r1_data[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[80]_i_1 
       (.I0(p_0_in1_in[208]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[336] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[80]),
        .O(\r1_data[80]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[81]_i_1 
       (.I0(p_0_in1_in[209]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[337] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[81]),
        .O(\r1_data[81]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[82]_i_1 
       (.I0(p_0_in1_in[210]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[338] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[82]),
        .O(\r1_data[82]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[83]_i_1 
       (.I0(p_0_in1_in[211]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[339] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[83]),
        .O(\r1_data[83]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[84]_i_1 
       (.I0(p_0_in1_in[212]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[340] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[84]),
        .O(\r1_data[84]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[85]_i_1 
       (.I0(p_0_in1_in[213]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[341] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[85]),
        .O(\r1_data[85]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[86]_i_1 
       (.I0(p_0_in1_in[214]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[342] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[86]),
        .O(\r1_data[86]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[87]_i_1 
       (.I0(p_0_in1_in[215]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[343] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[87]),
        .O(\r1_data[87]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[88]_i_1 
       (.I0(p_0_in1_in[216]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[344] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[88]),
        .O(\r1_data[88]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[89]_i_1 
       (.I0(p_0_in1_in[217]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[345] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[89]),
        .O(\r1_data[89]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[8]_i_1 
       (.I0(p_0_in1_in[136]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[264] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[8]),
        .O(\r1_data[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[90]_i_1 
       (.I0(p_0_in1_in[218]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[346] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[90]),
        .O(\r1_data[90]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[91]_i_1 
       (.I0(p_0_in1_in[219]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[347] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[91]),
        .O(\r1_data[91]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[92]_i_1 
       (.I0(p_0_in1_in[220]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[348] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[92]),
        .O(\r1_data[92]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[93]_i_1 
       (.I0(p_0_in1_in[221]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[349] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[93]),
        .O(\r1_data[93]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[94]_i_1 
       (.I0(p_0_in1_in[222]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[350] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[94]),
        .O(\r1_data[94]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[95]_i_1 
       (.I0(p_0_in1_in[223]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[351] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[95]),
        .O(\r1_data[95]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[96]_i_1 
       (.I0(p_0_in1_in[224]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[352] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[96]),
        .O(\r1_data[96]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[97]_i_1 
       (.I0(p_0_in1_in[225]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[353] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[97]),
        .O(\r1_data[97]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[98]_i_1 
       (.I0(p_0_in1_in[226]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[354] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[98]),
        .O(\r1_data[98]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[99]_i_1 
       (.I0(p_0_in1_in[227]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[355] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[99]),
        .O(\r1_data[99]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r1_data[9]_i_1 
       (.I0(p_0_in1_in[137]),
        .I1(p_1_in[1]),
        .I2(\r0_data_reg_n_0_[265] ),
        .I3(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I4(p_0_in1_in[9]),
        .O(\r1_data[9]_i_1_n_0 ));
  FDRE \r1_data_reg[0] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[0]_i_1_n_0 ),
        .Q(p_0_in1_in[256]),
        .R(1'b0));
  FDRE \r1_data_reg[100] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[100]_i_1_n_0 ),
        .Q(p_0_in1_in[356]),
        .R(1'b0));
  FDRE \r1_data_reg[101] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[101]_i_1_n_0 ),
        .Q(p_0_in1_in[357]),
        .R(1'b0));
  FDRE \r1_data_reg[102] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[102]_i_1_n_0 ),
        .Q(p_0_in1_in[358]),
        .R(1'b0));
  FDRE \r1_data_reg[103] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[103]_i_1_n_0 ),
        .Q(p_0_in1_in[359]),
        .R(1'b0));
  FDRE \r1_data_reg[104] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[104]_i_1_n_0 ),
        .Q(p_0_in1_in[360]),
        .R(1'b0));
  FDRE \r1_data_reg[105] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[105]_i_1_n_0 ),
        .Q(p_0_in1_in[361]),
        .R(1'b0));
  FDRE \r1_data_reg[106] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[106]_i_1_n_0 ),
        .Q(p_0_in1_in[362]),
        .R(1'b0));
  FDRE \r1_data_reg[107] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[107]_i_1_n_0 ),
        .Q(p_0_in1_in[363]),
        .R(1'b0));
  FDRE \r1_data_reg[108] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[108]_i_1_n_0 ),
        .Q(p_0_in1_in[364]),
        .R(1'b0));
  FDRE \r1_data_reg[109] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[109]_i_1_n_0 ),
        .Q(p_0_in1_in[365]),
        .R(1'b0));
  FDRE \r1_data_reg[10] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[10]_i_1_n_0 ),
        .Q(p_0_in1_in[266]),
        .R(1'b0));
  FDRE \r1_data_reg[110] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[110]_i_1_n_0 ),
        .Q(p_0_in1_in[366]),
        .R(1'b0));
  FDRE \r1_data_reg[111] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[111]_i_1_n_0 ),
        .Q(p_0_in1_in[367]),
        .R(1'b0));
  FDRE \r1_data_reg[112] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[112]_i_1_n_0 ),
        .Q(p_0_in1_in[368]),
        .R(1'b0));
  FDRE \r1_data_reg[113] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[113]_i_1_n_0 ),
        .Q(p_0_in1_in[369]),
        .R(1'b0));
  FDRE \r1_data_reg[114] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[114]_i_1_n_0 ),
        .Q(p_0_in1_in[370]),
        .R(1'b0));
  FDRE \r1_data_reg[115] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[115]_i_1_n_0 ),
        .Q(p_0_in1_in[371]),
        .R(1'b0));
  FDRE \r1_data_reg[116] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[116]_i_1_n_0 ),
        .Q(p_0_in1_in[372]),
        .R(1'b0));
  FDRE \r1_data_reg[117] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[117]_i_1_n_0 ),
        .Q(p_0_in1_in[373]),
        .R(1'b0));
  FDRE \r1_data_reg[118] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[118]_i_1_n_0 ),
        .Q(p_0_in1_in[374]),
        .R(1'b0));
  FDRE \r1_data_reg[119] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[119]_i_1_n_0 ),
        .Q(p_0_in1_in[375]),
        .R(1'b0));
  FDRE \r1_data_reg[11] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[11]_i_1_n_0 ),
        .Q(p_0_in1_in[267]),
        .R(1'b0));
  FDRE \r1_data_reg[120] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[120]_i_1_n_0 ),
        .Q(p_0_in1_in[376]),
        .R(1'b0));
  FDRE \r1_data_reg[121] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[121]_i_1_n_0 ),
        .Q(p_0_in1_in[377]),
        .R(1'b0));
  FDRE \r1_data_reg[122] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[122]_i_1_n_0 ),
        .Q(p_0_in1_in[378]),
        .R(1'b0));
  FDRE \r1_data_reg[123] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[123]_i_1_n_0 ),
        .Q(p_0_in1_in[379]),
        .R(1'b0));
  FDRE \r1_data_reg[124] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[124]_i_1_n_0 ),
        .Q(p_0_in1_in[380]),
        .R(1'b0));
  FDRE \r1_data_reg[125] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[125]_i_1_n_0 ),
        .Q(p_0_in1_in[381]),
        .R(1'b0));
  FDRE \r1_data_reg[126] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[126]_i_1_n_0 ),
        .Q(p_0_in1_in[382]),
        .R(1'b0));
  FDRE \r1_data_reg[127] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[127]_i_2_n_0 ),
        .Q(p_0_in1_in[383]),
        .R(1'b0));
  FDRE \r1_data_reg[12] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[12]_i_1_n_0 ),
        .Q(p_0_in1_in[268]),
        .R(1'b0));
  FDRE \r1_data_reg[13] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[13]_i_1_n_0 ),
        .Q(p_0_in1_in[269]),
        .R(1'b0));
  FDRE \r1_data_reg[14] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[14]_i_1_n_0 ),
        .Q(p_0_in1_in[270]),
        .R(1'b0));
  FDRE \r1_data_reg[15] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[15]_i_1_n_0 ),
        .Q(p_0_in1_in[271]),
        .R(1'b0));
  FDRE \r1_data_reg[16] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[16]_i_1_n_0 ),
        .Q(p_0_in1_in[272]),
        .R(1'b0));
  FDRE \r1_data_reg[17] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[17]_i_1_n_0 ),
        .Q(p_0_in1_in[273]),
        .R(1'b0));
  FDRE \r1_data_reg[18] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[18]_i_1_n_0 ),
        .Q(p_0_in1_in[274]),
        .R(1'b0));
  FDRE \r1_data_reg[19] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[19]_i_1_n_0 ),
        .Q(p_0_in1_in[275]),
        .R(1'b0));
  FDRE \r1_data_reg[1] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[1]_i_1_n_0 ),
        .Q(p_0_in1_in[257]),
        .R(1'b0));
  FDRE \r1_data_reg[20] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[20]_i_1_n_0 ),
        .Q(p_0_in1_in[276]),
        .R(1'b0));
  FDRE \r1_data_reg[21] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[21]_i_1_n_0 ),
        .Q(p_0_in1_in[277]),
        .R(1'b0));
  FDRE \r1_data_reg[22] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[22]_i_1_n_0 ),
        .Q(p_0_in1_in[278]),
        .R(1'b0));
  FDRE \r1_data_reg[23] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[23]_i_1_n_0 ),
        .Q(p_0_in1_in[279]),
        .R(1'b0));
  FDRE \r1_data_reg[24] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[24]_i_1_n_0 ),
        .Q(p_0_in1_in[280]),
        .R(1'b0));
  FDRE \r1_data_reg[25] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[25]_i_1_n_0 ),
        .Q(p_0_in1_in[281]),
        .R(1'b0));
  FDRE \r1_data_reg[26] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[26]_i_1_n_0 ),
        .Q(p_0_in1_in[282]),
        .R(1'b0));
  FDRE \r1_data_reg[27] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[27]_i_1_n_0 ),
        .Q(p_0_in1_in[283]),
        .R(1'b0));
  FDRE \r1_data_reg[28] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[28]_i_1_n_0 ),
        .Q(p_0_in1_in[284]),
        .R(1'b0));
  FDRE \r1_data_reg[29] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[29]_i_1_n_0 ),
        .Q(p_0_in1_in[285]),
        .R(1'b0));
  FDRE \r1_data_reg[2] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[2]_i_1_n_0 ),
        .Q(p_0_in1_in[258]),
        .R(1'b0));
  FDRE \r1_data_reg[30] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[30]_i_1_n_0 ),
        .Q(p_0_in1_in[286]),
        .R(1'b0));
  FDRE \r1_data_reg[31] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[31]_i_1_n_0 ),
        .Q(p_0_in1_in[287]),
        .R(1'b0));
  FDRE \r1_data_reg[32] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[32]_i_1_n_0 ),
        .Q(p_0_in1_in[288]),
        .R(1'b0));
  FDRE \r1_data_reg[33] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[33]_i_1_n_0 ),
        .Q(p_0_in1_in[289]),
        .R(1'b0));
  FDRE \r1_data_reg[34] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[34]_i_1_n_0 ),
        .Q(p_0_in1_in[290]),
        .R(1'b0));
  FDRE \r1_data_reg[35] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[35]_i_1_n_0 ),
        .Q(p_0_in1_in[291]),
        .R(1'b0));
  FDRE \r1_data_reg[36] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[36]_i_1_n_0 ),
        .Q(p_0_in1_in[292]),
        .R(1'b0));
  FDRE \r1_data_reg[37] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[37]_i_1_n_0 ),
        .Q(p_0_in1_in[293]),
        .R(1'b0));
  FDRE \r1_data_reg[38] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[38]_i_1_n_0 ),
        .Q(p_0_in1_in[294]),
        .R(1'b0));
  FDRE \r1_data_reg[39] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[39]_i_1_n_0 ),
        .Q(p_0_in1_in[295]),
        .R(1'b0));
  FDRE \r1_data_reg[3] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[3]_i_1_n_0 ),
        .Q(p_0_in1_in[259]),
        .R(1'b0));
  FDRE \r1_data_reg[40] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[40]_i_1_n_0 ),
        .Q(p_0_in1_in[296]),
        .R(1'b0));
  FDRE \r1_data_reg[41] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[41]_i_1_n_0 ),
        .Q(p_0_in1_in[297]),
        .R(1'b0));
  FDRE \r1_data_reg[42] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[42]_i_1_n_0 ),
        .Q(p_0_in1_in[298]),
        .R(1'b0));
  FDRE \r1_data_reg[43] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[43]_i_1_n_0 ),
        .Q(p_0_in1_in[299]),
        .R(1'b0));
  FDRE \r1_data_reg[44] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[44]_i_1_n_0 ),
        .Q(p_0_in1_in[300]),
        .R(1'b0));
  FDRE \r1_data_reg[45] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[45]_i_1_n_0 ),
        .Q(p_0_in1_in[301]),
        .R(1'b0));
  FDRE \r1_data_reg[46] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[46]_i_1_n_0 ),
        .Q(p_0_in1_in[302]),
        .R(1'b0));
  FDRE \r1_data_reg[47] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[47]_i_1_n_0 ),
        .Q(p_0_in1_in[303]),
        .R(1'b0));
  FDRE \r1_data_reg[48] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[48]_i_1_n_0 ),
        .Q(p_0_in1_in[304]),
        .R(1'b0));
  FDRE \r1_data_reg[49] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[49]_i_1_n_0 ),
        .Q(p_0_in1_in[305]),
        .R(1'b0));
  FDRE \r1_data_reg[4] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[4]_i_1_n_0 ),
        .Q(p_0_in1_in[260]),
        .R(1'b0));
  FDRE \r1_data_reg[50] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[50]_i_1_n_0 ),
        .Q(p_0_in1_in[306]),
        .R(1'b0));
  FDRE \r1_data_reg[51] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[51]_i_1_n_0 ),
        .Q(p_0_in1_in[307]),
        .R(1'b0));
  FDRE \r1_data_reg[52] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[52]_i_1_n_0 ),
        .Q(p_0_in1_in[308]),
        .R(1'b0));
  FDRE \r1_data_reg[53] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[53]_i_1_n_0 ),
        .Q(p_0_in1_in[309]),
        .R(1'b0));
  FDRE \r1_data_reg[54] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[54]_i_1_n_0 ),
        .Q(p_0_in1_in[310]),
        .R(1'b0));
  FDRE \r1_data_reg[55] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[55]_i_1_n_0 ),
        .Q(p_0_in1_in[311]),
        .R(1'b0));
  FDRE \r1_data_reg[56] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[56]_i_1_n_0 ),
        .Q(p_0_in1_in[312]),
        .R(1'b0));
  FDRE \r1_data_reg[57] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[57]_i_1_n_0 ),
        .Q(p_0_in1_in[313]),
        .R(1'b0));
  FDRE \r1_data_reg[58] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[58]_i_1_n_0 ),
        .Q(p_0_in1_in[314]),
        .R(1'b0));
  FDRE \r1_data_reg[59] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[59]_i_1_n_0 ),
        .Q(p_0_in1_in[315]),
        .R(1'b0));
  FDRE \r1_data_reg[5] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[5]_i_1_n_0 ),
        .Q(p_0_in1_in[261]),
        .R(1'b0));
  FDRE \r1_data_reg[60] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[60]_i_1_n_0 ),
        .Q(p_0_in1_in[316]),
        .R(1'b0));
  FDRE \r1_data_reg[61] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[61]_i_1_n_0 ),
        .Q(p_0_in1_in[317]),
        .R(1'b0));
  FDRE \r1_data_reg[62] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[62]_i_1_n_0 ),
        .Q(p_0_in1_in[318]),
        .R(1'b0));
  FDRE \r1_data_reg[63] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[63]_i_1_n_0 ),
        .Q(p_0_in1_in[319]),
        .R(1'b0));
  FDRE \r1_data_reg[64] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[64]_i_1_n_0 ),
        .Q(p_0_in1_in[320]),
        .R(1'b0));
  FDRE \r1_data_reg[65] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[65]_i_1_n_0 ),
        .Q(p_0_in1_in[321]),
        .R(1'b0));
  FDRE \r1_data_reg[66] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[66]_i_1_n_0 ),
        .Q(p_0_in1_in[322]),
        .R(1'b0));
  FDRE \r1_data_reg[67] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[67]_i_1_n_0 ),
        .Q(p_0_in1_in[323]),
        .R(1'b0));
  FDRE \r1_data_reg[68] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[68]_i_1_n_0 ),
        .Q(p_0_in1_in[324]),
        .R(1'b0));
  FDRE \r1_data_reg[69] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[69]_i_1_n_0 ),
        .Q(p_0_in1_in[325]),
        .R(1'b0));
  FDRE \r1_data_reg[6] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[6]_i_1_n_0 ),
        .Q(p_0_in1_in[262]),
        .R(1'b0));
  FDRE \r1_data_reg[70] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[70]_i_1_n_0 ),
        .Q(p_0_in1_in[326]),
        .R(1'b0));
  FDRE \r1_data_reg[71] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[71]_i_1_n_0 ),
        .Q(p_0_in1_in[327]),
        .R(1'b0));
  FDRE \r1_data_reg[72] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[72]_i_1_n_0 ),
        .Q(p_0_in1_in[328]),
        .R(1'b0));
  FDRE \r1_data_reg[73] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[73]_i_1_n_0 ),
        .Q(p_0_in1_in[329]),
        .R(1'b0));
  FDRE \r1_data_reg[74] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[74]_i_1_n_0 ),
        .Q(p_0_in1_in[330]),
        .R(1'b0));
  FDRE \r1_data_reg[75] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[75]_i_1_n_0 ),
        .Q(p_0_in1_in[331]),
        .R(1'b0));
  FDRE \r1_data_reg[76] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[76]_i_1_n_0 ),
        .Q(p_0_in1_in[332]),
        .R(1'b0));
  FDRE \r1_data_reg[77] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[77]_i_1_n_0 ),
        .Q(p_0_in1_in[333]),
        .R(1'b0));
  FDRE \r1_data_reg[78] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[78]_i_1_n_0 ),
        .Q(p_0_in1_in[334]),
        .R(1'b0));
  FDRE \r1_data_reg[79] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[79]_i_1_n_0 ),
        .Q(p_0_in1_in[335]),
        .R(1'b0));
  FDRE \r1_data_reg[7] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[7]_i_1_n_0 ),
        .Q(p_0_in1_in[263]),
        .R(1'b0));
  FDRE \r1_data_reg[80] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[80]_i_1_n_0 ),
        .Q(p_0_in1_in[336]),
        .R(1'b0));
  FDRE \r1_data_reg[81] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[81]_i_1_n_0 ),
        .Q(p_0_in1_in[337]),
        .R(1'b0));
  FDRE \r1_data_reg[82] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[82]_i_1_n_0 ),
        .Q(p_0_in1_in[338]),
        .R(1'b0));
  FDRE \r1_data_reg[83] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[83]_i_1_n_0 ),
        .Q(p_0_in1_in[339]),
        .R(1'b0));
  FDRE \r1_data_reg[84] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[84]_i_1_n_0 ),
        .Q(p_0_in1_in[340]),
        .R(1'b0));
  FDRE \r1_data_reg[85] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[85]_i_1_n_0 ),
        .Q(p_0_in1_in[341]),
        .R(1'b0));
  FDRE \r1_data_reg[86] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[86]_i_1_n_0 ),
        .Q(p_0_in1_in[342]),
        .R(1'b0));
  FDRE \r1_data_reg[87] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[87]_i_1_n_0 ),
        .Q(p_0_in1_in[343]),
        .R(1'b0));
  FDRE \r1_data_reg[88] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[88]_i_1_n_0 ),
        .Q(p_0_in1_in[344]),
        .R(1'b0));
  FDRE \r1_data_reg[89] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[89]_i_1_n_0 ),
        .Q(p_0_in1_in[345]),
        .R(1'b0));
  FDRE \r1_data_reg[8] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[8]_i_1_n_0 ),
        .Q(p_0_in1_in[264]),
        .R(1'b0));
  FDRE \r1_data_reg[90] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[90]_i_1_n_0 ),
        .Q(p_0_in1_in[346]),
        .R(1'b0));
  FDRE \r1_data_reg[91] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[91]_i_1_n_0 ),
        .Q(p_0_in1_in[347]),
        .R(1'b0));
  FDRE \r1_data_reg[92] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[92]_i_1_n_0 ),
        .Q(p_0_in1_in[348]),
        .R(1'b0));
  FDRE \r1_data_reg[93] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[93]_i_1_n_0 ),
        .Q(p_0_in1_in[349]),
        .R(1'b0));
  FDRE \r1_data_reg[94] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[94]_i_1_n_0 ),
        .Q(p_0_in1_in[350]),
        .R(1'b0));
  FDRE \r1_data_reg[95] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[95]_i_1_n_0 ),
        .Q(p_0_in1_in[351]),
        .R(1'b0));
  FDRE \r1_data_reg[96] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[96]_i_1_n_0 ),
        .Q(p_0_in1_in[352]),
        .R(1'b0));
  FDRE \r1_data_reg[97] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[97]_i_1_n_0 ),
        .Q(p_0_in1_in[353]),
        .R(1'b0));
  FDRE \r1_data_reg[98] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[98]_i_1_n_0 ),
        .Q(p_0_in1_in[354]),
        .R(1'b0));
  FDRE \r1_data_reg[99] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[99]_i_1_n_0 ),
        .Q(p_0_in1_in[355]),
        .R(1'b0));
  FDRE \r1_data_reg[9] 
       (.C(aclk),
        .CE(r1_load),
        .D(\r1_data[9]_i_1_n_0 ),
        .Q(p_0_in1_in[265]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hDDDDDDDD3000FFFF)) 
    \state[0]_i_1 
       (.I0(d2_valid),
        .I1(\state_reg_n_0_[2] ),
        .I2(\r0_out_sel_next_r_reg_n_0_[1] ),
        .I3(m_axis_tready),
        .I4(\state_reg[1]_0 ),
        .I5(d2_ready),
        .O(state[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h55F010F0)) 
    \state[1]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(m_axis_tready),
        .I2(\state_reg[1]_0 ),
        .I3(d2_ready),
        .I4(d2_valid),
        .O(state[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h11400000)) 
    \state[2]_i_1 
       (.I0(m_axis_tready),
        .I1(d2_ready),
        .I2(d2_valid),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg[1]_0 ),
        .O(state[2]));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(state[0]),
        .Q(d2_ready),
        .R(areset_r));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(state[1]),
        .Q(\state_reg[1]_0 ),
        .R(areset_r));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(state[2]),
        .Q(\state_reg_n_0_[2] ),
        .R(areset_r));
endmodule

module axis_dwidth_converter_wr_axis_dwidth_converter_v1_1_26_axisc_upsizer
   (\state_reg[0]_0 ,
    d2_valid,
    D,
    s_axis_tvalid,
    d2_ready,
    areset_r,
    aclk,
    s_axis_tdata);
  output \state_reg[0]_0 ;
  output d2_valid;
  output [383:0]D;
  input s_axis_tvalid;
  input d2_ready;
  input areset_r;
  input aclk;
  input [191:0]s_axis_tdata;

  wire [383:0]D;
  wire \acc_data[383]_i_1_n_0 ;
  wire aclk;
  wire areset_r;
  wire d2_ready;
  wire d2_valid;
  wire p_0_in;
  wire [191:0]r0_data;
  wire r0_reg_sel0;
  wire \r0_reg_sel[1]_i_1_n_0 ;
  wire \r0_reg_sel_reg_n_0_[0] ;
  wire \r0_reg_sel_reg_n_0_[1] ;
  wire [191:0]s_axis_tdata;
  wire s_axis_tvalid;
  wire [2:0]state;
  wire \state[1]_i_2_n_0 ;
  wire \state[2]_i_2_n_0 ;
  wire \state_reg[0]_0 ;
  wire \state_reg_n_0_[2] ;

  LUT4 #(
    .INIT(16'h0080)) 
    \acc_data[191]_i_1 
       (.I0(\r0_reg_sel_reg_n_0_[0] ),
        .I1(\state_reg[0]_0 ),
        .I2(\state_reg_n_0_[2] ),
        .I3(d2_valid),
        .O(p_0_in));
  LUT2 #(
    .INIT(4'h2)) 
    \acc_data[383]_i_1 
       (.I0(\state_reg[0]_0 ),
        .I1(d2_valid),
        .O(\acc_data[383]_i_1_n_0 ));
  FDRE \acc_data_reg[0] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[0]),
        .Q(D[0]),
        .R(1'b0));
  FDRE \acc_data_reg[100] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[100]),
        .Q(D[100]),
        .R(1'b0));
  FDRE \acc_data_reg[101] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[101]),
        .Q(D[101]),
        .R(1'b0));
  FDRE \acc_data_reg[102] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[102]),
        .Q(D[102]),
        .R(1'b0));
  FDRE \acc_data_reg[103] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[103]),
        .Q(D[103]),
        .R(1'b0));
  FDRE \acc_data_reg[104] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[104]),
        .Q(D[104]),
        .R(1'b0));
  FDRE \acc_data_reg[105] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[105]),
        .Q(D[105]),
        .R(1'b0));
  FDRE \acc_data_reg[106] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[106]),
        .Q(D[106]),
        .R(1'b0));
  FDRE \acc_data_reg[107] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[107]),
        .Q(D[107]),
        .R(1'b0));
  FDRE \acc_data_reg[108] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[108]),
        .Q(D[108]),
        .R(1'b0));
  FDRE \acc_data_reg[109] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[109]),
        .Q(D[109]),
        .R(1'b0));
  FDRE \acc_data_reg[10] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[10]),
        .Q(D[10]),
        .R(1'b0));
  FDRE \acc_data_reg[110] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[110]),
        .Q(D[110]),
        .R(1'b0));
  FDRE \acc_data_reg[111] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[111]),
        .Q(D[111]),
        .R(1'b0));
  FDRE \acc_data_reg[112] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[112]),
        .Q(D[112]),
        .R(1'b0));
  FDRE \acc_data_reg[113] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[113]),
        .Q(D[113]),
        .R(1'b0));
  FDRE \acc_data_reg[114] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[114]),
        .Q(D[114]),
        .R(1'b0));
  FDRE \acc_data_reg[115] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[115]),
        .Q(D[115]),
        .R(1'b0));
  FDRE \acc_data_reg[116] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[116]),
        .Q(D[116]),
        .R(1'b0));
  FDRE \acc_data_reg[117] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[117]),
        .Q(D[117]),
        .R(1'b0));
  FDRE \acc_data_reg[118] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[118]),
        .Q(D[118]),
        .R(1'b0));
  FDRE \acc_data_reg[119] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[119]),
        .Q(D[119]),
        .R(1'b0));
  FDRE \acc_data_reg[11] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[11]),
        .Q(D[11]),
        .R(1'b0));
  FDRE \acc_data_reg[120] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[120]),
        .Q(D[120]),
        .R(1'b0));
  FDRE \acc_data_reg[121] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[121]),
        .Q(D[121]),
        .R(1'b0));
  FDRE \acc_data_reg[122] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[122]),
        .Q(D[122]),
        .R(1'b0));
  FDRE \acc_data_reg[123] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[123]),
        .Q(D[123]),
        .R(1'b0));
  FDRE \acc_data_reg[124] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[124]),
        .Q(D[124]),
        .R(1'b0));
  FDRE \acc_data_reg[125] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[125]),
        .Q(D[125]),
        .R(1'b0));
  FDRE \acc_data_reg[126] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[126]),
        .Q(D[126]),
        .R(1'b0));
  FDRE \acc_data_reg[127] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[127]),
        .Q(D[127]),
        .R(1'b0));
  FDRE \acc_data_reg[128] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[128]),
        .Q(D[128]),
        .R(1'b0));
  FDRE \acc_data_reg[129] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[129]),
        .Q(D[129]),
        .R(1'b0));
  FDRE \acc_data_reg[12] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[12]),
        .Q(D[12]),
        .R(1'b0));
  FDRE \acc_data_reg[130] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[130]),
        .Q(D[130]),
        .R(1'b0));
  FDRE \acc_data_reg[131] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[131]),
        .Q(D[131]),
        .R(1'b0));
  FDRE \acc_data_reg[132] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[132]),
        .Q(D[132]),
        .R(1'b0));
  FDRE \acc_data_reg[133] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[133]),
        .Q(D[133]),
        .R(1'b0));
  FDRE \acc_data_reg[134] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[134]),
        .Q(D[134]),
        .R(1'b0));
  FDRE \acc_data_reg[135] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[135]),
        .Q(D[135]),
        .R(1'b0));
  FDRE \acc_data_reg[136] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[136]),
        .Q(D[136]),
        .R(1'b0));
  FDRE \acc_data_reg[137] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[137]),
        .Q(D[137]),
        .R(1'b0));
  FDRE \acc_data_reg[138] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[138]),
        .Q(D[138]),
        .R(1'b0));
  FDRE \acc_data_reg[139] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[139]),
        .Q(D[139]),
        .R(1'b0));
  FDRE \acc_data_reg[13] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[13]),
        .Q(D[13]),
        .R(1'b0));
  FDRE \acc_data_reg[140] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[140]),
        .Q(D[140]),
        .R(1'b0));
  FDRE \acc_data_reg[141] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[141]),
        .Q(D[141]),
        .R(1'b0));
  FDRE \acc_data_reg[142] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[142]),
        .Q(D[142]),
        .R(1'b0));
  FDRE \acc_data_reg[143] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[143]),
        .Q(D[143]),
        .R(1'b0));
  FDRE \acc_data_reg[144] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[144]),
        .Q(D[144]),
        .R(1'b0));
  FDRE \acc_data_reg[145] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[145]),
        .Q(D[145]),
        .R(1'b0));
  FDRE \acc_data_reg[146] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[146]),
        .Q(D[146]),
        .R(1'b0));
  FDRE \acc_data_reg[147] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[147]),
        .Q(D[147]),
        .R(1'b0));
  FDRE \acc_data_reg[148] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[148]),
        .Q(D[148]),
        .R(1'b0));
  FDRE \acc_data_reg[149] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[149]),
        .Q(D[149]),
        .R(1'b0));
  FDRE \acc_data_reg[14] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[14]),
        .Q(D[14]),
        .R(1'b0));
  FDRE \acc_data_reg[150] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[150]),
        .Q(D[150]),
        .R(1'b0));
  FDRE \acc_data_reg[151] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[151]),
        .Q(D[151]),
        .R(1'b0));
  FDRE \acc_data_reg[152] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[152]),
        .Q(D[152]),
        .R(1'b0));
  FDRE \acc_data_reg[153] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[153]),
        .Q(D[153]),
        .R(1'b0));
  FDRE \acc_data_reg[154] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[154]),
        .Q(D[154]),
        .R(1'b0));
  FDRE \acc_data_reg[155] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[155]),
        .Q(D[155]),
        .R(1'b0));
  FDRE \acc_data_reg[156] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[156]),
        .Q(D[156]),
        .R(1'b0));
  FDRE \acc_data_reg[157] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[157]),
        .Q(D[157]),
        .R(1'b0));
  FDRE \acc_data_reg[158] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[158]),
        .Q(D[158]),
        .R(1'b0));
  FDRE \acc_data_reg[159] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[159]),
        .Q(D[159]),
        .R(1'b0));
  FDRE \acc_data_reg[15] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[15]),
        .Q(D[15]),
        .R(1'b0));
  FDRE \acc_data_reg[160] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[160]),
        .Q(D[160]),
        .R(1'b0));
  FDRE \acc_data_reg[161] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[161]),
        .Q(D[161]),
        .R(1'b0));
  FDRE \acc_data_reg[162] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[162]),
        .Q(D[162]),
        .R(1'b0));
  FDRE \acc_data_reg[163] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[163]),
        .Q(D[163]),
        .R(1'b0));
  FDRE \acc_data_reg[164] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[164]),
        .Q(D[164]),
        .R(1'b0));
  FDRE \acc_data_reg[165] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[165]),
        .Q(D[165]),
        .R(1'b0));
  FDRE \acc_data_reg[166] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[166]),
        .Q(D[166]),
        .R(1'b0));
  FDRE \acc_data_reg[167] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[167]),
        .Q(D[167]),
        .R(1'b0));
  FDRE \acc_data_reg[168] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[168]),
        .Q(D[168]),
        .R(1'b0));
  FDRE \acc_data_reg[169] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[169]),
        .Q(D[169]),
        .R(1'b0));
  FDRE \acc_data_reg[16] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[16]),
        .Q(D[16]),
        .R(1'b0));
  FDRE \acc_data_reg[170] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[170]),
        .Q(D[170]),
        .R(1'b0));
  FDRE \acc_data_reg[171] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[171]),
        .Q(D[171]),
        .R(1'b0));
  FDRE \acc_data_reg[172] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[172]),
        .Q(D[172]),
        .R(1'b0));
  FDRE \acc_data_reg[173] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[173]),
        .Q(D[173]),
        .R(1'b0));
  FDRE \acc_data_reg[174] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[174]),
        .Q(D[174]),
        .R(1'b0));
  FDRE \acc_data_reg[175] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[175]),
        .Q(D[175]),
        .R(1'b0));
  FDRE \acc_data_reg[176] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[176]),
        .Q(D[176]),
        .R(1'b0));
  FDRE \acc_data_reg[177] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[177]),
        .Q(D[177]),
        .R(1'b0));
  FDRE \acc_data_reg[178] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[178]),
        .Q(D[178]),
        .R(1'b0));
  FDRE \acc_data_reg[179] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[179]),
        .Q(D[179]),
        .R(1'b0));
  FDRE \acc_data_reg[17] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[17]),
        .Q(D[17]),
        .R(1'b0));
  FDRE \acc_data_reg[180] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[180]),
        .Q(D[180]),
        .R(1'b0));
  FDRE \acc_data_reg[181] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[181]),
        .Q(D[181]),
        .R(1'b0));
  FDRE \acc_data_reg[182] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[182]),
        .Q(D[182]),
        .R(1'b0));
  FDRE \acc_data_reg[183] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[183]),
        .Q(D[183]),
        .R(1'b0));
  FDRE \acc_data_reg[184] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[184]),
        .Q(D[184]),
        .R(1'b0));
  FDRE \acc_data_reg[185] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[185]),
        .Q(D[185]),
        .R(1'b0));
  FDRE \acc_data_reg[186] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[186]),
        .Q(D[186]),
        .R(1'b0));
  FDRE \acc_data_reg[187] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[187]),
        .Q(D[187]),
        .R(1'b0));
  FDRE \acc_data_reg[188] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[188]),
        .Q(D[188]),
        .R(1'b0));
  FDRE \acc_data_reg[189] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[189]),
        .Q(D[189]),
        .R(1'b0));
  FDRE \acc_data_reg[18] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[18]),
        .Q(D[18]),
        .R(1'b0));
  FDRE \acc_data_reg[190] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[190]),
        .Q(D[190]),
        .R(1'b0));
  FDRE \acc_data_reg[191] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[191]),
        .Q(D[191]),
        .R(1'b0));
  FDRE \acc_data_reg[192] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[0]),
        .Q(D[192]),
        .R(1'b0));
  FDRE \acc_data_reg[193] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[1]),
        .Q(D[193]),
        .R(1'b0));
  FDRE \acc_data_reg[194] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[2]),
        .Q(D[194]),
        .R(1'b0));
  FDRE \acc_data_reg[195] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[3]),
        .Q(D[195]),
        .R(1'b0));
  FDRE \acc_data_reg[196] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[4]),
        .Q(D[196]),
        .R(1'b0));
  FDRE \acc_data_reg[197] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[5]),
        .Q(D[197]),
        .R(1'b0));
  FDRE \acc_data_reg[198] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[6]),
        .Q(D[198]),
        .R(1'b0));
  FDRE \acc_data_reg[199] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[7]),
        .Q(D[199]),
        .R(1'b0));
  FDRE \acc_data_reg[19] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[19]),
        .Q(D[19]),
        .R(1'b0));
  FDRE \acc_data_reg[1] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[1]),
        .Q(D[1]),
        .R(1'b0));
  FDRE \acc_data_reg[200] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[8]),
        .Q(D[200]),
        .R(1'b0));
  FDRE \acc_data_reg[201] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[9]),
        .Q(D[201]),
        .R(1'b0));
  FDRE \acc_data_reg[202] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[10]),
        .Q(D[202]),
        .R(1'b0));
  FDRE \acc_data_reg[203] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[11]),
        .Q(D[203]),
        .R(1'b0));
  FDRE \acc_data_reg[204] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[12]),
        .Q(D[204]),
        .R(1'b0));
  FDRE \acc_data_reg[205] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[13]),
        .Q(D[205]),
        .R(1'b0));
  FDRE \acc_data_reg[206] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[14]),
        .Q(D[206]),
        .R(1'b0));
  FDRE \acc_data_reg[207] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[15]),
        .Q(D[207]),
        .R(1'b0));
  FDRE \acc_data_reg[208] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[16]),
        .Q(D[208]),
        .R(1'b0));
  FDRE \acc_data_reg[209] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[17]),
        .Q(D[209]),
        .R(1'b0));
  FDRE \acc_data_reg[20] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[20]),
        .Q(D[20]),
        .R(1'b0));
  FDRE \acc_data_reg[210] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[18]),
        .Q(D[210]),
        .R(1'b0));
  FDRE \acc_data_reg[211] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[19]),
        .Q(D[211]),
        .R(1'b0));
  FDRE \acc_data_reg[212] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[20]),
        .Q(D[212]),
        .R(1'b0));
  FDRE \acc_data_reg[213] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[21]),
        .Q(D[213]),
        .R(1'b0));
  FDRE \acc_data_reg[214] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[22]),
        .Q(D[214]),
        .R(1'b0));
  FDRE \acc_data_reg[215] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[23]),
        .Q(D[215]),
        .R(1'b0));
  FDRE \acc_data_reg[216] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[24]),
        .Q(D[216]),
        .R(1'b0));
  FDRE \acc_data_reg[217] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[25]),
        .Q(D[217]),
        .R(1'b0));
  FDRE \acc_data_reg[218] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[26]),
        .Q(D[218]),
        .R(1'b0));
  FDRE \acc_data_reg[219] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[27]),
        .Q(D[219]),
        .R(1'b0));
  FDRE \acc_data_reg[21] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[21]),
        .Q(D[21]),
        .R(1'b0));
  FDRE \acc_data_reg[220] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[28]),
        .Q(D[220]),
        .R(1'b0));
  FDRE \acc_data_reg[221] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[29]),
        .Q(D[221]),
        .R(1'b0));
  FDRE \acc_data_reg[222] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[30]),
        .Q(D[222]),
        .R(1'b0));
  FDRE \acc_data_reg[223] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[31]),
        .Q(D[223]),
        .R(1'b0));
  FDRE \acc_data_reg[224] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[32]),
        .Q(D[224]),
        .R(1'b0));
  FDRE \acc_data_reg[225] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[33]),
        .Q(D[225]),
        .R(1'b0));
  FDRE \acc_data_reg[226] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[34]),
        .Q(D[226]),
        .R(1'b0));
  FDRE \acc_data_reg[227] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[35]),
        .Q(D[227]),
        .R(1'b0));
  FDRE \acc_data_reg[228] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[36]),
        .Q(D[228]),
        .R(1'b0));
  FDRE \acc_data_reg[229] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[37]),
        .Q(D[229]),
        .R(1'b0));
  FDRE \acc_data_reg[22] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[22]),
        .Q(D[22]),
        .R(1'b0));
  FDRE \acc_data_reg[230] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[38]),
        .Q(D[230]),
        .R(1'b0));
  FDRE \acc_data_reg[231] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[39]),
        .Q(D[231]),
        .R(1'b0));
  FDRE \acc_data_reg[232] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[40]),
        .Q(D[232]),
        .R(1'b0));
  FDRE \acc_data_reg[233] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[41]),
        .Q(D[233]),
        .R(1'b0));
  FDRE \acc_data_reg[234] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[42]),
        .Q(D[234]),
        .R(1'b0));
  FDRE \acc_data_reg[235] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[43]),
        .Q(D[235]),
        .R(1'b0));
  FDRE \acc_data_reg[236] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[44]),
        .Q(D[236]),
        .R(1'b0));
  FDRE \acc_data_reg[237] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[45]),
        .Q(D[237]),
        .R(1'b0));
  FDRE \acc_data_reg[238] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[46]),
        .Q(D[238]),
        .R(1'b0));
  FDRE \acc_data_reg[239] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[47]),
        .Q(D[239]),
        .R(1'b0));
  FDRE \acc_data_reg[23] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[23]),
        .Q(D[23]),
        .R(1'b0));
  FDRE \acc_data_reg[240] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[48]),
        .Q(D[240]),
        .R(1'b0));
  FDRE \acc_data_reg[241] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[49]),
        .Q(D[241]),
        .R(1'b0));
  FDRE \acc_data_reg[242] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[50]),
        .Q(D[242]),
        .R(1'b0));
  FDRE \acc_data_reg[243] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[51]),
        .Q(D[243]),
        .R(1'b0));
  FDRE \acc_data_reg[244] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[52]),
        .Q(D[244]),
        .R(1'b0));
  FDRE \acc_data_reg[245] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[53]),
        .Q(D[245]),
        .R(1'b0));
  FDRE \acc_data_reg[246] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[54]),
        .Q(D[246]),
        .R(1'b0));
  FDRE \acc_data_reg[247] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[55]),
        .Q(D[247]),
        .R(1'b0));
  FDRE \acc_data_reg[248] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[56]),
        .Q(D[248]),
        .R(1'b0));
  FDRE \acc_data_reg[249] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[57]),
        .Q(D[249]),
        .R(1'b0));
  FDRE \acc_data_reg[24] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[24]),
        .Q(D[24]),
        .R(1'b0));
  FDRE \acc_data_reg[250] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[58]),
        .Q(D[250]),
        .R(1'b0));
  FDRE \acc_data_reg[251] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[59]),
        .Q(D[251]),
        .R(1'b0));
  FDRE \acc_data_reg[252] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[60]),
        .Q(D[252]),
        .R(1'b0));
  FDRE \acc_data_reg[253] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[61]),
        .Q(D[253]),
        .R(1'b0));
  FDRE \acc_data_reg[254] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[62]),
        .Q(D[254]),
        .R(1'b0));
  FDRE \acc_data_reg[255] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[63]),
        .Q(D[255]),
        .R(1'b0));
  FDRE \acc_data_reg[256] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[64]),
        .Q(D[256]),
        .R(1'b0));
  FDRE \acc_data_reg[257] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[65]),
        .Q(D[257]),
        .R(1'b0));
  FDRE \acc_data_reg[258] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[66]),
        .Q(D[258]),
        .R(1'b0));
  FDRE \acc_data_reg[259] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[67]),
        .Q(D[259]),
        .R(1'b0));
  FDRE \acc_data_reg[25] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[25]),
        .Q(D[25]),
        .R(1'b0));
  FDRE \acc_data_reg[260] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[68]),
        .Q(D[260]),
        .R(1'b0));
  FDRE \acc_data_reg[261] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[69]),
        .Q(D[261]),
        .R(1'b0));
  FDRE \acc_data_reg[262] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[70]),
        .Q(D[262]),
        .R(1'b0));
  FDRE \acc_data_reg[263] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[71]),
        .Q(D[263]),
        .R(1'b0));
  FDRE \acc_data_reg[264] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[72]),
        .Q(D[264]),
        .R(1'b0));
  FDRE \acc_data_reg[265] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[73]),
        .Q(D[265]),
        .R(1'b0));
  FDRE \acc_data_reg[266] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[74]),
        .Q(D[266]),
        .R(1'b0));
  FDRE \acc_data_reg[267] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[75]),
        .Q(D[267]),
        .R(1'b0));
  FDRE \acc_data_reg[268] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[76]),
        .Q(D[268]),
        .R(1'b0));
  FDRE \acc_data_reg[269] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[77]),
        .Q(D[269]),
        .R(1'b0));
  FDRE \acc_data_reg[26] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[26]),
        .Q(D[26]),
        .R(1'b0));
  FDRE \acc_data_reg[270] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[78]),
        .Q(D[270]),
        .R(1'b0));
  FDRE \acc_data_reg[271] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[79]),
        .Q(D[271]),
        .R(1'b0));
  FDRE \acc_data_reg[272] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[80]),
        .Q(D[272]),
        .R(1'b0));
  FDRE \acc_data_reg[273] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[81]),
        .Q(D[273]),
        .R(1'b0));
  FDRE \acc_data_reg[274] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[82]),
        .Q(D[274]),
        .R(1'b0));
  FDRE \acc_data_reg[275] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[83]),
        .Q(D[275]),
        .R(1'b0));
  FDRE \acc_data_reg[276] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[84]),
        .Q(D[276]),
        .R(1'b0));
  FDRE \acc_data_reg[277] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[85]),
        .Q(D[277]),
        .R(1'b0));
  FDRE \acc_data_reg[278] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[86]),
        .Q(D[278]),
        .R(1'b0));
  FDRE \acc_data_reg[279] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[87]),
        .Q(D[279]),
        .R(1'b0));
  FDRE \acc_data_reg[27] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[27]),
        .Q(D[27]),
        .R(1'b0));
  FDRE \acc_data_reg[280] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[88]),
        .Q(D[280]),
        .R(1'b0));
  FDRE \acc_data_reg[281] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[89]),
        .Q(D[281]),
        .R(1'b0));
  FDRE \acc_data_reg[282] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[90]),
        .Q(D[282]),
        .R(1'b0));
  FDRE \acc_data_reg[283] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[91]),
        .Q(D[283]),
        .R(1'b0));
  FDRE \acc_data_reg[284] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[92]),
        .Q(D[284]),
        .R(1'b0));
  FDRE \acc_data_reg[285] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[93]),
        .Q(D[285]),
        .R(1'b0));
  FDRE \acc_data_reg[286] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[94]),
        .Q(D[286]),
        .R(1'b0));
  FDRE \acc_data_reg[287] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[95]),
        .Q(D[287]),
        .R(1'b0));
  FDRE \acc_data_reg[288] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[96]),
        .Q(D[288]),
        .R(1'b0));
  FDRE \acc_data_reg[289] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[97]),
        .Q(D[289]),
        .R(1'b0));
  FDRE \acc_data_reg[28] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[28]),
        .Q(D[28]),
        .R(1'b0));
  FDRE \acc_data_reg[290] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[98]),
        .Q(D[290]),
        .R(1'b0));
  FDRE \acc_data_reg[291] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[99]),
        .Q(D[291]),
        .R(1'b0));
  FDRE \acc_data_reg[292] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[100]),
        .Q(D[292]),
        .R(1'b0));
  FDRE \acc_data_reg[293] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[101]),
        .Q(D[293]),
        .R(1'b0));
  FDRE \acc_data_reg[294] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[102]),
        .Q(D[294]),
        .R(1'b0));
  FDRE \acc_data_reg[295] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[103]),
        .Q(D[295]),
        .R(1'b0));
  FDRE \acc_data_reg[296] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[104]),
        .Q(D[296]),
        .R(1'b0));
  FDRE \acc_data_reg[297] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[105]),
        .Q(D[297]),
        .R(1'b0));
  FDRE \acc_data_reg[298] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[106]),
        .Q(D[298]),
        .R(1'b0));
  FDRE \acc_data_reg[299] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[107]),
        .Q(D[299]),
        .R(1'b0));
  FDRE \acc_data_reg[29] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[29]),
        .Q(D[29]),
        .R(1'b0));
  FDRE \acc_data_reg[2] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[2]),
        .Q(D[2]),
        .R(1'b0));
  FDRE \acc_data_reg[300] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[108]),
        .Q(D[300]),
        .R(1'b0));
  FDRE \acc_data_reg[301] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[109]),
        .Q(D[301]),
        .R(1'b0));
  FDRE \acc_data_reg[302] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[110]),
        .Q(D[302]),
        .R(1'b0));
  FDRE \acc_data_reg[303] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[111]),
        .Q(D[303]),
        .R(1'b0));
  FDRE \acc_data_reg[304] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[112]),
        .Q(D[304]),
        .R(1'b0));
  FDRE \acc_data_reg[305] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[113]),
        .Q(D[305]),
        .R(1'b0));
  FDRE \acc_data_reg[306] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[114]),
        .Q(D[306]),
        .R(1'b0));
  FDRE \acc_data_reg[307] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[115]),
        .Q(D[307]),
        .R(1'b0));
  FDRE \acc_data_reg[308] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[116]),
        .Q(D[308]),
        .R(1'b0));
  FDRE \acc_data_reg[309] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[117]),
        .Q(D[309]),
        .R(1'b0));
  FDRE \acc_data_reg[30] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[30]),
        .Q(D[30]),
        .R(1'b0));
  FDRE \acc_data_reg[310] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[118]),
        .Q(D[310]),
        .R(1'b0));
  FDRE \acc_data_reg[311] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[119]),
        .Q(D[311]),
        .R(1'b0));
  FDRE \acc_data_reg[312] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[120]),
        .Q(D[312]),
        .R(1'b0));
  FDRE \acc_data_reg[313] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[121]),
        .Q(D[313]),
        .R(1'b0));
  FDRE \acc_data_reg[314] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[122]),
        .Q(D[314]),
        .R(1'b0));
  FDRE \acc_data_reg[315] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[123]),
        .Q(D[315]),
        .R(1'b0));
  FDRE \acc_data_reg[316] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[124]),
        .Q(D[316]),
        .R(1'b0));
  FDRE \acc_data_reg[317] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[125]),
        .Q(D[317]),
        .R(1'b0));
  FDRE \acc_data_reg[318] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[126]),
        .Q(D[318]),
        .R(1'b0));
  FDRE \acc_data_reg[319] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[127]),
        .Q(D[319]),
        .R(1'b0));
  FDRE \acc_data_reg[31] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[31]),
        .Q(D[31]),
        .R(1'b0));
  FDRE \acc_data_reg[320] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[128]),
        .Q(D[320]),
        .R(1'b0));
  FDRE \acc_data_reg[321] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[129]),
        .Q(D[321]),
        .R(1'b0));
  FDRE \acc_data_reg[322] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[130]),
        .Q(D[322]),
        .R(1'b0));
  FDRE \acc_data_reg[323] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[131]),
        .Q(D[323]),
        .R(1'b0));
  FDRE \acc_data_reg[324] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[132]),
        .Q(D[324]),
        .R(1'b0));
  FDRE \acc_data_reg[325] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[133]),
        .Q(D[325]),
        .R(1'b0));
  FDRE \acc_data_reg[326] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[134]),
        .Q(D[326]),
        .R(1'b0));
  FDRE \acc_data_reg[327] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[135]),
        .Q(D[327]),
        .R(1'b0));
  FDRE \acc_data_reg[328] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[136]),
        .Q(D[328]),
        .R(1'b0));
  FDRE \acc_data_reg[329] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[137]),
        .Q(D[329]),
        .R(1'b0));
  FDRE \acc_data_reg[32] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[32]),
        .Q(D[32]),
        .R(1'b0));
  FDRE \acc_data_reg[330] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[138]),
        .Q(D[330]),
        .R(1'b0));
  FDRE \acc_data_reg[331] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[139]),
        .Q(D[331]),
        .R(1'b0));
  FDRE \acc_data_reg[332] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[140]),
        .Q(D[332]),
        .R(1'b0));
  FDRE \acc_data_reg[333] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[141]),
        .Q(D[333]),
        .R(1'b0));
  FDRE \acc_data_reg[334] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[142]),
        .Q(D[334]),
        .R(1'b0));
  FDRE \acc_data_reg[335] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[143]),
        .Q(D[335]),
        .R(1'b0));
  FDRE \acc_data_reg[336] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[144]),
        .Q(D[336]),
        .R(1'b0));
  FDRE \acc_data_reg[337] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[145]),
        .Q(D[337]),
        .R(1'b0));
  FDRE \acc_data_reg[338] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[146]),
        .Q(D[338]),
        .R(1'b0));
  FDRE \acc_data_reg[339] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[147]),
        .Q(D[339]),
        .R(1'b0));
  FDRE \acc_data_reg[33] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[33]),
        .Q(D[33]),
        .R(1'b0));
  FDRE \acc_data_reg[340] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[148]),
        .Q(D[340]),
        .R(1'b0));
  FDRE \acc_data_reg[341] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[149]),
        .Q(D[341]),
        .R(1'b0));
  FDRE \acc_data_reg[342] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[150]),
        .Q(D[342]),
        .R(1'b0));
  FDRE \acc_data_reg[343] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[151]),
        .Q(D[343]),
        .R(1'b0));
  FDRE \acc_data_reg[344] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[152]),
        .Q(D[344]),
        .R(1'b0));
  FDRE \acc_data_reg[345] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[153]),
        .Q(D[345]),
        .R(1'b0));
  FDRE \acc_data_reg[346] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[154]),
        .Q(D[346]),
        .R(1'b0));
  FDRE \acc_data_reg[347] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[155]),
        .Q(D[347]),
        .R(1'b0));
  FDRE \acc_data_reg[348] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[156]),
        .Q(D[348]),
        .R(1'b0));
  FDRE \acc_data_reg[349] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[157]),
        .Q(D[349]),
        .R(1'b0));
  FDRE \acc_data_reg[34] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[34]),
        .Q(D[34]),
        .R(1'b0));
  FDRE \acc_data_reg[350] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[158]),
        .Q(D[350]),
        .R(1'b0));
  FDRE \acc_data_reg[351] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[159]),
        .Q(D[351]),
        .R(1'b0));
  FDRE \acc_data_reg[352] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[160]),
        .Q(D[352]),
        .R(1'b0));
  FDRE \acc_data_reg[353] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[161]),
        .Q(D[353]),
        .R(1'b0));
  FDRE \acc_data_reg[354] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[162]),
        .Q(D[354]),
        .R(1'b0));
  FDRE \acc_data_reg[355] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[163]),
        .Q(D[355]),
        .R(1'b0));
  FDRE \acc_data_reg[356] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[164]),
        .Q(D[356]),
        .R(1'b0));
  FDRE \acc_data_reg[357] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[165]),
        .Q(D[357]),
        .R(1'b0));
  FDRE \acc_data_reg[358] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[166]),
        .Q(D[358]),
        .R(1'b0));
  FDRE \acc_data_reg[359] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[167]),
        .Q(D[359]),
        .R(1'b0));
  FDRE \acc_data_reg[35] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[35]),
        .Q(D[35]),
        .R(1'b0));
  FDRE \acc_data_reg[360] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[168]),
        .Q(D[360]),
        .R(1'b0));
  FDRE \acc_data_reg[361] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[169]),
        .Q(D[361]),
        .R(1'b0));
  FDRE \acc_data_reg[362] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[170]),
        .Q(D[362]),
        .R(1'b0));
  FDRE \acc_data_reg[363] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[171]),
        .Q(D[363]),
        .R(1'b0));
  FDRE \acc_data_reg[364] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[172]),
        .Q(D[364]),
        .R(1'b0));
  FDRE \acc_data_reg[365] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[173]),
        .Q(D[365]),
        .R(1'b0));
  FDRE \acc_data_reg[366] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[174]),
        .Q(D[366]),
        .R(1'b0));
  FDRE \acc_data_reg[367] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[175]),
        .Q(D[367]),
        .R(1'b0));
  FDRE \acc_data_reg[368] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[176]),
        .Q(D[368]),
        .R(1'b0));
  FDRE \acc_data_reg[369] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[177]),
        .Q(D[369]),
        .R(1'b0));
  FDRE \acc_data_reg[36] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[36]),
        .Q(D[36]),
        .R(1'b0));
  FDRE \acc_data_reg[370] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[178]),
        .Q(D[370]),
        .R(1'b0));
  FDRE \acc_data_reg[371] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[179]),
        .Q(D[371]),
        .R(1'b0));
  FDRE \acc_data_reg[372] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[180]),
        .Q(D[372]),
        .R(1'b0));
  FDRE \acc_data_reg[373] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[181]),
        .Q(D[373]),
        .R(1'b0));
  FDRE \acc_data_reg[374] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[182]),
        .Q(D[374]),
        .R(1'b0));
  FDRE \acc_data_reg[375] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[183]),
        .Q(D[375]),
        .R(1'b0));
  FDRE \acc_data_reg[376] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[184]),
        .Q(D[376]),
        .R(1'b0));
  FDRE \acc_data_reg[377] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[185]),
        .Q(D[377]),
        .R(1'b0));
  FDRE \acc_data_reg[378] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[186]),
        .Q(D[378]),
        .R(1'b0));
  FDRE \acc_data_reg[379] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[187]),
        .Q(D[379]),
        .R(1'b0));
  FDRE \acc_data_reg[37] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[37]),
        .Q(D[37]),
        .R(1'b0));
  FDRE \acc_data_reg[380] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[188]),
        .Q(D[380]),
        .R(1'b0));
  FDRE \acc_data_reg[381] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[189]),
        .Q(D[381]),
        .R(1'b0));
  FDRE \acc_data_reg[382] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[190]),
        .Q(D[382]),
        .R(1'b0));
  FDRE \acc_data_reg[383] 
       (.C(aclk),
        .CE(\acc_data[383]_i_1_n_0 ),
        .D(s_axis_tdata[191]),
        .Q(D[383]),
        .R(1'b0));
  FDRE \acc_data_reg[38] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[38]),
        .Q(D[38]),
        .R(1'b0));
  FDRE \acc_data_reg[39] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[39]),
        .Q(D[39]),
        .R(1'b0));
  FDRE \acc_data_reg[3] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[3]),
        .Q(D[3]),
        .R(1'b0));
  FDRE \acc_data_reg[40] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[40]),
        .Q(D[40]),
        .R(1'b0));
  FDRE \acc_data_reg[41] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[41]),
        .Q(D[41]),
        .R(1'b0));
  FDRE \acc_data_reg[42] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[42]),
        .Q(D[42]),
        .R(1'b0));
  FDRE \acc_data_reg[43] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[43]),
        .Q(D[43]),
        .R(1'b0));
  FDRE \acc_data_reg[44] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[44]),
        .Q(D[44]),
        .R(1'b0));
  FDRE \acc_data_reg[45] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[45]),
        .Q(D[45]),
        .R(1'b0));
  FDRE \acc_data_reg[46] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[46]),
        .Q(D[46]),
        .R(1'b0));
  FDRE \acc_data_reg[47] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[47]),
        .Q(D[47]),
        .R(1'b0));
  FDRE \acc_data_reg[48] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[48]),
        .Q(D[48]),
        .R(1'b0));
  FDRE \acc_data_reg[49] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[49]),
        .Q(D[49]),
        .R(1'b0));
  FDRE \acc_data_reg[4] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[4]),
        .Q(D[4]),
        .R(1'b0));
  FDRE \acc_data_reg[50] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[50]),
        .Q(D[50]),
        .R(1'b0));
  FDRE \acc_data_reg[51] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[51]),
        .Q(D[51]),
        .R(1'b0));
  FDRE \acc_data_reg[52] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[52]),
        .Q(D[52]),
        .R(1'b0));
  FDRE \acc_data_reg[53] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[53]),
        .Q(D[53]),
        .R(1'b0));
  FDRE \acc_data_reg[54] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[54]),
        .Q(D[54]),
        .R(1'b0));
  FDRE \acc_data_reg[55] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[55]),
        .Q(D[55]),
        .R(1'b0));
  FDRE \acc_data_reg[56] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[56]),
        .Q(D[56]),
        .R(1'b0));
  FDRE \acc_data_reg[57] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[57]),
        .Q(D[57]),
        .R(1'b0));
  FDRE \acc_data_reg[58] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[58]),
        .Q(D[58]),
        .R(1'b0));
  FDRE \acc_data_reg[59] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[59]),
        .Q(D[59]),
        .R(1'b0));
  FDRE \acc_data_reg[5] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[5]),
        .Q(D[5]),
        .R(1'b0));
  FDRE \acc_data_reg[60] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[60]),
        .Q(D[60]),
        .R(1'b0));
  FDRE \acc_data_reg[61] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[61]),
        .Q(D[61]),
        .R(1'b0));
  FDRE \acc_data_reg[62] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[62]),
        .Q(D[62]),
        .R(1'b0));
  FDRE \acc_data_reg[63] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[63]),
        .Q(D[63]),
        .R(1'b0));
  FDRE \acc_data_reg[64] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[64]),
        .Q(D[64]),
        .R(1'b0));
  FDRE \acc_data_reg[65] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[65]),
        .Q(D[65]),
        .R(1'b0));
  FDRE \acc_data_reg[66] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[66]),
        .Q(D[66]),
        .R(1'b0));
  FDRE \acc_data_reg[67] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[67]),
        .Q(D[67]),
        .R(1'b0));
  FDRE \acc_data_reg[68] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[68]),
        .Q(D[68]),
        .R(1'b0));
  FDRE \acc_data_reg[69] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[69]),
        .Q(D[69]),
        .R(1'b0));
  FDRE \acc_data_reg[6] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[6]),
        .Q(D[6]),
        .R(1'b0));
  FDRE \acc_data_reg[70] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[70]),
        .Q(D[70]),
        .R(1'b0));
  FDRE \acc_data_reg[71] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[71]),
        .Q(D[71]),
        .R(1'b0));
  FDRE \acc_data_reg[72] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[72]),
        .Q(D[72]),
        .R(1'b0));
  FDRE \acc_data_reg[73] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[73]),
        .Q(D[73]),
        .R(1'b0));
  FDRE \acc_data_reg[74] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[74]),
        .Q(D[74]),
        .R(1'b0));
  FDRE \acc_data_reg[75] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[75]),
        .Q(D[75]),
        .R(1'b0));
  FDRE \acc_data_reg[76] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[76]),
        .Q(D[76]),
        .R(1'b0));
  FDRE \acc_data_reg[77] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[77]),
        .Q(D[77]),
        .R(1'b0));
  FDRE \acc_data_reg[78] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[78]),
        .Q(D[78]),
        .R(1'b0));
  FDRE \acc_data_reg[79] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[79]),
        .Q(D[79]),
        .R(1'b0));
  FDRE \acc_data_reg[7] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[7]),
        .Q(D[7]),
        .R(1'b0));
  FDRE \acc_data_reg[80] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[80]),
        .Q(D[80]),
        .R(1'b0));
  FDRE \acc_data_reg[81] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[81]),
        .Q(D[81]),
        .R(1'b0));
  FDRE \acc_data_reg[82] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[82]),
        .Q(D[82]),
        .R(1'b0));
  FDRE \acc_data_reg[83] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[83]),
        .Q(D[83]),
        .R(1'b0));
  FDRE \acc_data_reg[84] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[84]),
        .Q(D[84]),
        .R(1'b0));
  FDRE \acc_data_reg[85] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[85]),
        .Q(D[85]),
        .R(1'b0));
  FDRE \acc_data_reg[86] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[86]),
        .Q(D[86]),
        .R(1'b0));
  FDRE \acc_data_reg[87] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[87]),
        .Q(D[87]),
        .R(1'b0));
  FDRE \acc_data_reg[88] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[88]),
        .Q(D[88]),
        .R(1'b0));
  FDRE \acc_data_reg[89] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[89]),
        .Q(D[89]),
        .R(1'b0));
  FDRE \acc_data_reg[8] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[8]),
        .Q(D[8]),
        .R(1'b0));
  FDRE \acc_data_reg[90] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[90]),
        .Q(D[90]),
        .R(1'b0));
  FDRE \acc_data_reg[91] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[91]),
        .Q(D[91]),
        .R(1'b0));
  FDRE \acc_data_reg[92] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[92]),
        .Q(D[92]),
        .R(1'b0));
  FDRE \acc_data_reg[93] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[93]),
        .Q(D[93]),
        .R(1'b0));
  FDRE \acc_data_reg[94] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[94]),
        .Q(D[94]),
        .R(1'b0));
  FDRE \acc_data_reg[95] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[95]),
        .Q(D[95]),
        .R(1'b0));
  FDRE \acc_data_reg[96] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[96]),
        .Q(D[96]),
        .R(1'b0));
  FDRE \acc_data_reg[97] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[97]),
        .Q(D[97]),
        .R(1'b0));
  FDRE \acc_data_reg[98] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[98]),
        .Q(D[98]),
        .R(1'b0));
  FDRE \acc_data_reg[99] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[99]),
        .Q(D[99]),
        .R(1'b0));
  FDRE \acc_data_reg[9] 
       (.C(aclk),
        .CE(p_0_in),
        .D(r0_data[9]),
        .Q(D[9]),
        .R(1'b0));
  FDRE \r0_data_reg[0] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[0]),
        .Q(r0_data[0]),
        .R(1'b0));
  FDRE \r0_data_reg[100] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[100]),
        .Q(r0_data[100]),
        .R(1'b0));
  FDRE \r0_data_reg[101] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[101]),
        .Q(r0_data[101]),
        .R(1'b0));
  FDRE \r0_data_reg[102] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[102]),
        .Q(r0_data[102]),
        .R(1'b0));
  FDRE \r0_data_reg[103] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[103]),
        .Q(r0_data[103]),
        .R(1'b0));
  FDRE \r0_data_reg[104] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[104]),
        .Q(r0_data[104]),
        .R(1'b0));
  FDRE \r0_data_reg[105] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[105]),
        .Q(r0_data[105]),
        .R(1'b0));
  FDRE \r0_data_reg[106] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[106]),
        .Q(r0_data[106]),
        .R(1'b0));
  FDRE \r0_data_reg[107] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[107]),
        .Q(r0_data[107]),
        .R(1'b0));
  FDRE \r0_data_reg[108] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[108]),
        .Q(r0_data[108]),
        .R(1'b0));
  FDRE \r0_data_reg[109] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[109]),
        .Q(r0_data[109]),
        .R(1'b0));
  FDRE \r0_data_reg[10] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[10]),
        .Q(r0_data[10]),
        .R(1'b0));
  FDRE \r0_data_reg[110] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[110]),
        .Q(r0_data[110]),
        .R(1'b0));
  FDRE \r0_data_reg[111] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[111]),
        .Q(r0_data[111]),
        .R(1'b0));
  FDRE \r0_data_reg[112] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[112]),
        .Q(r0_data[112]),
        .R(1'b0));
  FDRE \r0_data_reg[113] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[113]),
        .Q(r0_data[113]),
        .R(1'b0));
  FDRE \r0_data_reg[114] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[114]),
        .Q(r0_data[114]),
        .R(1'b0));
  FDRE \r0_data_reg[115] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[115]),
        .Q(r0_data[115]),
        .R(1'b0));
  FDRE \r0_data_reg[116] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[116]),
        .Q(r0_data[116]),
        .R(1'b0));
  FDRE \r0_data_reg[117] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[117]),
        .Q(r0_data[117]),
        .R(1'b0));
  FDRE \r0_data_reg[118] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[118]),
        .Q(r0_data[118]),
        .R(1'b0));
  FDRE \r0_data_reg[119] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[119]),
        .Q(r0_data[119]),
        .R(1'b0));
  FDRE \r0_data_reg[11] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[11]),
        .Q(r0_data[11]),
        .R(1'b0));
  FDRE \r0_data_reg[120] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[120]),
        .Q(r0_data[120]),
        .R(1'b0));
  FDRE \r0_data_reg[121] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[121]),
        .Q(r0_data[121]),
        .R(1'b0));
  FDRE \r0_data_reg[122] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[122]),
        .Q(r0_data[122]),
        .R(1'b0));
  FDRE \r0_data_reg[123] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[123]),
        .Q(r0_data[123]),
        .R(1'b0));
  FDRE \r0_data_reg[124] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[124]),
        .Q(r0_data[124]),
        .R(1'b0));
  FDRE \r0_data_reg[125] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[125]),
        .Q(r0_data[125]),
        .R(1'b0));
  FDRE \r0_data_reg[126] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[126]),
        .Q(r0_data[126]),
        .R(1'b0));
  FDRE \r0_data_reg[127] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[127]),
        .Q(r0_data[127]),
        .R(1'b0));
  FDRE \r0_data_reg[128] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[128]),
        .Q(r0_data[128]),
        .R(1'b0));
  FDRE \r0_data_reg[129] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[129]),
        .Q(r0_data[129]),
        .R(1'b0));
  FDRE \r0_data_reg[12] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[12]),
        .Q(r0_data[12]),
        .R(1'b0));
  FDRE \r0_data_reg[130] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[130]),
        .Q(r0_data[130]),
        .R(1'b0));
  FDRE \r0_data_reg[131] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[131]),
        .Q(r0_data[131]),
        .R(1'b0));
  FDRE \r0_data_reg[132] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[132]),
        .Q(r0_data[132]),
        .R(1'b0));
  FDRE \r0_data_reg[133] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[133]),
        .Q(r0_data[133]),
        .R(1'b0));
  FDRE \r0_data_reg[134] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[134]),
        .Q(r0_data[134]),
        .R(1'b0));
  FDRE \r0_data_reg[135] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[135]),
        .Q(r0_data[135]),
        .R(1'b0));
  FDRE \r0_data_reg[136] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[136]),
        .Q(r0_data[136]),
        .R(1'b0));
  FDRE \r0_data_reg[137] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[137]),
        .Q(r0_data[137]),
        .R(1'b0));
  FDRE \r0_data_reg[138] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[138]),
        .Q(r0_data[138]),
        .R(1'b0));
  FDRE \r0_data_reg[139] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[139]),
        .Q(r0_data[139]),
        .R(1'b0));
  FDRE \r0_data_reg[13] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[13]),
        .Q(r0_data[13]),
        .R(1'b0));
  FDRE \r0_data_reg[140] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[140]),
        .Q(r0_data[140]),
        .R(1'b0));
  FDRE \r0_data_reg[141] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[141]),
        .Q(r0_data[141]),
        .R(1'b0));
  FDRE \r0_data_reg[142] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[142]),
        .Q(r0_data[142]),
        .R(1'b0));
  FDRE \r0_data_reg[143] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[143]),
        .Q(r0_data[143]),
        .R(1'b0));
  FDRE \r0_data_reg[144] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[144]),
        .Q(r0_data[144]),
        .R(1'b0));
  FDRE \r0_data_reg[145] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[145]),
        .Q(r0_data[145]),
        .R(1'b0));
  FDRE \r0_data_reg[146] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[146]),
        .Q(r0_data[146]),
        .R(1'b0));
  FDRE \r0_data_reg[147] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[147]),
        .Q(r0_data[147]),
        .R(1'b0));
  FDRE \r0_data_reg[148] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[148]),
        .Q(r0_data[148]),
        .R(1'b0));
  FDRE \r0_data_reg[149] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[149]),
        .Q(r0_data[149]),
        .R(1'b0));
  FDRE \r0_data_reg[14] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[14]),
        .Q(r0_data[14]),
        .R(1'b0));
  FDRE \r0_data_reg[150] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[150]),
        .Q(r0_data[150]),
        .R(1'b0));
  FDRE \r0_data_reg[151] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[151]),
        .Q(r0_data[151]),
        .R(1'b0));
  FDRE \r0_data_reg[152] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[152]),
        .Q(r0_data[152]),
        .R(1'b0));
  FDRE \r0_data_reg[153] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[153]),
        .Q(r0_data[153]),
        .R(1'b0));
  FDRE \r0_data_reg[154] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[154]),
        .Q(r0_data[154]),
        .R(1'b0));
  FDRE \r0_data_reg[155] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[155]),
        .Q(r0_data[155]),
        .R(1'b0));
  FDRE \r0_data_reg[156] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[156]),
        .Q(r0_data[156]),
        .R(1'b0));
  FDRE \r0_data_reg[157] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[157]),
        .Q(r0_data[157]),
        .R(1'b0));
  FDRE \r0_data_reg[158] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[158]),
        .Q(r0_data[158]),
        .R(1'b0));
  FDRE \r0_data_reg[159] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[159]),
        .Q(r0_data[159]),
        .R(1'b0));
  FDRE \r0_data_reg[15] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[15]),
        .Q(r0_data[15]),
        .R(1'b0));
  FDRE \r0_data_reg[160] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[160]),
        .Q(r0_data[160]),
        .R(1'b0));
  FDRE \r0_data_reg[161] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[161]),
        .Q(r0_data[161]),
        .R(1'b0));
  FDRE \r0_data_reg[162] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[162]),
        .Q(r0_data[162]),
        .R(1'b0));
  FDRE \r0_data_reg[163] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[163]),
        .Q(r0_data[163]),
        .R(1'b0));
  FDRE \r0_data_reg[164] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[164]),
        .Q(r0_data[164]),
        .R(1'b0));
  FDRE \r0_data_reg[165] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[165]),
        .Q(r0_data[165]),
        .R(1'b0));
  FDRE \r0_data_reg[166] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[166]),
        .Q(r0_data[166]),
        .R(1'b0));
  FDRE \r0_data_reg[167] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[167]),
        .Q(r0_data[167]),
        .R(1'b0));
  FDRE \r0_data_reg[168] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[168]),
        .Q(r0_data[168]),
        .R(1'b0));
  FDRE \r0_data_reg[169] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[169]),
        .Q(r0_data[169]),
        .R(1'b0));
  FDRE \r0_data_reg[16] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[16]),
        .Q(r0_data[16]),
        .R(1'b0));
  FDRE \r0_data_reg[170] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[170]),
        .Q(r0_data[170]),
        .R(1'b0));
  FDRE \r0_data_reg[171] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[171]),
        .Q(r0_data[171]),
        .R(1'b0));
  FDRE \r0_data_reg[172] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[172]),
        .Q(r0_data[172]),
        .R(1'b0));
  FDRE \r0_data_reg[173] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[173]),
        .Q(r0_data[173]),
        .R(1'b0));
  FDRE \r0_data_reg[174] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[174]),
        .Q(r0_data[174]),
        .R(1'b0));
  FDRE \r0_data_reg[175] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[175]),
        .Q(r0_data[175]),
        .R(1'b0));
  FDRE \r0_data_reg[176] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[176]),
        .Q(r0_data[176]),
        .R(1'b0));
  FDRE \r0_data_reg[177] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[177]),
        .Q(r0_data[177]),
        .R(1'b0));
  FDRE \r0_data_reg[178] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[178]),
        .Q(r0_data[178]),
        .R(1'b0));
  FDRE \r0_data_reg[179] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[179]),
        .Q(r0_data[179]),
        .R(1'b0));
  FDRE \r0_data_reg[17] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[17]),
        .Q(r0_data[17]),
        .R(1'b0));
  FDRE \r0_data_reg[180] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[180]),
        .Q(r0_data[180]),
        .R(1'b0));
  FDRE \r0_data_reg[181] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[181]),
        .Q(r0_data[181]),
        .R(1'b0));
  FDRE \r0_data_reg[182] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[182]),
        .Q(r0_data[182]),
        .R(1'b0));
  FDRE \r0_data_reg[183] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[183]),
        .Q(r0_data[183]),
        .R(1'b0));
  FDRE \r0_data_reg[184] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[184]),
        .Q(r0_data[184]),
        .R(1'b0));
  FDRE \r0_data_reg[185] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[185]),
        .Q(r0_data[185]),
        .R(1'b0));
  FDRE \r0_data_reg[186] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[186]),
        .Q(r0_data[186]),
        .R(1'b0));
  FDRE \r0_data_reg[187] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[187]),
        .Q(r0_data[187]),
        .R(1'b0));
  FDRE \r0_data_reg[188] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[188]),
        .Q(r0_data[188]),
        .R(1'b0));
  FDRE \r0_data_reg[189] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[189]),
        .Q(r0_data[189]),
        .R(1'b0));
  FDRE \r0_data_reg[18] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[18]),
        .Q(r0_data[18]),
        .R(1'b0));
  FDRE \r0_data_reg[190] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[190]),
        .Q(r0_data[190]),
        .R(1'b0));
  FDRE \r0_data_reg[191] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[191]),
        .Q(r0_data[191]),
        .R(1'b0));
  FDRE \r0_data_reg[19] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[19]),
        .Q(r0_data[19]),
        .R(1'b0));
  FDRE \r0_data_reg[1] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[1]),
        .Q(r0_data[1]),
        .R(1'b0));
  FDRE \r0_data_reg[20] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[20]),
        .Q(r0_data[20]),
        .R(1'b0));
  FDRE \r0_data_reg[21] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[21]),
        .Q(r0_data[21]),
        .R(1'b0));
  FDRE \r0_data_reg[22] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[22]),
        .Q(r0_data[22]),
        .R(1'b0));
  FDRE \r0_data_reg[23] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[23]),
        .Q(r0_data[23]),
        .R(1'b0));
  FDRE \r0_data_reg[24] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[24]),
        .Q(r0_data[24]),
        .R(1'b0));
  FDRE \r0_data_reg[25] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[25]),
        .Q(r0_data[25]),
        .R(1'b0));
  FDRE \r0_data_reg[26] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[26]),
        .Q(r0_data[26]),
        .R(1'b0));
  FDRE \r0_data_reg[27] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[27]),
        .Q(r0_data[27]),
        .R(1'b0));
  FDRE \r0_data_reg[28] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[28]),
        .Q(r0_data[28]),
        .R(1'b0));
  FDRE \r0_data_reg[29] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[29]),
        .Q(r0_data[29]),
        .R(1'b0));
  FDRE \r0_data_reg[2] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[2]),
        .Q(r0_data[2]),
        .R(1'b0));
  FDRE \r0_data_reg[30] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[30]),
        .Q(r0_data[30]),
        .R(1'b0));
  FDRE \r0_data_reg[31] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[31]),
        .Q(r0_data[31]),
        .R(1'b0));
  FDRE \r0_data_reg[32] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[32]),
        .Q(r0_data[32]),
        .R(1'b0));
  FDRE \r0_data_reg[33] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[33]),
        .Q(r0_data[33]),
        .R(1'b0));
  FDRE \r0_data_reg[34] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[34]),
        .Q(r0_data[34]),
        .R(1'b0));
  FDRE \r0_data_reg[35] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[35]),
        .Q(r0_data[35]),
        .R(1'b0));
  FDRE \r0_data_reg[36] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[36]),
        .Q(r0_data[36]),
        .R(1'b0));
  FDRE \r0_data_reg[37] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[37]),
        .Q(r0_data[37]),
        .R(1'b0));
  FDRE \r0_data_reg[38] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[38]),
        .Q(r0_data[38]),
        .R(1'b0));
  FDRE \r0_data_reg[39] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[39]),
        .Q(r0_data[39]),
        .R(1'b0));
  FDRE \r0_data_reg[3] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[3]),
        .Q(r0_data[3]),
        .R(1'b0));
  FDRE \r0_data_reg[40] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[40]),
        .Q(r0_data[40]),
        .R(1'b0));
  FDRE \r0_data_reg[41] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[41]),
        .Q(r0_data[41]),
        .R(1'b0));
  FDRE \r0_data_reg[42] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[42]),
        .Q(r0_data[42]),
        .R(1'b0));
  FDRE \r0_data_reg[43] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[43]),
        .Q(r0_data[43]),
        .R(1'b0));
  FDRE \r0_data_reg[44] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[44]),
        .Q(r0_data[44]),
        .R(1'b0));
  FDRE \r0_data_reg[45] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[45]),
        .Q(r0_data[45]),
        .R(1'b0));
  FDRE \r0_data_reg[46] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[46]),
        .Q(r0_data[46]),
        .R(1'b0));
  FDRE \r0_data_reg[47] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[47]),
        .Q(r0_data[47]),
        .R(1'b0));
  FDRE \r0_data_reg[48] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[48]),
        .Q(r0_data[48]),
        .R(1'b0));
  FDRE \r0_data_reg[49] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[49]),
        .Q(r0_data[49]),
        .R(1'b0));
  FDRE \r0_data_reg[4] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[4]),
        .Q(r0_data[4]),
        .R(1'b0));
  FDRE \r0_data_reg[50] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[50]),
        .Q(r0_data[50]),
        .R(1'b0));
  FDRE \r0_data_reg[51] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[51]),
        .Q(r0_data[51]),
        .R(1'b0));
  FDRE \r0_data_reg[52] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[52]),
        .Q(r0_data[52]),
        .R(1'b0));
  FDRE \r0_data_reg[53] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[53]),
        .Q(r0_data[53]),
        .R(1'b0));
  FDRE \r0_data_reg[54] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[54]),
        .Q(r0_data[54]),
        .R(1'b0));
  FDRE \r0_data_reg[55] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[55]),
        .Q(r0_data[55]),
        .R(1'b0));
  FDRE \r0_data_reg[56] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[56]),
        .Q(r0_data[56]),
        .R(1'b0));
  FDRE \r0_data_reg[57] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[57]),
        .Q(r0_data[57]),
        .R(1'b0));
  FDRE \r0_data_reg[58] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[58]),
        .Q(r0_data[58]),
        .R(1'b0));
  FDRE \r0_data_reg[59] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[59]),
        .Q(r0_data[59]),
        .R(1'b0));
  FDRE \r0_data_reg[5] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[5]),
        .Q(r0_data[5]),
        .R(1'b0));
  FDRE \r0_data_reg[60] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[60]),
        .Q(r0_data[60]),
        .R(1'b0));
  FDRE \r0_data_reg[61] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[61]),
        .Q(r0_data[61]),
        .R(1'b0));
  FDRE \r0_data_reg[62] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[62]),
        .Q(r0_data[62]),
        .R(1'b0));
  FDRE \r0_data_reg[63] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[63]),
        .Q(r0_data[63]),
        .R(1'b0));
  FDRE \r0_data_reg[64] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[64]),
        .Q(r0_data[64]),
        .R(1'b0));
  FDRE \r0_data_reg[65] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[65]),
        .Q(r0_data[65]),
        .R(1'b0));
  FDRE \r0_data_reg[66] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[66]),
        .Q(r0_data[66]),
        .R(1'b0));
  FDRE \r0_data_reg[67] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[67]),
        .Q(r0_data[67]),
        .R(1'b0));
  FDRE \r0_data_reg[68] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[68]),
        .Q(r0_data[68]),
        .R(1'b0));
  FDRE \r0_data_reg[69] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[69]),
        .Q(r0_data[69]),
        .R(1'b0));
  FDRE \r0_data_reg[6] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[6]),
        .Q(r0_data[6]),
        .R(1'b0));
  FDRE \r0_data_reg[70] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[70]),
        .Q(r0_data[70]),
        .R(1'b0));
  FDRE \r0_data_reg[71] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[71]),
        .Q(r0_data[71]),
        .R(1'b0));
  FDRE \r0_data_reg[72] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[72]),
        .Q(r0_data[72]),
        .R(1'b0));
  FDRE \r0_data_reg[73] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[73]),
        .Q(r0_data[73]),
        .R(1'b0));
  FDRE \r0_data_reg[74] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[74]),
        .Q(r0_data[74]),
        .R(1'b0));
  FDRE \r0_data_reg[75] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[75]),
        .Q(r0_data[75]),
        .R(1'b0));
  FDRE \r0_data_reg[76] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[76]),
        .Q(r0_data[76]),
        .R(1'b0));
  FDRE \r0_data_reg[77] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[77]),
        .Q(r0_data[77]),
        .R(1'b0));
  FDRE \r0_data_reg[78] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[78]),
        .Q(r0_data[78]),
        .R(1'b0));
  FDRE \r0_data_reg[79] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[79]),
        .Q(r0_data[79]),
        .R(1'b0));
  FDRE \r0_data_reg[7] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[7]),
        .Q(r0_data[7]),
        .R(1'b0));
  FDRE \r0_data_reg[80] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[80]),
        .Q(r0_data[80]),
        .R(1'b0));
  FDRE \r0_data_reg[81] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[81]),
        .Q(r0_data[81]),
        .R(1'b0));
  FDRE \r0_data_reg[82] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[82]),
        .Q(r0_data[82]),
        .R(1'b0));
  FDRE \r0_data_reg[83] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[83]),
        .Q(r0_data[83]),
        .R(1'b0));
  FDRE \r0_data_reg[84] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[84]),
        .Q(r0_data[84]),
        .R(1'b0));
  FDRE \r0_data_reg[85] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[85]),
        .Q(r0_data[85]),
        .R(1'b0));
  FDRE \r0_data_reg[86] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[86]),
        .Q(r0_data[86]),
        .R(1'b0));
  FDRE \r0_data_reg[87] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[87]),
        .Q(r0_data[87]),
        .R(1'b0));
  FDRE \r0_data_reg[88] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[88]),
        .Q(r0_data[88]),
        .R(1'b0));
  FDRE \r0_data_reg[89] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[89]),
        .Q(r0_data[89]),
        .R(1'b0));
  FDRE \r0_data_reg[8] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[8]),
        .Q(r0_data[8]),
        .R(1'b0));
  FDRE \r0_data_reg[90] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[90]),
        .Q(r0_data[90]),
        .R(1'b0));
  FDRE \r0_data_reg[91] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[91]),
        .Q(r0_data[91]),
        .R(1'b0));
  FDRE \r0_data_reg[92] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[92]),
        .Q(r0_data[92]),
        .R(1'b0));
  FDRE \r0_data_reg[93] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[93]),
        .Q(r0_data[93]),
        .R(1'b0));
  FDRE \r0_data_reg[94] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[94]),
        .Q(r0_data[94]),
        .R(1'b0));
  FDRE \r0_data_reg[95] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[95]),
        .Q(r0_data[95]),
        .R(1'b0));
  FDRE \r0_data_reg[96] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[96]),
        .Q(r0_data[96]),
        .R(1'b0));
  FDRE \r0_data_reg[97] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[97]),
        .Q(r0_data[97]),
        .R(1'b0));
  FDRE \r0_data_reg[98] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[98]),
        .Q(r0_data[98]),
        .R(1'b0));
  FDRE \r0_data_reg[99] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[99]),
        .Q(r0_data[99]),
        .R(1'b0));
  FDRE \r0_data_reg[9] 
       (.C(aclk),
        .CE(\state_reg[0]_0 ),
        .D(s_axis_tdata[9]),
        .Q(r0_data[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hEA)) 
    \r0_reg_sel[1]_i_1 
       (.I0(areset_r),
        .I1(d2_valid),
        .I2(d2_ready),
        .O(\r0_reg_sel[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \r0_reg_sel[1]_i_2 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg[0]_0 ),
        .I2(d2_valid),
        .O(r0_reg_sel0));
  FDSE #(
    .INIT(1'b1)) 
    \r0_reg_sel_reg[0] 
       (.C(aclk),
        .CE(r0_reg_sel0),
        .D(1'b0),
        .Q(\r0_reg_sel_reg_n_0_[0] ),
        .S(\r0_reg_sel[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r0_reg_sel_reg[1] 
       (.C(aclk),
        .CE(r0_reg_sel0),
        .D(\r0_reg_sel_reg_n_0_[0] ),
        .Q(\r0_reg_sel_reg_n_0_[1] ),
        .R(\r0_reg_sel[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFF4FF)) 
    \state[0]_i_1__0 
       (.I0(s_axis_tvalid),
        .I1(\state_reg[0]_0 ),
        .I2(d2_ready),
        .I3(d2_valid),
        .I4(\state_reg_n_0_[2] ),
        .O(state[0]));
  LUT6 #(
    .INIT(64'h22200000FFFFFFFF)) 
    \state[1]_i_1__0 
       (.I0(\state_reg[0]_0 ),
        .I1(d2_valid),
        .I2(\r0_reg_sel_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(s_axis_tvalid),
        .I5(\state[1]_i_2_n_0 ),
        .O(state[1]));
  LUT3 #(
    .INIT(8'hFB)) 
    \state[1]_i_2 
       (.I0(\state_reg_n_0_[2] ),
        .I1(d2_valid),
        .I2(d2_ready),
        .O(\state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000020)) 
    \state[2]_i_1__0 
       (.I0(\state_reg[0]_0 ),
        .I1(d2_valid),
        .I2(s_axis_tvalid),
        .I3(\r0_reg_sel_reg_n_0_[1] ),
        .I4(p_0_in),
        .I5(\state[2]_i_2_n_0 ),
        .O(state[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0000D000)) 
    \state[2]_i_2 
       (.I0(\state_reg[0]_0 ),
        .I1(s_axis_tvalid),
        .I2(d2_ready),
        .I3(d2_valid),
        .I4(\state_reg_n_0_[2] ),
        .O(\state[2]_i_2_n_0 ));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(state[0]),
        .Q(\state_reg[0]_0 ),
        .R(areset_r));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(state[1]),
        .Q(d2_valid),
        .R(areset_r));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(state[2]),
        .Q(\state_reg_n_0_[2] ),
        .R(areset_r));
endmodule

(* CHECK_LICENSE_TYPE = "axis_dwidth_converter_wr,axis_dwidth_converter_v1_1_26_axis_dwidth_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_dwidth_converter_v1_1_26_axis_dwidth_converter,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module axis_dwidth_converter_wr
   (aclk,
    aresetn,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 24, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [191:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [127:0]m_axis_tdata;

  wire aclk;
  wire aresetn;
  wire [127:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [191:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire NLW_inst_m_axis_tlast_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [15:0]NLW_inst_m_axis_tkeep_UNCONNECTED;
  wire [15:0]NLW_inst_m_axis_tstrb_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tuser_UNCONNECTED;

  (* C_AXIS_SIGNAL_SET = "3" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_M_AXIS_TDATA_WIDTH = "128" *) 
  (* C_M_AXIS_TUSER_WIDTH = "1" *) 
  (* C_S_AXIS_TDATA_WIDTH = "192" *) 
  (* C_S_AXIS_TUSER_WIDTH = "1" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* G_INDX_SS_TDATA = "1" *) 
  (* G_INDX_SS_TDEST = "6" *) 
  (* G_INDX_SS_TID = "5" *) 
  (* G_INDX_SS_TKEEP = "3" *) 
  (* G_INDX_SS_TLAST = "4" *) 
  (* G_INDX_SS_TREADY = "0" *) 
  (* G_INDX_SS_TSTRB = "2" *) 
  (* G_INDX_SS_TUSER = "7" *) 
  (* G_MASK_SS_TDATA = "2" *) 
  (* G_MASK_SS_TDEST = "64" *) 
  (* G_MASK_SS_TID = "32" *) 
  (* G_MASK_SS_TKEEP = "8" *) 
  (* G_MASK_SS_TLAST = "16" *) 
  (* G_MASK_SS_TREADY = "1" *) 
  (* G_MASK_SS_TSTRB = "4" *) 
  (* G_MASK_SS_TUSER = "128" *) 
  (* G_TASK_SEVERITY_ERR = "2" *) 
  (* G_TASK_SEVERITY_INFO = "0" *) 
  (* G_TASK_SEVERITY_WARNING = "1" *) 
  (* P_AXIS_SIGNAL_SET = "32'b00000000000000000000000000000011" *) 
  (* P_D1_REG_CONFIG = "0" *) 
  (* P_D1_TUSER_WIDTH = "24" *) 
  (* P_D2_TDATA_WIDTH = "384" *) 
  (* P_D2_TUSER_WIDTH = "48" *) 
  (* P_D3_REG_CONFIG = "0" *) 
  (* P_D3_TUSER_WIDTH = "16" *) 
  (* P_M_RATIO = "3" *) 
  (* P_SS_TKEEP_REQUIRED = "0" *) 
  (* P_S_RATIO = "2" *) 
  axis_dwidth_converter_wr_axis_dwidth_converter_v1_1_26_axis_dwidth_converter inst
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_inst_m_axis_tkeep_UNCONNECTED[15:0]),
        .m_axis_tlast(NLW_inst_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_inst_m_axis_tstrb_UNCONNECTED[15:0]),
        .m_axis_tuser(NLW_inst_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tlast(1'b1),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tuser(1'b0),
        .s_axis_tvalid(s_axis_tvalid));
endmodule
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
