`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ddr dac data to rf data converter path

module dac_data_path(
    // clock & reset
    input                           pl_clk, pl_rstb,            // axi datamover clock, 333.25MHz
    input                           axilite_clk, axilite_rstb,  // axilite clock, 100MHz
    input                           rf_clk, rf_rstb,            // rf data clock, 500MHz

    // axi4 mastaer write
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

    // dac axis output
    output              [255:0]     axis_tdata,
    input                           axis_tready,
    output                          axis_tvalid,

    // status for debug
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
axi_dma_rd u_axi_dma_rd (
    // clock & reset
    .axi_aclk           (pl_clk),
    .axi_rstb           (pl_rstb),
    .axis_st_clk        (axilite_clk),
    .axis_st_rstb       (axilite_rstb),

    // axi4 master read
    .axi_araddr         (axi_araddr),
    .axi_arburst        (axi_arburst),
    .axi_arcache        (axi_arcache),
    .axi_arid           (axi_arid),
    .axi_arlen          (axi_arlen),
    .axi_arprot         (axi_arprot),
    .axi_arready        (axi_arready),
    .axi_arsize         (axi_arsize),
    .axi_aruser         (axi_aruser),
    .axi_arvalid        (axi_arvalid),
    .axi_rdata          (axi_rdata),
    .axi_rlast          (axi_rlast),
    .axi_rready         (axi_rready),
    .axi_rresp          (axi_rresp),
    .axi_rvalid         (axi_rvalid),

    // axis
    .axis_tdata         (fifo_axis_tdata),
    .axis_tkeep         (),
    .axis_tlast         (),
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

// axis fifo, depth = 64
wire                            m_axis_tvalid;
wire                            m_axis_tready;
wire               [255:0]      m_axis_tdata;
axis_data_fifo_rd axis_data_fifo_rd (
    .s_axis_aresetn         (pl_rstb),              // input wire s_axis_aresetn
    .s_axis_aclk            (pl_clk),               // input wire s_axis_aclk
    .s_axis_tvalid          (fifo_axis_tvalid),     // input wire s_axis_tvalid
    .s_axis_tready          (fifo_axis_tready),     // output wire s_axis_tready
    .s_axis_tdata           (fifo_axis_tdata),      // input wire [255 : 0] s_axis_tdata
    .m_axis_aclk            (rf_clk),               // input wire m_axis_aclk
    .m_axis_tvalid          (m_axis_tvalid),        // output wire m_axis_tvalid
    .m_axis_tready          (m_axis_tready),        // input wire m_axis_tready
    .m_axis_tdata           (m_axis_tdata)          // output wire [255 : 0] m_axis_tdata
);

// axis data width converter, 256b to 128b
wire                [127:0]    axis_128b_tdata;
axis_dwidth_converter_rd axis_dwidth_converter_rd (
    .aclk                   (rf_clk),               // input wire aclk
    .aresetn                (rf_rstb),              // input wire aresetn
    .s_axis_tvalid          (m_axis_tvalid),        // input wire s_axis_tvalid
    .s_axis_tready          (m_axis_tready),        // output wire s_axis_tready
    .s_axis_tdata           (m_axis_tdata),         // input wire [255 : 0] s_axis_tdata
    .m_axis_tvalid          (axis_tvalid),          // output wire m_axis_tvalid
    .m_axis_tready          (axis_tready),          // input wire m_axis_tready
    .m_axis_tdata           (axis_128b_tdata)       // output wire [127 : 0] m_axis_tdata
);

// expand 128b to 256b
assign axis_tdata = {axis_128b_tdata[127:120], axis_128b_tdata[127:120], axis_128b_tdata[119:112], axis_128b_tdata[119:112],
                     axis_128b_tdata[111:104], axis_128b_tdata[111:104], axis_128b_tdata[103:96], axis_128b_tdata[103:96],
                     axis_128b_tdata[95:88], axis_128b_tdata[95:88], axis_128b_tdata[87:80], axis_128b_tdata[87:80],
                     axis_128b_tdata[79:72], axis_128b_tdata[79:72], axis_128b_tdata[71:64], axis_128b_tdata[71:64],
                     axis_128b_tdata[63:56], axis_128b_tdata[63:56], axis_128b_tdata[55:48], axis_128b_tdata[55:48],
                     axis_128b_tdata[47:40], axis_128b_tdata[47:40], axis_128b_tdata[39:32], axis_128b_tdata[39:32],
                     axis_128b_tdata[31:24], axis_128b_tdata[31:24], axis_128b_tdata[23:16], axis_128b_tdata[23:16],
                     axis_128b_tdata[15:8],  axis_128b_tdata[15:8],  axis_128b_tdata[7:0],   axis_128b_tdata[7:0]};

endmodule
