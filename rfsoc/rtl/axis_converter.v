
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// axis_aclk_in : axis_aclk_out = 4 : 3

module axis_converter(
    input                           axis_aclk_in, axis_rstb_in,
    input                           axis_aclk_out, axis_rstb_out,

    input                           axis_tready_out,
    output                          axis_tvalid_out,
    output          [255:0]         axis_tdata_out,

    output                          axis_tready_in,
    input                           axis_tvalid_in,
    input           [191:0]         axis_tdata_in
);

localparam WR0 = 2'b00;
localparam WR1 = 2'b01;
localparam WR2 = 2'b10;
localparam WR3 = 2'b11;

reg [1:0] state, next_state;

always @(posedge axis_aclk_in or negedge axis_rstb_in) begin
    if(!axis_rstb_in)
        state <= WR0;
    else
        state <= next_state;
end

always @(*) begin
    next_state = state;
    case(state)
        WR0:
            if(axis_tvalid_in && axis_tready_in)
                next_state = WR1;
        WR1:
            if(axis_tvalid_in && axis_tready_in)
                next_state = WR2;
        WR2:
            if(axis_tvalid_in && axis_tready_in)
                next_state = WR3;
        WR3:
            if(axis_tvalid_in && axis_tready_in)
                next_state = WR0;
    endcase
end

reg [191:0] axis_tdata_in_1d;
always @(posedge axis_aclk_in or negedge axis_rstb_in) begin
    if(!axis_rstb_in)
        axis_tdata_in_1d <= 0;
    else
        axis_tdata_in_1d <= axis_tdata_in;
end

wire fifo_push = (state == WR1) || (state == WR2) || (state == WR3);
reg  [255:0] fifo_wrdata;
always@(*) begin
    case(state)
        WR1: fifo_wrdata = {axis_tdata_in[63:0], axis_tdata_in_1d};
        WR2: fifo_wrdata = {axis_tdata_in[127:0], axis_tdata_in_1d[191:64]};
        WR3: fifo_wrdata = {axis_tdata_in[191:0], axis_tdata_in_1d[191:128]};
    endcase
end

wire fifo_full, fifo_empty;
wire fifo_pop = axis_tready_out && axis_tvalid_out;
wire [255:0] fifo_rddata;

// replace with your FIFO implementation, depth = 128
async_fifo_generator_0 async_fifo (
    .wr_clk             (axis_aclk_in),     // input wire wr_clk
    .wr_rst             (axis_rstb_in),     // input wire wr_rst
    .rd_clk             (axis_aclk_out),    // input wire rd_clk
    .rd_rst             (axis_rstb_out),    // input wire rd_rst
    .din                (fifo_wrdata),      // input wire [255 : 0] din
    .wr_en              (fifo_push),        // input wire wr_en
    .rd_en              (fifo_pop),         // input wire rd_en
    .dout               (fifo_rddata),      // output wire [255 : 0] dout
    .full               (fifo_full),        // output wire full
    .empty              (fifo_empty)        // output wire empty
);

assign axis_tready_in = !fifo_full;
assign axis_tvalid_out = !fifo_empty;
assign axis_tdata_out = fifo_rddata;

endmodule
