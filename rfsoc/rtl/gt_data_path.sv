`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// axilite registers to sram to gt path

module gt_data_path(
    input                           axilite_clk, axilite_rstb,  // axilite registers clock, 100MHz
    input                           gt_clk, gt_rstb,            // gt clock, 187.5MHz

    input               [7:0]       ram_addr,
    input              [31:0]       ram_data,
    input                           ram_we,
    input               [3:0]       ram_idx,

    input                           reg_start,       // axilite clock
    input                           reg_reset,

    // gt stream output
    output            [191:0]       gt_data
);

wire [5:0] gt_ram_we;

assign gt_ram_we[0] = ram_we && (ram_idx == 4'h0);
assign gt_ram_we[1] = ram_we && (ram_idx == 4'h1);
assign gt_ram_we[2] = ram_we && (ram_idx == 4'h2);
assign gt_ram_we[3] = ram_we && (ram_idx == 4'h3);
assign gt_ram_we[4] = ram_we && (ram_idx == 4'h4);
assign gt_ram_we[5] = ram_we && (ram_idx == 4'h5);

reg  [7:0]  gt_addr;
wire [31:0] gt_data_out_0, gt_data_out_1, gt_data_out_2, gt_data_out_3, gt_data_out_4, gt_data_out_5;

// sdpram * 6
blk_mem_gen_gt blk_mem_gen_gt0 (
    .clka               (axilite_clk),      // input wire clka
    .wea                (gt_ram_we[0]),     // input wire [0 : 0] wea
    .addra              (ram_addr),         // input wire [7 : 0] addra
    .dina               (ram_data),         // input wire [31 : 0] dina
    .clkb               (gt_clk),           // input wire clkb
    .addrb              (gt_addr),          // input wire [7 : 0] addrb
    .doutb              (gt_data_out_0)     // output wire [31 : 0] doutb
);

blk_mem_gen_gt blk_mem_gen_gt1 (
    .clka               (axilite_clk),      // input wire clka
    .wea                (gt_ram_we[1]),     // input wire [0 : 0] wea
    .addra              (ram_addr),         // input wire [7 : 0] addra
    .dina               (ram_data),         // input wire [31 : 0] dina
    .clkb               (gt_clk),           // input wire clkb
    .addrb              (gt_addr),          // input wire [7 : 0] addrb
    .doutb              (gt_data_out_1)     // output wire [31 : 0] doutb
);

blk_mem_gen_gt blk_mem_gen_gt2 (
    .clka               (axilite_clk),      // input wire clka
    .wea                (gt_ram_we[2]),     // input wire [0 : 0] wea
    .addra              (ram_addr),         // input wire [7 : 0] addra
    .dina               (ram_data),         // input wire [31 : 0] dina
    .clkb               (gt_clk),           // input wire clkb
    .addrb              (gt_addr),          // input wire [7 : 0] addrb
    .doutb              (gt_data_out_2)     // output wire [31 : 0] doutb
);

blk_mem_gen_gt blk_mem_gen_gt3 (
    .clka               (axilite_clk),      // input wire clka
    .wea                (gt_ram_we[3]),     // input wire [0 : 0] wea
    .addra              (ram_addr),         // input wire [7 : 0] addra
    .dina               (ram_data),         // input wire [31 : 0] dina
    .clkb               (gt_clk),           // input wire clkb
    .addrb              (gt_addr),          // input wire [7 : 0] addrb
    .doutb              (gt_data_out_3)     // output wire [31 : 0] doutb
);

blk_mem_gen_gt blk_mem_gen_gt4 (
    .clka               (axilite_clk),      // input wire clka
    .wea                (gt_ram_we[4]),     // input wire [0 : 0] wea
    .addra              (ram_addr),         // input wire [7 : 0] addra
    .dina               (ram_data),         // input wire [31 : 0] dina
    .clkb               (gt_clk),           // input wire clkb
    .addrb              (gt_addr),          // input wire [7 : 0] addrb
    .doutb              (gt_data_out_4)     // output wire [31 : 0] doutb
);

blk_mem_gen_gt blk_mem_gen_gt5 (
    .clka               (axilite_clk),      // input wire clka
    .wea                (gt_ram_we[5]),     // input wire [0 : 0] wea
    .addra              (ram_addr),         // input wire [7 : 0] addra
    .dina               (ram_data),         // input wire [31 : 0] dina
    .clkb               (gt_clk),           // input wire clkb
    .addrb              (gt_addr),          // input wire [7 : 0] addrb
    .doutb              (gt_data_out_5)     // output wire [31 : 0] doutb
);

reg [7:0] ram_addr_max;     // save max address
always @(posedge axilite_clk or negedge axilite_rstb) begin
    if(!axilite_rstb)
        ram_addr_max <= 8'h0;
    else if(reg_reset)
        ram_addr_max <= 8'h0;
    else if(ram_we && (ram_addr > ram_addr_max))
        ram_addr_max <= ram_addr;
end

// gt_start
wire gt_start;      // gt_clk domain start signal
wire gt_reset;      // gt_clk domain reset signal
xpm_cdc_single #(
    .DEST_SYNC_FF(2),   // 同步寄存器级数，通常2-4
    .INIT_SYNC_FF(0),   // 0=禁用初始同步，1=启用
    .SIM_ASSERT_CHK(0), // 0=禁用仿真检查，1=启用
    .SRC_INPUT_REG(1)   // 0=无输入寄存器，1=有输入寄存器
) gt_start_sync (
    .src_clk            (axilite_clk),      // 源时钟 (可选，如果SRC_INPUT_REG=1)
    .src_in             (reg_start),        // 输入信号
    .dest_clk           (gt_clk),           // 目标时钟
    .dest_out           (gt_start)          // 同步后的输出信号
);

xpm_cdc_single #(
    .DEST_SYNC_FF(2),   // 同步寄存器级数，通常2-4
    .INIT_SYNC_FF(0),   // 0=禁用初始同步，1=启用
    .SIM_ASSERT_CHK(0), // 0=禁用仿真检查，1=启用
    .SRC_INPUT_REG(1)   // 0=无输入寄存器，1=有输入寄存器
) gt_reset_sync (
    .src_clk            (axilite_clk),      // 源时钟 (可选，如果SRC_INPUT_REG=1)
    .src_in             (reg_reset),        // 输入信号
    .dest_clk           (gt_clk),           // 目标时钟
    .dest_out           (gt_reset)          // 同步后的输出信号
);

// gt_addr
always @(posedge gt_clk or negedge gt_rstb) begin
    if(!gt_rstb)
        gt_addr <= 8'h0;
    else if(gt_reset)
        gt_addr <= 8'h0;
    else if(gt_start)
        gt_addr <= gt_addr < ram_addr_max ? gt_addr + 1'b1 : 8'h0;
end

assign gt_data = {gt_data_out_5, gt_data_out_4, gt_data_out_3, gt_data_out_2, gt_data_out_1, gt_data_out_0};

endmodule
