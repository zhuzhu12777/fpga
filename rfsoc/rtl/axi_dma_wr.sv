`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module axi_dma_wr(

    // clock & reset
    input                           axi_aclk, axi_rstb,         // axi & axis clock, 500MHz
    input                           axilite_clk, axilite_rstb,  //axis status clock, 100MHz

    // axi4 mastaer write
    AXI4.master                     m_axi,

    // axis
    STREAM.slave                    s_axis,

    // status
    output reg            [7:0]     datamover_status,
    output reg           [31:0]     current_addr,
    output reg            [7:0]     run_cycles,
    output                          wr_mm2s_err,
    output                          cap_done,

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

axi_datamover_wr u_axi_datamover_wr (
  .m_axi_s2mm_aclk              (axi_aclk),                         // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn           (axi_rstb),                         // input wire m_axi_s2mm_aresetn
  .s2mm_err                     (wr_mm2s_err),                      // output wire s2mm_err
  .m_axis_s2mm_cmdsts_awclk     (axilite_clk),                      // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn   (axilite_rstb),                     // input wire m_axis_s2mm_cmdsts_aresetn
  .s_axis_s2mm_cmd_tvalid       (s_axis_cmd_tvalid),                // input wire s_axis_s2mm_cmd_tvalid
  .s_axis_s2mm_cmd_tready       (s_axis_cmd_tready),                // output wire s_axis_s2mm_cmd_tready
  .s_axis_s2mm_cmd_tdata        (s_axis_cmd_tdata),                 // input wire [71 : 0] s_axis_s2mm_cmd_tdata
  .m_axis_s2mm_sts_tvalid       (m_axis_sts_tvalid),                // output wire m_axis_s2mm_sts_tvalid
  .m_axis_s2mm_sts_tready       (m_axis_sts_tready),                // input wire m_axis_s2mm_sts_tready
  .m_axis_s2mm_sts_tdata        (m_axis_sts_tdata),                 // output wire [7 : 0] m_axis_s2mm_sts_tdata
  .m_axis_s2mm_sts_tkeep        (m_axis_sts_tkeep),                 // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast        (m_axis_sts_tlast),                 // output wire m_axis_s2mm_sts_tlast
  .m_axi_s2mm_awid              (m_axi.awid),                       // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr            (m_axi.awaddr),                     // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen             (m_axi.awlen),                      // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize            (m_axi.awsize),                     // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst           (m_axi.awburst),                    // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot            (m_axi.awprot),                     // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache           (m_axi.awcache),                    // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser            (),                     // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid           (m_axi.awvalid),                    // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready           (m_axi.awready),                    // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata             (m_axi.wdata),                      // output wire [127 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb             (m_axi.wstrb),                      // output wire [15 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast             (m_axi.wlast),                      // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid            (m_axi.wvalid),                     // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready            (m_axi.wready),                     // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp             (m_axi.bresp),                      // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid            (m_axi.bvalid),                     // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready            (m_axi.bready),                     // output wire m_axi_s2mm_bready
  .s_axis_s2mm_tdata            (s_axis.tdata),                       // input wire [127 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep            ('1),                           // input wire [15 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast            ('0),                             // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid           (s_axis.tvalid),                      // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready           (s_axis.tready)                       // output wire s_axis_s2mm_tready
);

axis_cmd_gen_s2mm u_axis_cmd_gen_s2mm(
    .clk                        (axilite_clk),
    .resetn                     (axilite_rstb),
    .m_axis_tdata               (s_axis_cmd_tdata),
    .m_axis_tvalid              (s_axis_cmd_tvalid),
    .m_axis_tready              (s_axis_cmd_tready),
    .write_start                (write_start),
    .write_reset                (write_reset),
    .base_addr                  (start_address),
    .cap_size                   (cap_size),
    .cap_done                   (cap_done)
);

assign m_axis_sts_tready = 1'b1; // always ready to receive status

always@(posedge axilite_clk or negedge axilite_rstb) begin
    if(!axilite_rstb)
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
    else if(m_axi.awready & m_axi.awvalid)
        current_addr <= m_axi.awaddr;
end

// axi each transaction size is 256*16bit = 512byte
localparam PACKET_SIZE = 4096;
always@(posedge axi_aclk or negedge axi_rstb) begin
    if(!axi_rstb)
        run_cycles <= 8'd0;
    else if(write_reset)
        run_cycles <= 8'd0;
    else if(m_axi.awready & m_axi.awvalid & (m_axi.awaddr + PACKET_SIZE >= start_address + cap_size))
        run_cycles <= run_cycles + 1'b1;
end

endmodule
