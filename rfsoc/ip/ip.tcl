set cur_tcl_path [file dirname [file normalize [info script]]]

## dac path
if {[get_ips axi_datamover_rd] == ""} {
  create_ip -name axi_datamover -vendor xilinx.com -library ip -module_name axi_datamover_rd
}
set_property -dict [list \
  CONFIG.c_enable_s2mm {0} \
  CONFIG.c_m_axis_mm2s_tdata_width {256} \
  CONFIG.c_mm2s_btt_used {23} \
  CONFIG.c_mm2s_burst_size {128} \
  CONFIG.c_mm2s_stscmd_is_async {true} \
] [get_ips axi_datamover_rd]

if {[get_ips axis_data_fifo_rd] == ""} {
  create_ip -name axis_data_fifo -vendor xilinx.com -library ip -module_name axis_data_fifo_rd
}
set_property -dict [list \
  CONFIG.FIFO_DEPTH {64} \
  CONFIG.IS_ACLK_ASYNC {1} \
  CONFIG.TDATA_NUM_BYTES {32} \
] [get_ips axis_data_fifo_rd]

if {[get_ips axis_dwidth_converter_rd] == ""} {
  create_ip -name axis_dwidth_converter -vendor xilinx.com -library ip -module_name axis_dwidth_converter_rd
}
set_property -dict [list \
  CONFIG.M_TDATA_NUM_BYTES {16} \
  CONFIG.S_TDATA_NUM_BYTES {32} \
] [get_ips axis_dwidth_converter_rd]


## adc path
if {[get_ips axi_datamover_wr] == ""} {
  create_ip -name axi_datamover -vendor xilinx.com -library ip -module_name axi_datamover_wr
}
set_property -dict [list \
  CONFIG.c_enable_mm2s {0} \
  CONFIG.c_s2mm_btt_used {23} \
  CONFIG.c_s2mm_burst_size {256} \
  CONFIG.c_s2mm_stscmd_is_async {true} \
  CONFIG.c_s_axis_s2mm_tdata_width {128} \
  CONFIG.c_m_axi_s2mm_data_width {128} \
] [get_ips axi_datamover_wr]

if {[get_ips axis_data_afifo_32b] == ""} {
  create_ip -name axis_data_fifo -vendor xilinx.com -library ip -module_name axis_data_afifo_32b
}
set_property -dict [list \
  CONFIG.FIFO_DEPTH {128} \
  CONFIG.IS_ACLK_ASYNC {1} \
  CONFIG.TDATA_NUM_BYTES {4} \
] [get_ips axis_data_afifo_32b]

if {[get_ips axis_combiner_0] == ""} {
  create_ip -name axis_combiner -vendor xilinx.com -library ip -module_name axis_combiner_0
}
set_property -dict [list \
  CONFIG.NUM_SI {6} \
  CONFIG.TDATA_NUM_BYTES {4} \
] [get_ips axis_combiner_0]

if {[get_ips axis_dwidth_converter_wr] == ""} {
  create_ip -name axis_dwidth_converter -vendor xilinx.com -library ip -module_name axis_dwidth_converter_wr
}
set_property -dict [list \
  CONFIG.M_TDATA_NUM_BYTES {16} \
  CONFIG.S_TDATA_NUM_BYTES {24} \
] [get_ips axis_dwidth_converter_wr]


# gt path
if {[get_ips blk_mem_gen_gt] == ""} {
  create_ip -name blk_mem_gen -vendor xilinx.com -library ip -module_name blk_mem_gen_gt
}
set_property -dict [list \
  CONFIG.Assume_Synchronous_Clk {false} \
  CONFIG.Enable_A {Always_Enabled} \
  CONFIG.Enable_B {Always_Enabled} \
  CONFIG.Memory_Type {Simple_Dual_Port_RAM} \
  CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
  CONFIG.Write_Depth_A {256} \
  CONFIG.Write_Width_A {32} \
] [get_ips blk_mem_gen_gt]


# reg map
create_ip -name axi_apb_bridge -vendor xilinx.com -library ip -module_name axi_apb_bridge_0
set_property -dict [list \
  CONFIG.C_APB_NUM_SLAVES {1} \
  CONFIG.C_M_APB_PROTOCOL {apb4} \
  CONFIG.C_HIGHADDR {0x00000000FFFFFFFF} \
] [get_ips axi_apb_bridge_0]


# rf converter


# gty
if {[get_ips GTY_Raw_6CHN] == ""} {
    create_ip -name gtwizard_ultrascale -vendor xilinx.com -library ip -module_name GTY_Raw_6CHN
}
set_property -dict [list \
    CONFIG.CHANNEL_ENABLE {X0Y9 X0Y8 X0Y7 X0Y6 X0Y5 X0Y4} \
    CONFIG.FREERUN_FREQUENCY {100} \
    CONFIG.RX_LINE_RATE {6} \
    CONFIG.RX_PLL_TYPE {CPLL} \
    CONFIG.RX_REFCLK_FREQUENCY {150} \
    CONFIG.RX_REFCLK_SOURCE {X0Y9 clk0-1 X0Y8 clk0-1} \
    CONFIG.TX_LINE_RATE {6} \
    CONFIG.TX_PLL_TYPE {CPLL} \
    CONFIG.TX_REFCLK_FREQUENCY {150} \
    CONFIG.TX_REFCLK_SOURCE {X0Y9 clk0-1 X0Y8 clk0-1} \
] [get_ips GTY_Raw_6CHN]


