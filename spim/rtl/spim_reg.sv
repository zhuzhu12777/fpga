`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module spim_reg (
    output  reg         [31:0]  rdata,

    input                       clk, rstb,
    input                       wren,
    input               [15:0]  offset,
    input               [31:0]  wdata,
    input               [3:0]   wstrb,

    SPIM_REGS.master            regs
);

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[0] <= 24'h0;
    else if(wren && (offset == 16'h0000)) begin
        if (wstrb[2])
            regs.spim_ctrl[0][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[0][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[0][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[1] <= 24'h0;
    else if(wren && (offset == 16'h0004)) begin
        if (wstrb[2])
            regs.spim_ctrl[1][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[1][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[1][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[2] <= 24'h0;
    else if(wren && (offset == 16'h0008)) begin
        if (wstrb[2])
            regs.spim_ctrl[2][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[2][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[2][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[3] <= 24'h0;
    else if(wren && (offset == 16'h000c)) begin
        if (wstrb[2])
            regs.spim_ctrl[3][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[3][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[3][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[4] <= 24'h0;
    else if(wren && (offset == 16'h0010)) begin
        if (wstrb[2])
            regs.spim_ctrl[4][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[4][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[4][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[5] <= 24'h0;
    else if(wren && (offset == 16'h0014)) begin
        if (wstrb[2])
            regs.spim_ctrl[5][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[5][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[5][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[6] <= 24'h0;
    else if(wren && (offset == 16'h0018)) begin
        if (wstrb[2])
            regs.spim_ctrl[6][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[6][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[6][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[7] <= 24'h0;
    else if(wren && (offset == 16'h001c)) begin
        if (wstrb[2])
            regs.spim_ctrl[7][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[7][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[7][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[8] <= 24'h0;
    else if(wren && (offset == 16'h0020)) begin
        if (wstrb[2])
            regs.spim_ctrl[8][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[8][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[8][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[9] <= 24'h0;
    else if(wren && (offset == 16'h0024)) begin
        if (wstrb[2])
            regs.spim_ctrl[9][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[9][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[9][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[10] <= 24'h0;
    else if(wren && (offset == 16'h0028)) begin
        if (wstrb[2])
            regs.spim_ctrl[10][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[10][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[10][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[11] <= 24'h0;
    else if(wren && (offset == 16'h002c)) begin
        if (wstrb[2])
            regs.spim_ctrl[11][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[11][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[11][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[12] <= 24'h0;
    else if(wren && (offset == 16'h0030)) begin
        if (wstrb[2])
            regs.spim_ctrl[12][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[12][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[12][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[13] <= 24'h0;
    else if(wren && (offset == 16'h0034)) begin
        if (wstrb[2])
            regs.spim_ctrl[13][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[13][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[13][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[14] <= 24'h0;
    else if(wren && (offset == 16'h0038)) begin
        if (wstrb[2])
            regs.spim_ctrl[14][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[14][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[14][7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.spim_ctrl[15] <= 24'h0;
    else if(wren && (offset == 16'h003c)) begin
        if (wstrb[2])
            regs.spim_ctrl[15][23:16] <= wdata[23:16];
        if (wstrb[1])
            regs.spim_ctrl[15][15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.spim_ctrl[15][7:0] <= wdata[7:0];
    end
end

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
        regs.div_n <= 16'd40;
    else if(wren && (offset == 16'h0100)) begin
        if (wstrb[1])
            regs.div_n[15:8] <= wdata[15:8];
        if (wstrb[0])
            regs.div_n[7:0] <= wdata[7:0];
    end
end


always @(*) begin
    case(offset)
        16'h0000: rdata = {8'd0, regs.rx_status[0], regs.spim_ctrl[0][22:8], regs.rx_data[0]};
        16'h0004: rdata = {8'd0, regs.rx_status[1], regs.spim_ctrl[1][22:8], regs.rx_data[1]};
        16'h0008: rdata = {8'd0, regs.rx_status[2], regs.spim_ctrl[2][22:8], regs.rx_data[2]};
        16'h000c: rdata = {8'd0, regs.rx_status[3], regs.spim_ctrl[3][22:8], regs.rx_data[3]};
        16'h0010: rdata = {8'd0, regs.rx_status[4], regs.spim_ctrl[4][22:8], regs.rx_data[4]};
        16'h0014: rdata = {8'd0, regs.rx_status[5], regs.spim_ctrl[5][22:8], regs.rx_data[5]};
        16'h0018: rdata = {8'd0, regs.rx_status[6], regs.spim_ctrl[6][22:8], regs.rx_data[6]};
        16'h001c: rdata = {8'd0, regs.rx_status[7], regs.spim_ctrl[7][22:8], regs.rx_data[7]};
        16'h0020: rdata = {8'd0, regs.rx_status[8], regs.spim_ctrl[8][22:8], regs.rx_data[8]};
        16'h0024: rdata = {8'd0, regs.rx_status[9], regs.spim_ctrl[9][22:8], regs.rx_data[9]};
        16'h0028: rdata = {8'd0, regs.rx_status[10], regs.spim_ctrl[10][22:8], regs.rx_data[10]};
        16'h002c: rdata = {8'd0, regs.rx_status[11], regs.spim_ctrl[11][22:8], regs.rx_data[11]};
        16'h0030: rdata = {8'd0, regs.rx_status[12], regs.spim_ctrl[12][22:8], regs.rx_data[12]};
        16'h0034: rdata = {8'd0, regs.rx_status[13], regs.spim_ctrl[13][22:8], regs.rx_data[13]};
        16'h0038: rdata = {8'd0, regs.rx_status[14], regs.spim_ctrl[14][22:8], regs.rx_data[14]};
        16'h003c: rdata = {8'd0, regs.rx_status[15], regs.spim_ctrl[15][22:8], regs.rx_data[15]};
        16'h0040: rdata = {16'd0, regs.spim_transfer};
        16'h0044: rdata = {16'd0, regs.spim_load};

        16'h0100: rdata = {16'h0, regs.div_n};
        default:  rdata = 32'h0;
    endcase
end





endmodule
