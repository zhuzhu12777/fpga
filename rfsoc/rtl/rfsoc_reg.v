`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module rfsoc_reg (
    output  reg         [31:0]  rdata,
    output  reg         [31:0]  dac_start_addr,     // 0x0000
    output  reg         [31:0]  dac_cap_size,       // 0x0004
    output  reg                 dac_reset,          // 0x0008[1]  
    output  reg                 dac_start,          // 0x0008[0]

    output  reg         [31:0]  adc_start_addr,     // 0x000C
    output  reg         [31:0]  adc_cap_size,       // 0x0010
    output  reg                 adc_reset,          // 0x0014[1]
    output  reg                 adc_start,          // 0x0014[0]

    output  reg                 gty_ram_wren,       // 0x0018[12]
    output  reg         [3:0]   gty_chn,            // 0x0018[11:8]
    output  reg         [7:0]   gty_ram_addr,       // 0x0018[7:0]
    output  reg         [31:0]  gty_ram_data,       // 0x001C
    output  reg                 gty_reset,          // 0x0020[1]
    output  reg                 gty_start,          // 0x0020[0]

    input                       clk, rstb,
    input                       wren,
    input               [15:0]  offset,
    input               [31:0]  wdata,
    input               [3:0]   wstrb,

    input                       adc_cap_done
);

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        dac_start_addr <= 32'h0;
    else begin
        if (wren && (offset == 16'h0000) && wstrb[3])
            dac_start_addr[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h0000) && wstrb[2])
            dac_start_addr[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h0000) && wstrb[1])
            dac_start_addr[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h0000) && wstrb[0])
            dac_start_addr[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        dac_cap_size <= 32'h0;
    else begin
        if (wren && (offset == 16'h0004) && wstrb[3])
            dac_cap_size[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h0004) && wstrb[2])
            dac_cap_size[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h0004) && wstrb[1])
            dac_cap_size[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h0004) && wstrb[0])
            dac_cap_size[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        dac_reset <= 1'b0;
        dac_start <= 1'b0;
    end else begin
        if (wren && (offset == 16'h0008) && wstrb[0])
            dac_reset <= wdata[1];
            dac_start <= wdata[0];
    end
end

// adc
always @(posedge clk or negedge rstb) begin
    if(!rstb)
        adc_start_addr <= 32'h0;
    else begin
        if (wren && (offset == 16'h000C) && wstrb[3])
            adc_start_addr[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h000C) && wstrb[2])
            adc_start_addr[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h000C) && wstrb[1])
            adc_start_addr[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h000C) && wstrb[0])
            adc_start_addr[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        adc_cap_size <= 32'h0;
    else begin
        if (wren && (offset == 16'h0010) && wstrb[3])
            adc_cap_size[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h0010) && wstrb[2])
            adc_cap_size[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h0010) && wstrb[1])
            adc_cap_size[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h0010) && wstrb[0])
            adc_cap_size[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        adc_reset <= 1'b0;
        adc_start <= 1'b0;
    end else begin
        if (wren && (offset == 16'h0014) && wstrb[0])
            adc_reset <= wdata[1];
            adc_start <= wdata[0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        gty_ram_wren <= 1'b0;
        gty_chn <= 4'h0;
        gty_ram_addr <= 8'h0;
    end else begin
        if (wren && (offset == 16'h0018) && wstrb[3])
            gty_ram_wren <= wdata[12];
            gty_chn <= wdata[11:8];
            gty_ram_addr <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        gty_ram_data <= 32'h0;
    else begin
        if (wren && (offset == 16'h001C) && wstrb[3])
            gty_ram_data[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h001C) && wstrb[2])
            gty_ram_data[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h001C) && wstrb[1])
            gty_ram_data[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h001C) && wstrb[0])
            gty_ram_data[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        gty_reset <= 1'b0;
        gty_start <= 1'b0;
    end else begin
        if (wren && (offset == 16'h0020) && wstrb[0])
            gty_reset <= wdata[1];
            gty_start <= wdata[0];
    end
end

always @(*) begin
    case(offset)
        16'h0000: rdata = dac_start_addr;
        16'h0004: rdata = dac_cap_size;
        16'h0008: rdata = {30'd0, dac_reset, dac_start};
        16'h000C: rdata = adc_start_addr;
        16'h0010: rdata = adc_cap_size;
        16'h0014: rdata = {23'd0, adc_cap_done, 6'd0, adc_reset, adc_start};
        16'h0018: rdata = {28'd0, gty_ram_wren, gty_chn, gty_ram_addr};
        16'h001C: rdata = gty_ram_data;
        16'h0020: rdata = {30'd0, gty_reset, gty_start};
        default:  rdata = 32'h0;
    endcase
end



endmodule
