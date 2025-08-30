`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

interface SPIM_REGS();
    logic [23:0] spim_ctrl[0:15];
    logic [15:0] spim_ctrl_pulse;
    logic [15:0] spim_transfer;
    logic [15:0] spim_load;

    logic [7:0]  rd_data[0:15];
    logic [15:0] rd_flag;
    logic [15:0] fifo_overflow;
    logic [15:0] spi_done;

    logic [15:0] div_n;


    modport master(
        output spim_ctrl, spim_ctrl_pulse, spim_transfer, spim_load, div_n,
        input  rd_data, rd_flag, fifo_overflow, spi_done
    );

endinterface

module spim_reg (
    output  reg         [31:0]  rdata,

    input                       clk, rstb,
    input                       wren,
    input               [15:0]  offset,
    input               [31:0]  wdata,
    input               [3:0]   wstrb,

    SPIM_REGS.master            regs
);

genvar i;

generate for(i=0; i<16; i=i+1) begin : gen_spim_ctrl

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[i] <= 24'h0;
    else if(wren && (offset == 16'h0000 + i*4)) begin
        if (wstrb[2])
            regs.spim_ctrl[i][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[i][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[i][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl_pulse[i] <= 1'b0;
    else if(wren && (offset == 16'h0000 + i*4)) begin
        if (wstrb[2])
            regs.spim_ctrl_pulse[i] <= 1'b1;
        else
            regs.spim_ctrl_pulse[i] <= 1'b0;
    end else
        regs.spim_ctrl_pulse[i] <= 1'b0;
end

end : gen_spim_ctrl
endgenerate

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_transfer <= 16'h0;
    else if(wren && (offset == 16'h0040)) begin
        if (wstrb[1])
            regs.spim_transfer[15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_transfer[7:0] <= wdata[7:0];
    end else
        regs.spim_transfer <= 16'h0;
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_load <= 16'h0;
    else if(wren && (offset == 16'h0044)) begin
        if (wstrb[1])
            regs.spim_load[15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_load[7:0] <= wdata[7:0];
    end
end

// others
always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.div_n <= 16'd20;
    else if(wren && (offset == 16'h0100)) begin
        if (wstrb[1])
            regs.div_n[15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.div_n[7:0] <= wdata[7:0];
    end
end


always @(*) begin
    case(offset)
        16'h0000: rdata = {8'd0, regs.spi_done[0], regs.spim_ctrl[0][22:8], regs.rd_data[0]};
        16'h0004: rdata = {8'd0, regs.spi_done[1], regs.spim_ctrl[1][22:8], regs.rd_data[1]};
        16'h0008: rdata = {8'd0, regs.spi_done[2], regs.spim_ctrl[2][22:8], regs.rd_data[2]};
        16'h000c: rdata = {8'd0, regs.spi_done[3], regs.spim_ctrl[3][22:8], regs.rd_data[3]};
        16'h0010: rdata = {8'd0, regs.spi_done[4], regs.spim_ctrl[4][22:8], regs.rd_data[4]};
        16'h0014: rdata = {8'd0, regs.spi_done[5], regs.spim_ctrl[5][22:8], regs.rd_data[5]};
        16'h0018: rdata = {8'd0, regs.spi_done[6], regs.spim_ctrl[6][22:8], regs.rd_data[6]};
        16'h001c: rdata = {8'd0, regs.spi_done[7], regs.spim_ctrl[7][22:8], regs.rd_data[7]};
        16'h0020: rdata = {8'd0, regs.spi_done[8], regs.spim_ctrl[8][22:8], regs.rd_data[8]};
        16'h0024: rdata = {8'd0, regs.spi_done[9], regs.spim_ctrl[9][22:8], regs.rd_data[9]};
        16'h0028: rdata = {8'd0, regs.spi_done[10], regs.spim_ctrl[10][22:8], regs.rd_data[10]};
        16'h002c: rdata = {8'd0, regs.spi_done[11], regs.spim_ctrl[11][22:8], regs.rd_data[11]};
        16'h0030: rdata = {8'd0, regs.spi_done[12], regs.spim_ctrl[12][22:8], regs.rd_data[12]};
        16'h0034: rdata = {8'd0, regs.spi_done[13], regs.spim_ctrl[13][22:8], regs.rd_data[13]};
        16'h0038: rdata = {8'd0, regs.spi_done[14], regs.spim_ctrl[14][22:8], regs.rd_data[14]};
        16'h003c: rdata = {8'd0, regs.spi_done[15], regs.spim_ctrl[15][22:8], regs.rd_data[15]};
        16'h0040: rdata = {16'd0, regs.spim_transfer};
        16'h0044: rdata = {16'd0, regs.spim_load};

        16'h0100: rdata = {16'h0, regs.div_n};
        16'h0104: rdata = {regs.fifo_overflow, regs.spi_done};
        default:  rdata = 32'h0;
    endcase
end





endmodule
