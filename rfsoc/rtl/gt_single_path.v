`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// axilite registers to sram to gt path

module gt_signle_path(
    input                           ps_clk, ps_rstb,         // registers clock
    input                           gt_clk, gt_rstb,         // gt clock

    input               [7:0]       ram_addr,
    input              [31:0]       ram_data,
    input                           ram_we,
    // input               [2:0]       ram_idx,
    input               [7:0]       gt_cap,

    input                           gt_start,
    input                           gt_reset,

    output             [31:0]       gt_tdata,
    output                          gt_tvalid,
    input                           gt_tready
);

reg  [7:0]  gt_addr;
wire [31:0] gt_dout;

blk_mem_gen_0 u_gt_sdpram (
    .clka           (ps_clk),       // input wire clka
    .wea            (ram_we),       // input wire [0 : 0] wea
    .addra          (ram_addr),     // input wire [7 : 0] addra
    .dina           (ram_data),     // input wire [31 : 0] dina
    .clkb           (gt_clk),       // input wire clkb
    .addrb          (gt_addr),      // input wire [7 : 0] addrb
    .doutb          (gt_dout)       // output wire [31 : 0] doutb
);

always @(posedge gt_clk or negedge gt_rstb) begin
    if(!gt_rstb)
        gt_addr <= 8'h0;
    else if (gt_reset)
        gt_addr <= 8'h0;
    else if(gt_start && gt_tready && gt_tvalid)
        gt_addr <= gt_addr < gt_cap? gt_addr + 1 : 0;
end

assign gt_tvalid = gt_start;
assign gt_tdata = gt_dout;


endmodule
