`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// rf data converter adc data to ddr path

module adc_data_path(
    input                           axis_aclk, axis_rstb,         // axi & axis 256b clock
    input                           axis_aclk2, axis_rstb2,       // axis 192b clock
    input                           axis_st_clk, axis_st_rstb,    // datamover status clock

    // axi write to ddr
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

    // adc axis input
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
    input           [31:0]          axis_tdata_5,

    // status
    output reg            [7:0]     datamover_status,
    output reg           [31:0]     current_addr,
    output reg            [7:0]     run_cycles,
    output                          wr_mm2s_err,
    output reg                      cap_done,

    // regs
    input                           write_start,
    input                           write_reset,
    input                [31:0]     start_address,
    input                [31:0]     cap_size
);


wire                    axis_tready_merge;
wire                    axis_tvalid_merge;
wire                    axis_tlast_merge;
wire    [255:0]         axis_tdata_merge;

// 1. data_merge_wr
data_merge_wr u_data_merge_wr (
    .axis_aclk          (axis_aclk2),
    .axis_rstb          (axis_rstb2),
    .axis_aclk_out      (axis_aclk),
    .axis_rstb_out      (axis_rstb),

    .axis_tready_merge  (axis_tready_merge),
    .axis_tvalid_merge  (axis_tvalid_merge),
    .axis_tlast_merge   (axis_tlast_merge),
    .axis_tdata_merge   (axis_tdata_merge),

    .axis_tready_0      (axis_tready_0),
    .axis_tvalid_0      (axis_tvalid_0),
    .axis_tdata_0       (axis_tdata_0),

    .axis_tready_1      (axis_tready_1),
    .axis_tvalid_1      (axis_tvalid_1),
    .axis_tdata_1       (axis_tdata_1),

    .axis_tready_2      (axis_tready_2),
    .axis_tvalid_2      (axis_tvalid_2),
    .axis_tdata_2       (axis_tdata_2),

    .axis_tready_3      (axis_tready_3),
    .axis_tvalid_3      (axis_tvalid_3),
    .axis_tdata_3       (axis_tdata_3),

    .axis_tready_4      (axis_tready_4),
    .axis_tvalid_4      (axis_tvalid_4),
    .axis_tdata_4       (axis_tdata_4),

    .axis_tready_5      (axis_tready_5),
    .axis_tvalid_5      (axis_tvalid_5),
    .axis_tdata_5       (axis_tdata_5)
);

// 2. axi_dma_wr
axi_dma_wr u_axi_dma_wr (
    // clock & reset
    .axi_aclk           (axis_aclk),
    .axi_rstb           (axis_rstb),
    .axis_st_clk        (axis_st_clk),
    .axis_st_rstb       (axis_st_rstb),

    // axi4 master write
    .axi_awaddr         (axi_awaddr),
    .axi_awburst        (axi_awburst),
    .axi_awcache        (axi_awcache),
    .axi_awid           (axi_awid),
    .axi_awlen          (axi_awlen),
    .axi_awprot         (axi_awprot),
    .axi_awready        (axi_awready),
    .axi_awsize         (axi_awsize),
    .axi_awuser         (axi_awuser),
    .axi_awvalid        (axi_awvalid),
    .axi_wdata          (axi_wdata),
    .axi_wstrb          (axi_wstrb),
    .axi_wlast          (axi_wlast),
    .axi_wvalid         (axi_wvalid),
    .axi_wready         (axi_wready),
    .axi_bresp          (axi_bresp),
    .axi_bvalid         (axi_bvalid),
    .axi_bready         (axi_bready),

    // axis
    .axis_tdata         (axis_tdata_merge),
    .axis_tkeep         (32'hFFFFFFFF), // Assuming full keep for simplicity
    .axis_tlast         (axis_tlast_merge),
    .axis_tready        (axis_tready_merge),
    .axis_tvalid        (axis_tvalid_merge),

    // status
    .datamover_status   (datamover_status),
    .current_addr       (current_addr),
    .run_cycles         (run_cycles),
    .wr_mm2s_err        (wr_mm2s_err),
    .cap_done           (cap_done),

    // regs
    .write_start        (write_start),
    .write_reset        (write_reset),
    .start_address      (start_address),
    .cap_size           (cap_size)
);

endmodule
