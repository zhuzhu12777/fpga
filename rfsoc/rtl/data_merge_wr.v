`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module data_merge_wr(
    input                           axis_aclk, axis_rstb,
    input                           axis_aclk_out, axis_rstb_out,

    input                           axis_tready_merge,
    output                          axis_tvalid_merge,
    output                          axis_tlast_merge,
    output          [255:0]         axis_tdata_merge,

    output                          axis_tready_0,
    input                           axis_tvalid_0,
    input           [31:0]          axis_tdata_0,

    output                          axis_tready_1,
    input                           axis_tvalid_1,
    input           [31:0]          axis_tdata_1,

    output                          axis_tready_2,
    input                           axis_tvalid_2,
    input           [31:0]          axis_tdata_2,

    output                          axis_tready_3,
    input                           axis_tvalid_3,
    input           [31:0]          axis_tdata_3,

    output                          axis_tready_4,
    input                           axis_tvalid_4,
    input           [31:0]          axis_tdata_4,

    output                          axis_tready_5,
    input                           axis_tvalid_5,
    input           [31:0]          axis_tdata_5

);


// stream_0, fifo depth = 64
wire        fifo_axis_tready_0, fifo_axis_tvalid_0;
wire [31:0] fifo_axis_tdata_0;
axis_data_fifo_0 stream_fifo_0 (
  .s_axis_aresetn       (axis_rstb),            // input wire s_axis_aresetn
  .s_axis_aclk          (axis_aclk),            // input wire s_axis_aclk
  .s_axis_tvalid        (axis_tvalid_0),        // input wire s_axis_tvalid
  .s_axis_tready        (axis_tready_0),        // output wire s_axis_tready
  .s_axis_tdata         (axis_tdata_0),         // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid        (fifo_axis_tvalid_0),   // output wire m_axis_tvalid
  .m_axis_tready        (fifo_axis_tready_0),   // input wire m_axis_tready
  .m_axis_tdata         (fifo_axis_tdata_0)     // output wire [31 : 0] m_axis_tdata
);

// stream_1
wire        fifo_axis_tready_1, fifo_axis_tvalid_1;
wire [31:0] fifo_axis_tdata_1;
axis_data_fifo_0 stream_fifo_1 (
  .s_axis_aresetn       (axis_rstb),            // input wire s_axis_aresetn
  .s_axis_aclk          (axis_aclk),            // input wire s_axis_aclk
  .s_axis_tvalid        (axis_tvalid_1),        // input wire s_axis_tvalid
  .s_axis_tready        (axis_tready_1),        // output wire s_axis_tready
  .s_axis_tdata         (axis_tdata_1),         // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid        (fifo_axis_tvalid_1),   // output wire m_axis_tvalid
  .m_axis_tready        (fifo_axis_tready_1),   // input wire m_axis_tready
  .m_axis_tdata         (fifo_axis_tdata_1)     // output wire [31 : 0] m_axis_tdata
);

// stream_2
wire        fifo_axis_tready_2, fifo_axis_tvalid_2;
wire [31:0] fifo_axis_tdata_2;
axis_data_fifo_0 stream_fifo_2 (
  .s_axis_aresetn       (axis_rstb),            // input wire s_axis_aresetn
  .s_axis_aclk          (axis_aclk),            // input wire s_axis_aclk
  .s_axis_tvalid        (axis_tvalid_2),        // input wire s_axis_tvalid
  .s_axis_tready        (axis_tready_2),        // output wire s_axis_tready
  .s_axis_tdata         (axis_tdata_2),         // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid        (fifo_axis_tvalid_2),   // output wire m_axis_tvalid
  .m_axis_tready        (fifo_axis_tready_2),   // input wire m_axis_tready
  .m_axis_tdata         (fifo_axis_tdata_2)     // output wire [31 : 0] m_axis_tdata
);

// stream_3
wire        fifo_axis_tready_3, fifo_axis_tvalid_3;
wire [31:0] fifo_axis_tdata_3;
axis_data_fifo_0 stream_fifo_3 (
  .s_axis_aresetn       (axis_rstb),            // input wire s_axis_aresetn
  .s_axis_aclk          (axis_aclk),            // input wire s_axis_aclk
  .s_axis_tvalid        (axis_tvalid_3),        // input wire s_axis_tvalid
  .s_axis_tready        (axis_tready_3),        // output wire s_axis_tready
  .s_axis_tdata         (axis_tdata_3),         // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid        (fifo_axis_tvalid_3),   // output wire m_axis_tvalid
  .m_axis_tready        (fifo_axis_tready_3),   // input wire m_axis_tready
  .m_axis_tdata         (fifo_axis_tdata_3)     // output wire [31 : 0] m_axis_tdata
);

// stream_4
wire        fifo_axis_tready_4, fifo_axis_tvalid_4;
wire [31:0] fifo_axis_tdata_4;
axis_data_fifo_0 stream_fifo_4 (
  .s_axis_aresetn       (axis_rstb),            // input wire s_axis_aresetn
  .s_axis_aclk          (axis_aclk),            // input wire s_axis_aclk
  .s_axis_tvalid        (axis_tvalid_4),        // input wire s_axis_tvalid
  .s_axis_tready        (axis_tready_4),        // output wire s_axis_tready
  .s_axis_tdata         (axis_tdata_4),         // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid        (fifo_axis_tvalid_4),   // output wire m_axis_tvalid
  .m_axis_tready        (fifo_axis_tready_4),   // input wire m_axis_tready
  .m_axis_tdata         (fifo_axis_tdata_4)     // output wire [31 : 0] m_axis_tdata
);

// stream_5
wire        fifo_axis_tready_5, fifo_axis_tvalid_5;
wire [31:0] fifo_axis_tdata_5;
axis_data_fifo_0 stream_fifo_5 (
  .s_axis_aresetn       (axis_rstb),            // input wire s_axis_aresetn
  .s_axis_aclk          (axis_aclk),            // input wire s_axis_aclk
  .s_axis_tvalid        (axis_tvalid_5),        // input wire s_axis_tvalid
  .s_axis_tready        (axis_tready_5),        // output wire s_axis_tready
  .s_axis_tdata         (axis_tdata_5),         // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid        (fifo_axis_tvalid_5),   // output wire m_axis_tvalid
  .m_axis_tready        (fifo_axis_tready_5),   // input wire m_axis_tready
  .m_axis_tdata         (fifo_axis_tdata_5)     // output wire [31 : 0] m_axis_tdata
);

// axis_combiner_0
wire [5:0]      cbin_tvalid, cbin_tready;
wire [191:0]    cbin_tdata;
wire [5:0]      cbout_tvalid, cbout_tready;
wire [191:0]    cbout_tdata;
assign cbin_tvalid = {fifo_axis_tvalid_5, fifo_axis_tvalid_4, fifo_axis_tvalid_3, fifo_axis_tvalid_2, fifo_axis_tvalid_1, fifo_axis_tvalid_0};
assign cbin_tdata  = {fifo_axis_tdata_5, fifo_axis_tdata_4, fifo_axis_tdata_3, fifo_axis_tdata_2, fifo_axis_tdata_1, fifo_axis_tdata_0};
assign cbin_tready = {fifo_axis_tready_5, fifo_axis_tready_4, fifo_axis_tready_3, fifo_axis_tready_2, fifo_axis_tready_1, fifo_axis_tready_0};
axis_combiner_0 combiner_merge (
  .aclk                 (axis_aclk),            // input wire aclk
  .aresetn              (aresetn),              // input wire aresetn
  .s_axis_tvalid        (cbin_tvalid),          // input wire [5 : 0] s_axis_tvalid
  .s_axis_tready        (cbin_tready),          // output wire [5 : 0] s_axis_tready
  .s_axis_tdata         (cbin_tdata),           // input wire [191 : 0] s_axis_tdata
  .m_axis_tvalid        (cbout_tvalid),         // output wire m_axis_tvalid
  .m_axis_tready        (cbout_tready),         // input wire m_axis_tready
  .m_axis_tdata         (cbout_tdata)           // output wire [191 : 0] m_axis_tdata
);

// axis_fifo_converter instance
axis_converter axis_fifo_converter_inst (
  .axis_aclk_in       (axis_aclk),            // input wire axis_aclk_in
  .axis_rstb_in       (axis_rstb),            // input wire axis_rstb_in
  .axis_aclk_out      (axis_aclk_out),        // input wire axis_aclk_out
  .axis_rstb_out      (axis_rstb_out),        // input wire axis_rstb_out
  .axis_tready_out    (axis_tready_merge),    // input wire axis_tready_out
  .axis_tvalid_out    (axis_tvalid_merge),    // output wire axis_tvalid_out
  .axis_tdata_out     (axis_tdata_merge),     // output wire [255:0] axis_tdata_out
  .axis_tready_in     (cbout_tready),         // output wire axis_tready_in
  .axis_tvalid_in     (cbout_tvalid),         // input wire axis_tvalid_in
  .axis_tdata_in      (cbout_tdata)           // input wire [191:0] axis_tdata_in
);

// tlast
reg [7:0] counter;
localparam PACKET_LENGTH = 16;
always @(posedge axis_aclk_out or negedge axis_rstb_out) begin
    if (!axis_rstb_out) begin
        counter <= 0;
    end else begin
        if (axis_tvalid_merge && axis_tready_merge) begin
            if (counter == PACKET_LENGTH - 1) begin
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
end
assign axis_tlast_merge = (counter == PACKET_LENGTH - 1) ? 1'b1 : 1'b0;

endmodule
