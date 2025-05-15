`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ddr dac data to rf data converter path

module dac_data_path(
    // clock & reset
    input                           pl_clk, pl_rstb,            // axi datamover clock, 333.25MHz
    input                           axilite_clk, axilite_rstb,  // axilite clock, 100MHz
    input                           rf_clk, rf_rstb,            // rf data clock, 500MHz

    // axi4 mastaer read
    AXI4.master                     m_axi,      // ar r

    // dac axis output
    STREAM.master                   m_axis,     //256b

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
STREAM #(256) dma_axis;
axi_dma_rd u_axi_dma_rd (
    // clock & reset
    .axi_aclk           (pl_clk),
    .axi_rstb           (pl_rstb),
    .axilite_clk        (axilite_clk),
    .axilite_rstb       (axilite_rstb),

    // axi4 master read
    .m_axi              (m_axi),

    // axis
    .m_axis             (dma_axis),

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
STREAM #(256) fifo_axis;
axis_data_fifo_rd u_axis_data_fifo_rd (
    .s_axis_aresetn         (pl_rstb),              // input wire s_axis_aresetn
    .s_axis_aclk            (pl_clk),               // input wire s_axis_aclk
    .s_axis_tvalid          (dma_axis.tvalid),     // input wire s_axis_tvalid
    .s_axis_tready          (dma_axis.tready),     // output wire s_axis_tready
    .s_axis_tdata           (dma_axis.tdata),      // input wire [255 : 0] s_axis_tdata
    .m_axis_aclk            (rf_clk),               // input wire m_axis_aclk
    .m_axis_tvalid          (fifo_axis.tvalid),        // output wire m_axis_tvalid
    .m_axis_tready          (fifo_axis.tready),        // input wire m_axis_tready
    .m_axis_tdata           (fifo_axis.tdata)          // output wire [255 : 0] m_axis_tdata
);

// axis data width converter, 256b to 128b
STREAM #(128) axis_128b;
axis_dwidth_converter_rd u_axis_dwidth_converter_rd (
    .aclk                   (rf_clk),               // input wire aclk
    .aresetn                (rf_rstb),              // input wire aresetn
    .s_axis_tvalid          (fifo_axis.tvalid),        // input wire s_axis_tvalid
    .s_axis_tready          (fifo_axis.tready),        // output wire s_axis_tready
    .s_axis_tdata           (fifo_axis.tdata),         // input wire [255 : 0] s_axis_tdata
    .m_axis_tvalid          (axis_128b.tvalid),          // output wire m_axis_tvalid
    .m_axis_tready          (axis_128b.tready),          // input wire m_axis_tready
    .m_axis_tdata           (axis_128b.tdata)       // output wire [127 : 0] m_axis_tdata
);

// expand 128b to 256b
assign m_axis.tdata = {axis_128b.tdata[127:120], axis_128b.tdata[127:120], axis_128b.tdata[119:112], axis_128b.tdata[119:112],
                     axis_128b.tdata[111:104], axis_128b.tdata[111:104], axis_128b.tdata[103:96], axis_128b.tdata[103:96],
                     axis_128b.tdata[95:88], axis_128b.tdata[95:88], axis_128b.tdata[87:80], axis_128b.tdata[87:80],
                     axis_128b.tdata[79:72], axis_128b.tdata[79:72], axis_128b.tdata[71:64], axis_128b.tdata[71:64],
                     axis_128b.tdata[63:56], axis_128b.tdata[63:56], axis_128b.tdata[55:48], axis_128b.tdata[55:48],
                     axis_128b.tdata[47:40], axis_128b.tdata[47:40], axis_128b.tdata[39:32], axis_128b.tdata[39:32],
                     axis_128b.tdata[31:24], axis_128b.tdata[31:24], axis_128b.tdata[23:16], axis_128b.tdata[23:16],
                     axis_128b.tdata[15:8],  axis_128b.tdata[15:8],  axis_128b.tdata[7:0],   axis_128b.tdata[7:0]};

assign m_axis.tvalid = axis_128b.tvalid;
assign axis_128b.tready = m_axis.tready;

endmodule
