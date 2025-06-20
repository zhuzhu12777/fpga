
set_property PACKAGE_PIN J14 [get_ports {SPI_SCK}]
set_property PACKAGE_PIN G13 [get_ports {SPI_CS}]
set_property PACKAGE_PIN J13 [get_ports {SPI_IO0}]
set_property PACKAGE_PIN H13 [get_ports {SPI_IO1}]
set_property IOSTANDARD LVCMOS18 [get_ports {SPI_*}]

set_property PACKAGE_PIN M28  [get_ports gt_refclk_p]
create_clock -name GT_REFCLK -period 6.667 [get_ports gt_refclk_p]

set_property PACKAGE_PIN AM9 [get_ports {C0_SYS_CLK_0_clk_n} ]
set_property PACKAGE_PIN AL9 [get_ports {C0_SYS_CLK_0_clk_p} ]

set_property PACKAGE_PIN AL17 [get_ports {C0_DDR4_0_dqs_t[0]}]
set_property PACKAGE_PIN AM16 [get_ports {C0_DDR4_0_dqs_c[0]}]
set_property PACKAGE_PIN AH18 [get_ports {C0_DDR4_0_dqs_t[1]}]
set_property PACKAGE_PIN AJ18 [get_ports {C0_DDR4_0_dqs_c[1]}]
set_property PACKAGE_PIN AN5 [get_ports {C0_DDR4_0_dqs_t[2]}]
set_property PACKAGE_PIN AN4 [get_ports {C0_DDR4_0_dqs_c[2]}]
set_property PACKAGE_PIN AM8 [get_ports {C0_DDR4_0_dqs_t[3]}]
set_property PACKAGE_PIN AM7 [get_ports {C0_DDR4_0_dqs_c[3]}]

set_property PACKAGE_PIN AM14 [get_ports {C0_DDR4_0_dm_n[0]}]
set_property PACKAGE_PIN AH13 [get_ports {C0_DDR4_0_dm_n[1]}]
set_property PACKAGE_PIN AP8 [get_ports {C0_DDR4_0_dm_n[2]}]
set_property PACKAGE_PIN AP13 [get_ports {C0_DDR4_0_dm_n[3]}]

set_property PACKAGE_PIN AN15 [get_ports {C0_DDR4_0_dq[0]} ]
set_property PACKAGE_PIN AP16 [get_ports {C0_DDR4_0_dq[1]} ]
set_property PACKAGE_PIN AM17 [get_ports {C0_DDR4_0_dq[2]} ]
set_property PACKAGE_PIN AP15 [get_ports {C0_DDR4_0_dq[3]} ]
set_property PACKAGE_PIN AM15 [get_ports {C0_DDR4_0_dq[4]} ]
set_property PACKAGE_PIN AP17 [get_ports {C0_DDR4_0_dq[5]} ]
set_property PACKAGE_PIN AN17 [get_ports {C0_DDR4_0_dq[6]} ]
set_property PACKAGE_PIN AN18 [get_ports {C0_DDR4_0_dq[7]} ]
set_property PACKAGE_PIN AK14 [get_ports {C0_DDR4_0_dq[8]} ]
set_property PACKAGE_PIN AL18 [get_ports {C0_DDR4_0_dq[9]} ]
set_property PACKAGE_PIN AK15 [get_ports {C0_DDR4_0_dq[10]}]
set_property PACKAGE_PIN AK18 [get_ports {C0_DDR4_0_dq[11]}]
set_property PACKAGE_PIN AK16 [get_ports {C0_DDR4_0_dq[12]}]
set_property PACKAGE_PIN AJ16 [get_ports {C0_DDR4_0_dq[13]}]
set_property PACKAGE_PIN AJ15 [get_ports {C0_DDR4_0_dq[14]}]
set_property PACKAGE_PIN AJ17 [get_ports {C0_DDR4_0_dq[15]}]
set_property PACKAGE_PIN AP5 [get_ports {C0_DDR4_0_dq[16]}]
set_property PACKAGE_PIN AP6 [get_ports {C0_DDR4_0_dq[17]}]
set_property PACKAGE_PIN AM5 [get_ports {C0_DDR4_0_dq[18]}]
set_property PACKAGE_PIN AM6 [get_ports {C0_DDR4_0_dq[19]}]
set_property PACKAGE_PIN AP3 [get_ports {C0_DDR4_0_dq[20]}]
set_property PACKAGE_PIN AP2 [get_ports {C0_DDR4_0_dq[21]}]
set_property PACKAGE_PIN AN2 [get_ports {C0_DDR4_0_dq[22]}]
set_property PACKAGE_PIN AN1 [get_ports {C0_DDR4_0_dq[23]}]
set_property PACKAGE_PIN AP11 [get_ports {C0_DDR4_0_dq[24]}]
set_property PACKAGE_PIN AN7 [get_ports {C0_DDR4_0_dq[25]}]
set_property PACKAGE_PIN AM10 [get_ports {C0_DDR4_0_dq[26]}]
set_property PACKAGE_PIN AP10 [get_ports {C0_DDR4_0_dq[27]}]
set_property PACKAGE_PIN AN13 [get_ports {C0_DDR4_0_dq[28]}]
set_property PACKAGE_PIN AN10 [get_ports {C0_DDR4_0_dq[29]}]
set_property PACKAGE_PIN AN8 [get_ports {C0_DDR4_0_dq[30]}]
set_property PACKAGE_PIN AN12 [get_ports {C0_DDR4_0_dq[31]}]

set_property PACKAGE_PIN AD16 [get_ports {C0_DDR4_0_adr[0]} ]
set_property PACKAGE_PIN AC17 [get_ports {C0_DDR4_0_adr[1]} ]
set_property PACKAGE_PIN AD18 [get_ports {C0_DDR4_0_adr[2]} ]
set_property PACKAGE_PIN AG16 [get_ports {C0_DDR4_0_adr[3]} ]
set_property PACKAGE_PIN AG17 [get_ports {C0_DDR4_0_adr[4]} ]
set_property PACKAGE_PIN AF17 [get_ports {C0_DDR4_0_adr[5]} ]
set_property PACKAGE_PIN AD15 [get_ports {C0_DDR4_0_adr[6]} ]
set_property PACKAGE_PIN AC16 [get_ports {C0_DDR4_0_adr[7]} ]
set_property PACKAGE_PIN AC15 [get_ports {C0_DDR4_0_adr[8]} ]
set_property PACKAGE_PIN AD17 [get_ports {C0_DDR4_0_adr[9]} ]
set_property PACKAGE_PIN AF16 [get_ports {C0_DDR4_0_adr[10]}]
set_property PACKAGE_PIN AF18 [get_ports {C0_DDR4_0_adr[11]}]
set_property PACKAGE_PIN AH15 [get_ports {C0_DDR4_0_adr[12]}]
set_property PACKAGE_PIN AE18 [get_ports {C0_DDR4_0_adr[13]}]
set_property PACKAGE_PIN AE13 [get_ports {C0_DDR4_0_adr[14]}]
set_property PACKAGE_PIN AE15 [get_ports {C0_DDR4_0_adr[15]}]
set_property PACKAGE_PIN AG15 [get_ports {C0_DDR4_0_adr[16]}]

set_property PACKAGE_PIN AG14 [get_ports {C0_DDR4_0_ck_t}]
set_property PACKAGE_PIN AH14 [get_ports {C0_DDR4_0_ck_c}]
set_property PACKAGE_PIN AE16 [get_ports {C0_DDR4_0_ba[0]}  ]
set_property PACKAGE_PIN AH17 [get_ports {C0_DDR4_0_ba[1]}  ]
set_property PACKAGE_PIN AC13 [get_ports {C0_DDR4_0_bg}  ]
set_property PACKAGE_PIN AF13 [get_ports {C0_DDR4_0_cke} ]
set_property PACKAGE_PIN AE14 [get_ports {C0_DDR4_0_cs_n}]
set_property PACKAGE_PIN AF14 [get_ports {C0_DDR4_0_odt} ]
set_property PACKAGE_PIN AD13 [get_ports {C0_DDR4_0_act_n}  ]
set_property PACKAGE_PIN AK13 [get_ports {C0_DDR4_0_reset_n}]

### IOSTANARD
set_property IOSTANDARD DIFF_SSTL12 [get_ports {C0_SYS_CLK_0_clk_p}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {C0_SYS_CLK_0_clk_n}]
set_property IOSTANDARD LVCMOS12 [get_ports {C0_DDR4_0_reset_n}]
set_property DRIVE 8 [get_ports {C0_DDR4_0_reset_n}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_0_act_n}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {C0_DDR4_0_ck_c}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {C0_DDR4_0_ck_t}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_0_ba[*]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_0_bg}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_0_adr[*]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_0_cs_n}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_0_cke}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_0_odt}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_0_dq[*]}]
set_property IOSTANDARD POD12_DCI [ get_ports {C0_DDR4_0_dm_n[*]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {C0_DDR4_0_dqs_c[*]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {C0_DDR4_0_dqs_t[*]}]
