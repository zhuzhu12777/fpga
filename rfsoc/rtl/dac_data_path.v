`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ddr dac data to rf data converter path

module dac_data_path(
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
    output              [255:0]     axi_wdata,
    output               [31:0]     axi_wstrb,
    output                          axi_wlast,
    output                          axi_wvalid,
    input                           axi_wready,
    input                 [1:0]     axi_bresp,
    input                           axi_bvalid,
    output                          axi_bready,

    // dac axis output
    output              [255:0]     axis_tdata,
    output               [31:0]     axis_tkeep,
    output                          axis_tlast,
    input                           axis_tready,
    output                          axis_tvalid,

    // status
    output reg            [7:0]     datamover_status,
    output reg           [31:0]     current_addr,
    output reg            [7:0]     run_cycles,
    output                          read_mm2s_err,

    // regs
    input                           read_start,
    input                           read_reset,
    input                [31:0]     start_address,
    input                [31:0]     cap_size

);

// axis fifo
wire                            fifo_axis_tvalid;
wire                            fifo_axis_tready;
wire               [255:0]      fifo_axis_tdata;
wire                [31:0]      fifo_axis_tkeep;
wire                            fifo_axis_tlast;

axi_dma_rd u_axi_dma_rd (
    // clock & reset
    .axi_aclk           (axi_aclk),
    .axi_rstb           (axi_rstb),
    .axis_st_clk        (axis_st_clk),
    .axis_st_rstb       (axis_st_rstb),

    // axi4 master read
    .axi_araddr         (axi_awaddr),
    .axi_arburst        (axi_awburst),
    .axi_arcache        (axi_awcache),
    .axi_arid           (axi_awid),
    .axi_arlen          (axi_awlen),
    .axi_arprot         (axi_awprot),
    .axi_arready        (axi_awready),
    .axi_arsize         (axi_awsize),
    .axi_aruser         (axi_awuser),
    .axi_arvalid        (axi_awvalid),
    .axi_rdata          (axi_wdata),
    .axi_rlast          (axi_wlast),
    .axi_rready         (axi_bready),
    .axi_rresp          (axi_bresp),
    .axi_rvalid         (axi_bvalid),

    // axis
    .axis_tdata         (fifo_axis_tdata),
    .axis_tkeep         (fifo_axis_tkeep),
    .axis_tlast         (fifo_axis_tlast),
    .axis_tready        (fifo_axis_tready),
    .axis_tvalid        (fifo_axis_tvalid),

    // status
    .datamover_status   (datamover_status),
    .current_addr       (current_addr),
    .run_cycles         (run_cycles),
    .rd_mm2s_err        (read_mm2s_err),

    // regs
    .read_start         (read_start),
    .read_reset         (read_reset),
    .start_address      (start_address),
    .cap_size           (cap_size)
);

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
