


# print('''
# always @(*) begin
#     case(offset)''');

for i in range(9):
    print("        16'h%04x: rdata = {regs.spi_done[%0d], regs.spim_ctrl[%0d][30:16], regs.rd_data[%0d]};" % (i*4+0, i, i, i))

# print('''        default:  rdata = 32'h0;
#     endcase
# end''')

# for i in range(16):
#     print('''
# always @(posedge clk or negedge rstb) begin
#     if(!rstb)
#         regs.spim_ctrl[%0d] <= 24'h0;
#     else if(wren && (offset == 16'h%04x)) begin
#         if (wstrb[2])
#             regs.spim_ctrl[%0d][23:16] <= wdata[23:16];
#         if (wstrb[1])
#             regs.spim_ctrl[%0d][15:8] <= wdata[15:8];
#         if (wstrb[0])
#             regs.spim_ctrl[%0d][7:0] <= wdata[7:0];
#     end
# end''' % (i, i*4, i, i, i))


# for i in range(16):
#     print("    logic [23:0] spim_ctrl_%0d;" % (i))

# def read_gpio_pin(file_name):
#     data = []
#     file = open(file_name, "r")
#     content = file.read()
#     for lines in content.split("\n"):
#         if lines.length == 0 or lines[0].startswith("#"):
#             continue
#         data.append(lines[0])
#     return data

# CEP1_P = ["H19", "G15", "C17", "D18", "B19", "D22", "F21", "G17", "A16", "C15", "B16", \
#           "D20", "E21", "E19", "G20", "G19", "F18", "D16", "A21", "A18", "F16", "E15", "B21", "H22"]
# CEP1_N = ["H20", "G16", "C18", "C19", "B20", "C22", "F22", "F17", "A17", "B15", "B17", \
#           "C20", "D21", "E20", "G21", "F19", "E18", "D17", "A22", "A19", "E16", "D15", "B22", "G22"]
# CEP2_P = ["V12", "AA12", "Y9", "AA11", "Y11", "AB10", "AA9", "AA7", "Y6", "AB5", "W6", \
#           "Y4", "V5", "T4", "AB2", "AB7", "R6", "U6", "V7", "V8", "V10", "U10", "W11", "U12"]
# CEP2_N = ["W12", "AB12", "Y8", "AB11", "Y10", "AB9", "AA8", "AA6", "Y5", "AB4", "W5", \
#           "AA4", "V4", "U4", "AB1", "AB6", "T6", "U5", "W7", "W8", "V9", "U9", "W10", "U11"]

# assert len(CEP1_P) == 24
# assert len(CEP1_N) == 24
# assert len(CEP2_P) == 24
# assert len(CEP2_N) == 24

# CEP = [CEP1_P, CEP1_N, CEP2_P, CEP2_N]

# print("### J11 ###")
# print("#TX0")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[0]}]"  % (CEP1_P[0]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[0]}]"  % (CEP1_P[1]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[0]}]"  % (CEP1_P[2]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[0]}]"  % (CEP1_P[3]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[0]}]"  % (CEP1_P[4]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[0]}]"  % (CEP1_P[6]))
# print("")

# print("#TX1")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[1]}]"  % (CEP1_P[7]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[1]}]"  % (CEP1_P[8]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[1]}]"  % (CEP1_P[9]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[1]}]"  % (CEP1_P[10]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[1]}]"  % (CEP1_P[11]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[1]}]"  % (CEP1_P[12]))
# print("")

# print("#TX2")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[2]}]"  % (CEP1_N[0]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[2]}]"  % (CEP1_N[1]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[2]}]"  % (CEP1_N[2]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[2]}]"  % (CEP1_N[3]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[2]}]"  % (CEP1_N[4]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[2]}]"  % (CEP1_N[6]))
# print("")

# print("#TX3")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[3]}]"  % (CEP1_N[7]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[3]}]"  % (CEP1_N[8]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[3]}]"  % (CEP1_N[9]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[3]}]"  % (CEP1_N[10]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[3]}]"  % (CEP1_N[11]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[3]}]"  % (CEP1_N[12]))
# print("")

# print("### J12 ###")
# print("#RX0")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[4]}]"  % (CEP2_P[0]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[4]}]"  % (CEP2_P[1]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[4]}]"  % (CEP2_P[3]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[4]}]"  % (CEP2_P[4]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[4]}]"  % (CEP2_P[5]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[4]}]"  % (CEP2_P[6]))
# print("")

# print("#RX1")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[5]}]"  % (CEP2_P[7]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[5]}]"  % (CEP2_P[8]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[5]}]"  % (CEP2_P[9]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[5]}]"  % (CEP2_P[10]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[5]}]"  % (CEP2_P[12]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[5]}]"  % (CEP2_P[13]))
# print("")

# print("#RX2")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[6]}]"  % (CEP2_N[7]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[6]}]"  % (CEP2_N[8]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[6]}]"  % (CEP2_N[9]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[6]}]"  % (CEP2_N[10]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[6]}]"  % (CEP2_N[12]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[6]}]"  % (CEP2_N[13]))
# print("")

# print("#RX3")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[7]}]"  % (CEP2_P[14]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[7]}]"  % (CEP2_P[15]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[7]}]"  % (CEP2_P[16]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[7]}]"  % (CEP2_N[14]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[7]}]"  % (CEP2_N[15]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[7]}]"  % (CEP2_N[16]))
# print("")

# print("#TRX")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[8]}]"  % (CEP2_N[0]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[8]}]"  % (CEP2_N[1]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_RESET[8]}]"  % (CEP2_N[3]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[8]}]"  % (CEP2_N[4]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[8]}]"  % (CEP2_N[5]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[8]}]"  % (CEP2_N[6]))
# print("")

# print("### GND ###")
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_GND[0]}]"  % (CEP1_P[5]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_GND[1]}]"  % (CEP1_P[14]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_GND[2]}]"  % (CEP2_N[2]))
# print("set_property PACKAGE_PIN %-4s [get_ports {SPI_GND[3]}]"  % (CEP2_N[11]))
# print("")