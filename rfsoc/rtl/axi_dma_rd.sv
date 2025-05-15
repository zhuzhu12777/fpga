`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module axi_dma_rd(

    // clock & reset
    input                           axi_aclk, axi_rstb,         // axi & axis clock, 500MHz
    input                           axilite_clk, axilite_rstb,  // axis status clock, 100MHz

    // axi4 mastaer read
    AXI4.master                     m_axi,

    // axis
    STREAM.master                   m_axis,     //256b

    // status
    output reg            [7:0]     datamover_status,
    output reg           [31:0]     current_addr,
    output reg            [7:0]     run_cycles,
    output                          rd_mm2s_err,

    // regs
    input                           read_start,
    input                           read_reset,
    input                [31:0]     start_address,
    input                [31:0]     cap_size

);

// axis cmd and status
wire                            s_axis_cmd_tvalid;
wire                            s_axis_cmd_tready;
wire               [71:0]       s_axis_cmd_tdata;
wire                            m_axis_sts_tvalid;
wire                            m_axis_sts_tready;
wire                [7:0]       m_axis_sts_tdata;
wire                [0:0]       m_axis_sts_tkeep;
wire                            m_axis_sts_tlast;

axi_datamover_rd u_axi_datamover_rd (
  .m_axi_mm2s_aclk              (axi_aclk),                     // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn           (axi_rstb),                     // input wire m_axi_mm2s_aresetn
  .mm2s_err                     (rd_mm2s_err),                  // output wire mm2s_err
  .m_axis_mm2s_cmdsts_aclk      (axilite_clk),                  // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn   (axilite_rstb),                 // input wire m_axis_mm2s_cmdsts_aresetn
  .s_axis_mm2s_cmd_tvalid       (s_axis_cmd_tvalid),            // input wire s_axis_mm2s_cmd_tvalid
  .s_axis_mm2s_cmd_tready       (s_axis_cmd_tready),            // output wire s_axis_mm2s_cmd_tready
  .s_axis_mm2s_cmd_tdata        (s_axis_cmd_tdata),             // input wire [71 : 0] s_axis_mm2s_cmd_tdata
  .m_axis_mm2s_sts_tvalid       (m_axis_sts_tvalid),            // output wire m_axis_mm2s_sts_tvalid
  .m_axis_mm2s_sts_tready       (m_axis_sts_tready),            // input wire m_axis_mm2s_sts_tready
  .m_axis_mm2s_sts_tdata        (m_axis_sts_tdata),             // output wire [7 : 0] m_axis_mm2s_sts_tdata
  .m_axis_mm2s_sts_tkeep        (m_axis_sts_tkeep),             // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast        (m_axis_sts_tlast),             // output wire m_axis_mm2s_sts_tlast
  .m_axi_mm2s_arid              (m_axi.arid),                     // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr            (m_axi.araddr),                   // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen             (m_axi.arlen),                    // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize            (m_axi.arsize),                   // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst           (m_axi.arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot            (m_axi.arprot),                   // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache           (m_axi.arcache),                  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser            (m_axi.aruser),                   // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid           (m_axi.arvalid),                  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready           (m_axi.arready),                  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata             (m_axi.rdata),                    // input wire [255 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp             (m_axi.rresp),                    // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast             (m_axi.rlast),                    // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid            (m_axi.rvalid),                   // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready            (m_axi.rready),                   // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata            (m_axis.tdata),                   // output wire [255 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep            (m_axis.tkeep),                   // output wire [31 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast            (m_axis.tlast),                   // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid           (m_axis.tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready           (m_axis.tready)                   // input wire m_axis_mm2s_tready
);

axis_cmd_gen_mm2s u_axis_cmd_gen_mm2s(
    .clk                        (axilite_clk),
    .resetn                     (axilite_rstb),
    .m_axis_tdata               (s_axis_cmd_tdata),
    .m_axis_tvalid              (s_axis_cmd_tvalid),
    .m_axis_tready              (s_axis_cmd_tready),
    .read_start                 (read_start),
    .read_reset                 (read_reset),
    .base_addr                  (start_address),
    .cap_size                   (cap_size)
);

assign m_axis_sts_tready = 1'b1; // always ready to receive status

always@(posedge axilite_clk or negedge axilite_rstb) begin
    if(!axilite_rstb)
        datamover_status <= 8'd0;
    else if(read_reset)
        datamover_status <= 8'd0;
    else if(m_axis_sts_tvalid & m_axis_sts_tready)
        datamover_status <= m_axis_sts_tdata;
end

always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        current_addr <= 32'd0;
    else if(read_reset)
        current_addr <= 32'd0;
    else if(m_axi.arready & m_axi.arvalid)
        current_addr <= m_axi.araddr;
end

localparam PACKET_SIZE = 4096;
always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        run_cycles <= 8'd0;
    else if(read_reset)
        run_cycles <= 8'd0;
    else if(m_axi.arready & m_axi.arvalid & (m_axi.araddr + PACKET_SIZE >= start_address + cap_size))
        run_cycles <= run_cycles + 1'b1;
end


endmodule
