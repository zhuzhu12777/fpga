`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
    // output  reg         [31:0]  dac_start_addr,     // 0x0000
    // output  reg         [31:0]  dac_cap_size,       // 0x0004
    // output  reg                 dac_reset,          // 0x0008[1]  
    // output  reg                 dac_start,          // 0x0008[0]

    // output  reg         [31:0]  adc_start_addr,     // 0x000C
    // output  reg         [31:0]  adc_cap_size,       // 0x0010
    // output  reg                 adc_reset,          // 0x0014[1]
    // output  reg                 adc_start,          // 0x0014[0]

    // output  reg                 gty_ram_wren,       // 0x0018[12]
    // output  reg         [3:0]   gty_chn,            // 0x0018[11:8]
    // output  reg         [7:0]   gty_ram_addr,       // 0x0018[7:0]
    // output  reg         [31:0]  gty_ram_data,       // 0x001C
    // output  reg                 gty_reset,          // 0x0020[1]
    // output  reg                 gty_start,          // 0x0020[0]

module rfsoc_reg (
    output  reg         [31:0]  rdata,


    input                       clk, rstb,
    input                       wren,
    input               [15:0]  offset,
    input               [31:0]  wdata,
    input               [3:0]   wstrb,

    RFSOC_REG.master           regs
);

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.dac_start_addr <= 32'h0;
    else begin
        if (wren && (offset == 16'h0000) && wstrb[3])
            regs.dac_start_addr[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h0000) && wstrb[2])
            regs.dac_start_addr[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h0000) && wstrb[1])
            regs.dac_start_addr[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h0000) && wstrb[0])
            regs.dac_start_addr[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.dac_cap_size <= 32'h0;
    else begin
        if (wren && (offset == 16'h0004) && wstrb[3])
            regs.dac_cap_size[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h0004) && wstrb[2])
            regs.dac_cap_size[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h0004) && wstrb[1])
            regs.dac_cap_size[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h0004) && wstrb[0])
            regs.dac_cap_size[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        regs.dac_reset <= 1'b0;
        regs.dac_start <= 1'b0;
    end else begin
        if (wren && (offset == 16'h0008) && wstrb[0]) begin
            regs.dac_reset <= wdata[1];
            regs.dac_start <= wdata[0];
        end
    end
end

// adc
always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.adc_start_addr <= 32'h0;
    else begin
        if (wren && (offset == 16'h000C) && wstrb[3])
            regs.adc_start_addr[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h000C) && wstrb[2])
            regs.adc_start_addr[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h000C) && wstrb[1])
            regs.adc_start_addr[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h000C) && wstrb[0])
            regs.adc_start_addr[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.adc_cap_size <= 32'h0;
    else begin
        if (wren && (offset == 16'h0010) && wstrb[3])
            regs.adc_cap_size[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h0010) && wstrb[2])
            regs.adc_cap_size[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h0010) && wstrb[1])
            regs.adc_cap_size[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h0010) && wstrb[0])
            regs.adc_cap_size[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        regs.adc_reset <= 1'b0;
        regs.adc_start <= 1'b0;
    end else begin
        if (wren && (offset == 16'h0014) && wstrb[0]) begin
            regs.adc_reset <= wdata[1];
            regs.adc_start <= wdata[0];
        end
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        regs.gty_ram_wren <= 1'b0;
        regs.gty_chn <= 4'h0;
        regs.gty_ram_addr <= 8'h0;
    end else begin
        if (wren && (offset == 16'h0018) && wstrb[1]) begin
            regs.gty_ram_wren <= wdata[12];
            regs.gty_chn <= wdata[11:8];
        end else
            regs.gty_ram_wren <= 1'b0;
        if (wren && (offset == 16'h0018) && wstrb[0])
            regs.gty_ram_addr <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb)
        regs.gty_ram_data <= 32'h0;
    else begin
        if (wren && (offset == 16'h001C) && wstrb[3])
            regs.gty_ram_data[31:24] <= wdata[31:24];
        if (wren && (offset == 16'h001C) && wstrb[2])
            regs.gty_ram_data[23:16] <= wdata[23:16];
        if (wren && (offset == 16'h001C) && wstrb[1])
            regs.gty_ram_data[15:8] <= wdata[15:8];
        if (wren && (offset == 16'h001C) && wstrb[0])
            regs.gty_ram_data[7:0] <= wdata[7:0];
    end
end

always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        regs.gty_reset <= 1'b0;
        regs.gty_start <= 1'b0;
    end else begin
        if (wren && (offset == 16'h0020) && wstrb[0]) begin
            regs.gty_reset <= wdata[1];
            regs.gty_start <= wdata[0];
        end
    end
end

// interrupt
reg [1:0] irq_enable;
always @(posedge clk or negedge rstb) begin
    if(!rstb)
        irq_enable <= 2'h0;
    else if (wren && (offset == 16'h0114) && wstrb[0]) begin
        irq_enable <= wdata[1:0];
    end
end

reg     irq_dm_status, irq_rf_status;
wire    irq_dm_clear = wren && (offset == 16'h0114) && wdata[8] && wstrb[1];
wire    irq_rf_clear = wren && (offset == 16'h0114) && wdata[9] && wstrb[1];
always@(posedge clk or negedge rstb) begin
    if(!rstb)
        irq_dm_status <= 1'b0;
    else if (irq_dm_clear)
        irq_dm_status <= 1'b0;
    else if (regs.dac_read_mm2s_err || regs.adc_wr_mm2s_err)
        irq_dm_status <= 1'b1;
end

always@(posedge clk or negedge rstb) begin
    if(!rstb)
        irq_rf_status <= 1'b0;
    else if (irq_rf_clear)
        irq_rf_status <= 1'b0;
    else if (regs.rf_irq)
        irq_rf_status <= 1'b1;
end

assign regs.rf_int = (irq_enable[0] && irq_dm_status) || (irq_enable[1] && irq_rf_status);

always @(*) begin
    case(offset)
        16'h0000: rdata = regs.dac_start_addr;
        16'h0004: rdata = regs.dac_cap_size;
        16'h0008: rdata = {30'd0, regs.dac_reset, regs.dac_start};
        16'h000C: rdata = regs.adc_start_addr;
        16'h0010: rdata = regs.adc_cap_size;
        16'h0014: rdata = {23'd0, regs.adc_cap_done, 6'd0, regs.adc_reset, regs.adc_start};
        16'h0018: rdata = {28'd0, regs.gty_ram_wren, regs.gty_chn, regs.gty_ram_addr};
        16'h001C: rdata = regs.gty_ram_data;
        16'h0020: rdata = {30'd0, regs.gty_reset, regs.gty_start};

        // RO
        16'h0100: rdata = {15'd0, regs.dac_read_mm2s_err, regs.dac_run_cycles, regs.dac_datamover_status};
        16'h0104: rdata = regs.dac_current_addr;
        16'h0108: rdata = {15'd0, regs.adc_wr_mm2s_err, regs.adc_run_cycles, regs.adc_datamover_status};
        16'h010C: rdata = regs.adc_current_addr;
        16'h0110: rdata = {30'd0, regs.c0_init_calib_complete, regs.gt_powergood};
        16'h0114: rdata = {22'd0, irq_rf_status, irq_dm_status, 6'd0, irq_enable};

        default:  rdata = 32'h0;
    endcase
end



endmodule
