`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

interface SPIM_REGS();
    logic [55:0] spim_ctrl[0:8];
    logic [8:0]  spim_ctrl_pulse;
    logic [8:0]  spim_transfer;
    logic [8:0]  spim_load;
    logic [8:0]  spim_reset;

    logic [15:0] rd_data[0:8];
    logic [8:0]  rd_flag;
    logic [8:0]  fifo_overflow;
    logic [8:0]  spi_done;

    logic [15:0] div_n;


    modport master(
        output spim_ctrl, spim_ctrl_pulse, spim_transfer, spim_load, spim_reset, div_n,
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

generate for(i=0; i<9; i=i+1) begin : gen_spim_ctrl

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[i] <= 56'h0;
    else if(wren && (offset == 16'h0000 + i*8)) begin
        if (wstrb[3])
            regs.spim_ctrl[i][31:24] <= wdata[31:24];
        if (wstrb[2])
            regs.spim_ctrl[i][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[i][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[i][7:0] <= wdata[7:0];
    end else if(wren && (offset == 16'h0000 + i*8 + 4)) begin
        if (wstrb[2])
            regs.spim_ctrl[i][55:48] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[i][47:40] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[i][39:32] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl_pulse[i] <= 1'b0;
    else if(wren && (offset == 16'h0000 + i*8 + 4)) begin
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
        regs.spim_transfer <= 9'h0;
    else if(wren && (offset == 16'h0048)) begin
        if (wstrb[1])
            regs.spim_transfer[8] <= wdata[8];
        if (wstrb[0])
            regs.spim_transfer[7:0] <= wdata[7:0];
    end else
        regs.spim_transfer <= 9'h0;
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_load <= 9'h0;
    else if(wren && (offset == 16'h004c)) begin
        if (wstrb[1])
            regs.spim_load[8] <= wdata[8];
        if (wstrb[0])
            regs.spim_load[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_reset <= 9'h0;
    else if(wren && (offset == 16'h0050)) begin
        if (wstrb[1])
            regs.spim_reset[8] <= wdata[8];
        if (wstrb[0])
            regs.spim_reset[7:0] <= wdata[7:0];
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
        16'h0000: rdata = {regs.spim_ctrl[0][31:16], regs.rd_data[0]};
        16'h0004: rdata = {8'd0, regs.spi_done[0], regs.spim_ctrl[0][54:32]};
        16'h0008: rdata = {regs.spim_ctrl[1][31:16], regs.rd_data[1]};
        16'h000c: rdata = {8'd0, regs.spi_done[1], regs.spim_ctrl[1][54:32]};
        16'h0010: rdata = {regs.spim_ctrl[2][31:16], regs.rd_data[2]};
        16'h0014: rdata = {8'd0, regs.spi_done[2], regs.spim_ctrl[2][54:32]};
        16'h0018: rdata = {regs.spim_ctrl[3][31:16], regs.rd_data[3]};
        16'h001c: rdata = {8'd0, regs.spi_done[3], regs.spim_ctrl[3][54:32]};
        16'h0020: rdata = {regs.spim_ctrl[4][31:16], regs.rd_data[4]};
        16'h0024: rdata = {8'd0, regs.spi_done[4], regs.spim_ctrl[4][54:32]};
        16'h0028: rdata = {regs.spim_ctrl[5][31:16], regs.rd_data[5]};
        16'h002c: rdata = {8'd0, regs.spi_done[5], regs.spim_ctrl[5][54:32]};
        16'h0030: rdata = {regs.spim_ctrl[6][31:16], regs.rd_data[6]};
        16'h0034: rdata = {8'd0, regs.spi_done[6], regs.spim_ctrl[6][54:32]};
        16'h0038: rdata = {regs.spim_ctrl[7][31:16], regs.rd_data[7]};
        16'h003c: rdata = {8'd0, regs.spi_done[7], regs.spim_ctrl[7][54:32]};
        16'h0040: rdata = {regs.spim_ctrl[8][31:16], regs.rd_data[8]};
        16'h0044: rdata = {8'd0, regs.spi_done[8], regs.spim_ctrl[8][54:32]};
        16'h0048: rdata = {23'd0, regs.spim_transfer};
        16'h004c: rdata = {23'd0, regs.spim_load};
        16'h0050: rdata = {23'd0, regs.spim_reset};

        16'h0100: rdata = {16'h0, regs.div_n};
        16'h0104: rdata = {7'd0, regs.fifo_overflow, 7'd0, regs.spi_done};
        default:  rdata = 32'h0;
    endcase
end





endmodule
