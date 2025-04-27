
`timescale 1ns/1ps

module fifo(
    input                   clk,
    input                   rstn
);

wire    wr_clk, rd_clk;
wire    resetn;

wire    clk_buf;
BUFG BUFG_inst (
    .O (clk_buf),
    .I (clk)
);

clk_wiz_0 clk_wiz_inst (
    .clk_in1(clk_buf), // 25Mhz
    .clk_out1(wr_clk), // 75Mhz
    .clk_out2(rd_clk), // 100Mhz
    .reset(~rstn),
    .locked(locked)
);



reg [7:0] wcnt, rcnt;

reg  wr_rd_state;       //0-write, 1-read
always @(posedge wr_clk or negedge resetn) begin
    if (!resetn)
        wr_rd_state <= 1'b0;
    else if(wcnt == 8'd79)
        wr_rd_state <= 1'b1;
    else if(rcnt == 8'd59)
        wr_rd_state <= 1'b0;
end

always @(posedge wr_clk or negedge resetn) begin
    if (!resetn)
        wcnt <= 8'b0;
    else if(wr_rd_state == 1'b0)
        wcnt <= wcnt + 1'b1;
end







endmodule
