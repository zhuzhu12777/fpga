
###############################################################################
### J11 ###
#TX0
set_property PACKAGE_PIN H19  [get_ports {SPI_LOAD[0]}]
set_property PACKAGE_PIN G15  [get_ports {SPI_MISO[0]}]
set_property PACKAGE_PIN C17  [get_ports {SPI_MOSI[0]}]
set_property PACKAGE_PIN D18  [get_ports {SPI_SYSRST[0]}]
set_property PACKAGE_PIN B19  [get_ports {SPI_SCK[0]}]
set_property PACKAGE_PIN F21  [get_ports {SPI_CSN[0]}]

#TX1
set_property PACKAGE_PIN G17  [get_ports {SPI_LOAD[1]}]
set_property PACKAGE_PIN A16  [get_ports {SPI_MISO[1]}]
set_property PACKAGE_PIN C15  [get_ports {SPI_MOSI[1]}]
set_property PACKAGE_PIN B16  [get_ports {SPI_SYSRST[1]}]
set_property PACKAGE_PIN D20  [get_ports {SPI_SCK[1]}]
set_property PACKAGE_PIN E21  [get_ports {SPI_CSN[1]}]

#TX2
set_property PACKAGE_PIN H20  [get_ports {SPI_CSN[2]}]
set_property PACKAGE_PIN G16  [get_ports {SPI_SCK[2]}]
set_property PACKAGE_PIN C18  [get_ports {SPI_SYSRST[2]}]
set_property PACKAGE_PIN C19  [get_ports {SPI_MOSI[2]}]
set_property PACKAGE_PIN B20  [get_ports {SPI_MISO[2]}]
set_property PACKAGE_PIN F22  [get_ports {SPI_LOAD[2]}]

#TX3
set_property PACKAGE_PIN F17  [get_ports {SPI_CSN[3]}]
set_property PACKAGE_PIN A17  [get_ports {SPI_SCK[3]}]
set_property PACKAGE_PIN B15  [get_ports {SPI_SYSRST[3]}]
set_property PACKAGE_PIN B17  [get_ports {SPI_MOSI[3]}]
set_property PACKAGE_PIN C20  [get_ports {SPI_MISO[3]}]
set_property PACKAGE_PIN D21  [get_ports {SPI_LOAD[3]}]

### J12 ###
#RX0
set_property PACKAGE_PIN V12  [get_ports {SPI_LOAD[4]}]
set_property PACKAGE_PIN AA12 [get_ports {SPI_MISO[4]}]
set_property PACKAGE_PIN AA11 [get_ports {SPI_MOSI[4]}]
set_property PACKAGE_PIN Y11  [get_ports {SPI_SYSRST[4]}]
set_property PACKAGE_PIN AB10 [get_ports {SPI_SCK[4]}]
set_property PACKAGE_PIN AA9  [get_ports {SPI_CSN[4]}]

#RX1
set_property PACKAGE_PIN AA7  [get_ports {SPI_LOAD[5]}]
set_property PACKAGE_PIN Y6   [get_ports {SPI_MISO[5]}]
set_property PACKAGE_PIN AB5  [get_ports {SPI_MOSI[5]}]
set_property PACKAGE_PIN W6   [get_ports {SPI_SYSRST[5]}]
set_property PACKAGE_PIN V5   [get_ports {SPI_SCK[5]}]
set_property PACKAGE_PIN T4   [get_ports {SPI_CSN[5]}]

#RX2
set_property PACKAGE_PIN AA6  [get_ports {SPI_CSN[6]}]
set_property PACKAGE_PIN Y5   [get_ports {SPI_SCK[6]}]
set_property PACKAGE_PIN AB4  [get_ports {SPI_SYSRST[6]}]
set_property PACKAGE_PIN W5   [get_ports {SPI_MOSI[6]}]
set_property PACKAGE_PIN V4   [get_ports {SPI_MISO[6]}]
set_property PACKAGE_PIN U4   [get_ports {SPI_LOAD[6]}]

#RX3
set_property PACKAGE_PIN AB2  [get_ports {SPI_SYSRST[7]}]
set_property PACKAGE_PIN AB7  [get_ports {SPI_SCK[7]}]
set_property PACKAGE_PIN R6   [get_ports {SPI_CSN[7]}]
set_property PACKAGE_PIN AB1  [get_ports {SPI_MOSI[7]}]
set_property PACKAGE_PIN AB6  [get_ports {SPI_MISO[7]}]
set_property PACKAGE_PIN T6   [get_ports {SPI_LOAD[7]}]

#TRX
set_property PACKAGE_PIN W12  [get_ports {SPI_CSN[8]}]
set_property PACKAGE_PIN AB12 [get_ports {SPI_SCK[8]}]
set_property PACKAGE_PIN AB11 [get_ports {SPI_SYSRST[8]}]
set_property PACKAGE_PIN Y10  [get_ports {SPI_MOSI[8]}]
set_property PACKAGE_PIN AB9  [get_ports {SPI_MISO[8]}]
set_property PACKAGE_PIN AA8  [get_ports {SPI_LOAD[8]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SPI_*}]


set_property PACKAGE_PIN V18  [get_ports {LED_tri_io[0]}]
set_property PACKAGE_PIN V19  [get_ports {LED_tri_io[1]}]
set_property PACKAGE_PIN AB21 [get_ports {LED_tri_io[2]}]
set_property PACKAGE_PIN AB22 [get_ports {LED_tri_io[3]}]
set_property PACKAGE_PIN AA21 [get_ports {LED_tri_io[4]}]
set_property PACKAGE_PIN AA22 [get_ports {LED_tri_io[5]}]
set_property PACKAGE_PIN Y20  [get_ports {LED_tri_io[6]}]
set_property PACKAGE_PIN Y21  [get_ports {LED_tri_io[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED_tri_io*}]












