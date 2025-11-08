


# print('''
# always @(*) begin
#     case(offset)''');

# for i in range(9):
#     print("        16'h%04x: rdata = {regs.spim_ctrl[%0d][31:16], regs.rd_data[%0d]};" % (i*8+0, i, i))
#     print("        16'h%04x: rdata = {8'd0, regs.spi_done[%0d], regs.spim_ctrl[%0d][54:32]};" % (i*8+4, i, i))

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

CEP1_P = ["H19", "G15", "C17", "D18", "B19", "D22", "F21", "G17", "A16", "C15", "B16", \
          "D20", "E21", "E19", "G20", "G19", "F18", "D16", "A21", "A18", "F16", "E15", "B21", "H22"]
CEP1_N = ["H20", "G16", "C18", "C19", "B20", "C22", "F22", "F17", "A17", "B15", "B17", \
          "C20", "D21", "E20", "G21", "F19", "E18", "D17", "A22", "A19", "E16", "D15", "B22", "G22"]
CEP2_P = ["V12", "AA12", "Y9", "AA11", "Y11", "AB10", "AA9", "AA7", "Y6", "AB5", "W6", \
          "Y4", "V5", "T4", "AB2", "AB7", "R6", "U6", "V7", "V8", "V10", "U10", "W11", "U12"]
CEP2_N = ["W12", "AB12", "Y8", "AB11", "Y10", "AB9", "AA8", "AA6", "Y5", "AB4", "W5", \
          "AA4", "V4", "U4", "AB1", "AB6", "T6", "U5", "W7", "W8", "V9", "U9", "W10", "U11"]

assert len(CEP1_P) == 24
assert len(CEP1_N) == 24
assert len(CEP2_P) == 24
assert len(CEP2_N) == 24

CEP = [CEP1_P, CEP1_N, CEP2_P, CEP2_N]

for i in range(4):
    for j in range(4):
        print("set_property PACKAGE_PIN %-4s [get_ports {SPI_SCK[%0d]}]"  % (CEP[i][5*j+0], 4*i+j))
        print("set_property PACKAGE_PIN %-4s [get_ports {SPI_CSN[%0d]}]"  % (CEP[i][5*j+1], 4*i+j))
        print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MISO[%0d]}]" % (CEP[i][5*j+2], 4*i+j))
        print("set_property PACKAGE_PIN %-4s [get_ports {SPI_MOSI[%0d]}]" % (CEP[i][5*j+3], 4*i+j))
        print("set_property PACKAGE_PIN %-4s [get_ports {SPI_LOAD[%0d]}]" % (CEP[i][5*j+4], 4*i+j))


