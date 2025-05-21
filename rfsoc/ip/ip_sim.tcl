
set cur_tcl_path [file dirname [file normalize [info script]]]


if {[get_ips axi_bram_ctrl_128b] == ""} {
  create_ip -name axi_bram_ctrl -vendor xilinx.com -library ip -module_name axi_bram_ctrl_128b
}
set_property -dict [list \
  CONFIG.BMG_INSTANCE {INTERNAL} \
  CONFIG.DATA_WIDTH {128} \
  CONFIG.ID_WIDTH {4} \
  CONFIG.USE_ECC {0} \
] [get_ips axi_bram_ctrl_128b]

if {[get_ips axi_bram_ctrl_256b] == ""} {
  create_ip -name axi_bram_ctrl -vendor xilinx.com -library ip -module_name axi_bram_ctrl_256b
}
set_property -dict [list \
  CONFIG.BMG_INSTANCE {INTERNAL} \
  CONFIG.DATA_WIDTH {256} \
  CONFIG.ID_WIDTH {4} \
  CONFIG.MEM_DEPTH {8192} \
  CONFIG.PROTOCOL {AXI4} \
] [get_ips axi_bram_ctrl_256b]




