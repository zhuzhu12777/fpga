`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module axi_dma_wr(

    // clock & reset
    input                           axi_aclk, axi_rstb,         // axi & axis clock, 500MHz
    input                           axis_st_clk, axis_st_rstb,  //axis status clock, 100MHz

    // axi4 mastaer write
    output               [31:0]     axi_awaddr,
    output                [1:0]     axi_awburst,
    output                [3:0]     axi_awcache,
    output                [3:0]     axi_awid,
    output                [7:0]     axi_awlen,
    output                [2:0]     axi_awprot,
    input                           axi_awready,
    output                [2:0]     axi_awsize,
    output                [3:0]     axi_awuser,
    output                          axi_awvalid,
    output              [128:0]     axi_wdata,
    output               [15:0]     axi_wstrb,
    output                          axi_wlast,
    output                          axi_wvalid,
    input                           axi_wready,
    input                 [1:0]     axi_bresp,
    input                           axi_bvalid,
    output                          axi_bready,

    // axis
    input               [128:0]     axis_tdata,
    input                [15:0]     axis_tkeep,
    input                           axis_tlast,
    output                          axis_tready,
    input                           axis_tvalid,

    // status
    output reg            [7:0]     datamover_status,
    output reg           [31:0]     current_addr,
    output reg            [7:0]     run_cycles,
    output                          wr_mm2s_err,
    output reg                      cap_done,

    // regs
    input                          write_start,
    input                          write_reset,
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

axi_datamover_wr axi_datamover_wr (
  .m_axi_s2mm_aclk              (axi_aclk),                         // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn           (axi_rstb),                         // input wire m_axi_s2mm_aresetn
  .s2mm_err                     (wr_mm2s_err),                      // output wire s2mm_err
  .m_axis_s2mm_cmdsts_awclk     (axis_st_clk),                      // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn   (axis_st_rstb),                     // input wire m_axis_s2mm_cmdsts_aresetn
  .s_axis_s2mm_cmd_tvalid       (s_axis_cmd_tvalid),                // input wire s_axis_s2mm_cmd_tvalid
  .s_axis_s2mm_cmd_tready       (s_axis_cmd_tready),                // output wire s_axis_s2mm_cmd_tready
  .s_axis_s2mm_cmd_tdata        (s_axis_cmd_tdata),                 // input wire [71 : 0] s_axis_s2mm_cmd_tdata
  .m_axis_s2mm_sts_tvalid       (m_axis_sts_tvalid),                // output wire m_axis_s2mm_sts_tvalid
  .m_axis_s2mm_sts_tready       (m_axis_sts_tready),                // input wire m_axis_s2mm_sts_tready
  .m_axis_s2mm_sts_tdata        (m_axis_sts_tdata),                 // output wire [7 : 0] m_axis_s2mm_sts_tdata
  .m_axis_s2mm_sts_tkeep        (m_axis_sts_tkeep),                 // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast        (m_axis_sts_tlast),                 // output wire m_axis_s2mm_sts_tlast
  .m_axi_s2mm_awid              (axi_awid),                         // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr            (axi_awaddr),                       // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen             (axi_awlen),                        // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize            (axi_awsize),                       // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst           (axi_awburst),                      // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot            (axi_awprot),                       // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache           (axi_awcache),                      // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser            (axi_awuser),                       // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid           (axi_awvalid),                      // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready           (axi_awready),                      // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata             (axi_wdata),                        // output wire [127 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb             (axi_wstrb),                        // output wire [15 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast             (axi_wlast),                        // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid            (axi_wvalid),                       // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready            (axi_wready),                       // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp             (axi_bresp),                        // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid            (axi_bvalid),                       // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready            (axi_bready),                       // output wire m_axi_s2mm_bready
  .s_axis_s2mm_tdata            (axis_tdata),                       // input wire [127 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep            (axis_tkeep),                       // input wire [15 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast            (axis_tlast),                       // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid           (axis_tvalid),                      // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready           (axis_tready)                       // output wire s_axis_s2mm_tready
);

axis_cmd_gen_s2mm axis_cmd_gen_s2mm(
    .clk                        (axis_st_clk),
    .resetn                     (axis_st_rstb),
    .m_axis_tdata               (s_axis_cmd_tdata),
    .m_axis_tvalid              (s_axis_cmd_tvalid),
    .m_axis_tready              (s_axis_cmd_tready),
    .write_start                (write_start),
    .write_reset                (write_reset),
    .base_addr                  (start_address),
    .cap_size                   (cap_size)
);

assign m_axis_sts_tready = 1'b1; // always ready to receive status

always@(posedge axis_st_clk or negedge axis_st_rstb) begin
    if(!axis_st_rstb)
        datamover_status <= 8'd0;
    else if(write_reset)
        datamover_status <= 8'd0;
    else if(m_axis_sts_tvalid & m_axis_sts_tready) begin
        datamover_status <= m_axis_sts_tdata;
    end
end

always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        current_addr <= 32'd0;
    else if(write_reset)
        current_addr <= 32'd0;
    else if(axi_awready & axi_awvalid)
        current_addr <= axi_awaddr;
end

// axi each transaction size is 256*16bit = 512byte
localparam PACKET_SIZE = 4096;
always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        run_cycles <= 8'd0;
    else if(write_reset)
        run_cycles <= 8'd0;
    else if(axi_awready & axi_awvalid & (axi_awaddr + PACKET_SIZE >= start_address + cap_size))
        run_cycles <= run_cycles + 1'b1;
end

always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        cap_done <= 1'b0;
    else if(write_reset)
        cap_done <= 1'b0;
    else if(axi_awready & axi_awvalid & (axi_awaddr + PACKET_SIZE >= start_address + cap_size))
        cap_done <= 1'b1;
end

endmodule
