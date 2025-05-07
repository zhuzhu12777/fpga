

create_ip -name axi_datamover -vendor xilinx.com -library ip -version 5.1 -module_name axi_datamover_rd
set_property -dict [list \
  CONFIG.Component_Name {axi_datamover_rd} \
  CONFIG.c_enable_s2mm {0} \
  CONFIG.c_m_axis_mm2s_tdata_width {256} \
  CONFIG.c_mm2s_btt_used {23} \
  CONFIG.c_mm2s_burst_size {128} \
  CONFIG.c_mm2s_stscmd_is_async {true} \
] [get_ips axi_datamover_rd]


create_ip -name axis_data_fifo -vendor xilinx.com -library ip -version 2.0 -module_name axis_data_fifo_rd
set_property -dict [list \
  CONFIG.Component_Name {axis_data_fifo_rd} \
  CONFIG.FIFO_DEPTH {64} \
  CONFIG.IS_ACLK_ASYNC {1} \
  CONFIG.TDATA_NUM_BYTES {32} \
] [get_ips axis_data_fifo_rd]


create_ip -name axis_dwidth_converter -vendor xilinx.com -library ip -version 1.1 -module_name axis_dwidth_converter_rd
set_property -dict [list \
  CONFIG.Component_Name {axis_dwidth_converter_rd} \
  CONFIG.M_TDATA_NUM_BYTES {16} \
  CONFIG.S_TDATA_NUM_BYTES {32} \
] [get_ips axis_dwidth_converter_rd]



create_ip -name axi_datamover -vendor xilinx.com -library ip -version 5.1 -module_name axi_datamover_wr
set_property -dict [list \
  CONFIG.Component_Name {axi_datamover_wr} \
  CONFIG.c_enable_mm2s {0} \
  CONFIG.c_s2mm_btt_used {23} \
  CONFIG.c_s2mm_burst_size {256} \
  CONFIG.c_s2mm_stscmd_is_async {true} \
  CONFIG.c_s_axis_s2mm_tdata_width {128} \
  CONFIG.c_m_axi_s2mm_data_width {128} \
] [get_ips axi_datamover_wr]


create_ip -name axis_data_fifo -vendor xilinx.com -library ip -version 2.0 -module_name axis_data_fifo_32b
set_property -dict [list \
  CONFIG.Component_Name {axis_data_fifo_32b} \
  CONFIG.FIFO_DEPTH {64} \
  CONFIG.TDATA_NUM_BYTES {4} \
] [get_ips axis_data_fifo_32b]


create_ip -name axis_combiner -vendor xilinx.com -library ip -version 1.1 -module_name axis_combiner_0
set_property -dict [list \
  CONFIG.NUM_SI {6} \
  CONFIG.TDATA_NUM_BYTES {4} \
] [get_ips axis_combiner_0]


create_ip -name axis_dwidth_converter -vendor xilinx.com -library ip -version 1.1 -module_name axis_dwidth_converter_wr
set_property -dict [list \
  CONFIG.Component_Name {axis_dwidth_converter_wr} \
  CONFIG.M_TDATA_NUM_BYTES {16} \
  CONFIG.S_TDATA_NUM_BYTES {24} \
] [get_ips axis_dwidth_converter_wr]


create_ip -name axis_data_fifo -vendor xilinx.com -library ip -version 2.0 -module_name axis_data_afifo_192b
set_property -dict [list \
  CONFIG.Component_Name {axis_data_afifo_192b} \
  CONFIG.FIFO_DEPTH {256} \
  CONFIG.IS_ACLK_ASYNC {1} \
  CONFIG.TDATA_NUM_BYTES {24} \
] [get_ips axis_data_afifo_192b]


create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name blk_mem_gen_gt
set_property -dict [list \
  CONFIG.Assume_Synchronous_Clk {false} \
  CONFIG.Component_Name {blk_mem_gen_gt} \
  CONFIG.Enable_A {Always_Enabled} \
  CONFIG.Enable_B {Always_Enabled} \
  CONFIG.Memory_Type {Simple_Dual_Port_RAM} \
  CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
  CONFIG.Write_Depth_A {256} \
  CONFIG.Write_Width_A {32} \
] [get_ips blk_mem_gen_gt]
