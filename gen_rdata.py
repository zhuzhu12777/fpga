


print('''
always @(*) begin
    case(offset)''');

for i in range(16):
    print("        16'h%04x: rdata = {8'd0, regs.rx_status[%0d], regs.spim_ctrl[%0d][22:8], regs.rx_data[%0d]};" % (i*4, i, i, i))

print('''        default:  rdata = 32'h0;
    endcase
end''')

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

