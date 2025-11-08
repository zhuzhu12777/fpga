set cur_tcl_path [file dirname [file normalize [info script]]]

if {[get_ips fifo_256x56b] == ""} {
  create_ip -name fifo_generator -vendor xilinx.com -library ip -module_name fifo_256x56b
}
set_property -dict [list \
  CONFIG.Input_Data_Width {56} \
  CONFIG.Input_Depth {256} \
  CONFIG.Performance_Options {First_Word_Fall_Through} \
] [get_ips fifo_256x56b]


if {[get_ips axi_apb_bridge_0] == ""} {
  create_ip -name axi_apb_bridge -vendor xilinx.com -library ip -module_name axi_apb_bridge_0
}
set_property -dict [list \
  CONFIG.C_APB_NUM_SLAVES {1} \
  CONFIG.C_M_APB_PROTOCOL {apb4} \
  CONFIG.C_HIGHADDR {0x00000000FFFFFFFF} \
] [get_ips axi_apb_bridge_0]



