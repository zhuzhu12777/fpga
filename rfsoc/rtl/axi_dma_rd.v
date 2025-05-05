`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module axi_dma_rd(

    // clock & reset
    input                           axi_aclk, axi_rstb,         // axi & axis clock, 500MHz
    input                           axis_st_clk, axis_st_rstb,  //axis status clock, 100MHz 

    // axi4 mastaer read
    output               [31:0]     axi_araddr,
    output                [1:0]     axi_arburst,
    output                [3:0]     axi_arcache,
    output                [3:0]     axi_arid,
    output                [7:0]     axi_arlen,
    output                [2:0]     axi_arprot,
    input                           axi_arready,
    output                [2:0]     axi_arsize,
    output                [3:0]     axi_aruser,
    output                          axi_arvalid,
    input               [255:0]     axi_rdata,
    input                           axi_rlast,
    output                          axi_rready,
    input                 [1:0]     axi_rresp,
    input                           axi_rvalid,

    // axis
    output              [255:0]     axis_tdata,
    output               [31:0]     axis_tkeep,
    output                          axis_tlast,
    input                           axis_tready,
    output                          axis_tvalid,

    // status
    output reg           [31:0]     current_addr,
    output reg            [7:0]     run_cycles,
    output                          rd_mm2s_err,

    // regs
    input                          read_start,
    input                          read_reset,
    input               [31:0]     start_address,
    input               [31:0]     cap_size

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

// axis fifo
wire                            fifo_axis_tvalid;
wire                            fifo_axis_tready;
wire               [255:0]      fifo_axis_tdata;
wire                [31:0]      fifo_axis_tkeep;
wire                            fifo_axis_tlast;


axi_datamover_rd axi_datamover_rd (
  .m_axi_mm2s_aclk              (axi_aclk),                     // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn           (axi_rstb),                     // input wire m_axi_mm2s_aresetn
  .mm2s_err                     (rd_mm2s_err),                  // output wire mm2s_err
  .m_axis_mm2s_cmdsts_aclk      (axis_st_clk),                  // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn   (axis_st_rstb),                 // input wire m_axis_mm2s_cmdsts_aresetn
  .s_axis_mm2s_cmd_tvalid       (s_axis_cmd_tvalid),            // input wire s_axis_mm2s_cmd_tvalid
  .s_axis_mm2s_cmd_tready       (s_axis_cmd_tready),            // output wire s_axis_mm2s_cmd_tready
  .s_axis_mm2s_cmd_tdata        (s_axis_cmd_tdata),             // input wire [71 : 0] s_axis_mm2s_cmd_tdata
  .m_axis_mm2s_sts_tvalid       (m_axis_sts_tvalid),            // output wire m_axis_mm2s_sts_tvalid
  .m_axis_mm2s_sts_tready       (m_axis_sts_tready),            // input wire m_axis_mm2s_sts_tready
  .m_axis_mm2s_sts_tdata        (m_axis_sts_tdata),             // output wire [7 : 0] m_axis_mm2s_sts_tdata
  .m_axis_mm2s_sts_tkeep        (m_axis_sts_tkeep),             // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast        (m_axis_sts_tlast),             // output wire m_axis_mm2s_sts_tlast
  .m_axi_mm2s_arid              (axi_arid),                     // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr            (axi_araddr),                   // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen             (axi_arlen),                    // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize            (axi_arsize),                   // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst           (axi_arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot            (axi_arprot),                   // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache           (axi_arcache),                  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser            (axi_aruser),                   // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid           (axi_arvalid),                  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready           (axi_arready),                  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata             (axi_rdata),                    // input wire [255 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp             (axi_rresp),                    // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast             (axi_rlast),                    // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid            (axi_rvalid),                   // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready            (axi_rready),                   // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata            (axis_tdata),                   // output wire [255 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep            (axis_tkeep),                   // output wire [31 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast            (axis_tlast),                   // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid           (axis_tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready           (axis_tready)                   // input wire m_axis_mm2s_tready
);

axis_cmd_gen_mm2s axis_cmd_gen_mm2s(
    .clk                        (axis_st_clk),
    .resetn                     (axis_st_rstb),
    .m_axis_tdata               (s_axis_cmd_tdata),
    .m_axis_tvalid              (s_axis_cmd_tvalid),
    .m_axis_tready              (s_axis_cmd_tready),
    .read_start                 (read_start),
    .read_reset                 (read_reset),
    .base_addr                  (start_address),
    .cap_size                   (cap_size)
);

assign m_axis_sts_tready = 1'b1; // always ready to receive status

always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        current_addr <= 32'd0;
    else if(axi_arready & axi_arvalid)
        current_addr <= axi_araddr;
end

always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        run_cycles <= 8'd0;
    else if(axi_arready & axi_arvalid & (axi_araddr + 512 == start_address + cap_size))
        run_cycles <= run_cycles + 1'b1;
end

// fifo, depth = 64
axis_data_fifo_rd axis_data_fifo_rd (
  .s_axis_aresetn           (axi_rstb),             // input wire s_axis_aresetn
  .s_axis_aclk              (axi_aclk),             // input wire s_axis_aclk
  .s_axis_tvalid            (fifo_axis_tvalid),     // input wire s_axis_tvalid
  .s_axis_tready            (fifo_axis_tready),     // output wire s_axis_tready
  .s_axis_tdata             (fifo_axis_tdata),      // input wire [255 : 0] s_axis_tdata
  .s_axis_tkeep             (fifo_axis_tkeep),      // input wire [31 : 0] s_axis_tkeep
  .s_axis_tlast             (fifo_axis_tlast),      // input wire s_axis_tlast
  .m_axis_tvalid            (axis_tvalid),          // output wire m_axis_tvalid
  .m_axis_tready            (axis_tready),          // input wire m_axis_tready
  .m_axis_tdata             (axis_tdata),           // output wire [255 : 0] m_axis_tdata
  .m_axis_tkeep             (axis_tkeep),           // output wire [31 : 0] m_axis_tkeep
  .m_axis_tlast             (axis_tlast)            // output wire m_axis_tlast
);

endmodule
