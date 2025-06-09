

set_property PACKAGE_PIN M28  [get_ports gt_refclk_p]
create_clock -name GT_REFCLK -period 6.667 [get_ports gt_refclk_p]

set_property PACKAGE_PIN AL9 [get_ports {C0_SYS_CLK_0_clk_n} ]
set_property PACKAGE_PIN AM9 [get_ports {C0_SYS_CLK_0_clk_p} ]

set_property PACKAGE_PIN AL17 [get_ports {C0_DDR4_0_dqs_t[0]}]
set_property PACKAGE_PIN AM16 [get_ports {C0_DDR4_0_dqs_c[0]}]
set_property PACKAGE_PIN AH18 [get_ports {C0_DDR4_0_dqs_t[1]}]
set_property PACKAGE_PIN AJ18 [get_ports {C0_DDR4_0_dqs_c[1]}]
set_property PACKAGE_PIN AN5 [get_ports {C0_DDR4_0_dqs_t[2]}]
set_property PACKAGE_PIN AN4 [get_ports {C0_DDR4_0_dqs_c[2]}]
set_property PACKAGE_PIN AM8 [get_ports {C0_DDR4_0_dqs_t[3]}]
set_property PACKAGE_PIN AM7 [get_ports {C0_DDR4_0_dqs_c[3]}]



