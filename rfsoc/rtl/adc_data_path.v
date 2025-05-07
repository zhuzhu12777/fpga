`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// rf data converter adc data to ddr path

module adc_data_path(
    // clock & reset
    input                           ps_clk, ps_rstb,            // axi wr clock, 333.25MHz
    input                           axilite_clk, axilite_rstb,  // axilite clock, 100MHz
    input                           rf_clk, rf_rstb,            // rf adc clock, 187.5MHz

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
    output              [128:0]     axi_wdata,
    output               [15:0]     axi_wstrb,
    output                          axi_wlast,
    output                          axi_wvalid,
    input                           axi_wready,
    input                 [1:0]     axi_bresp,
    input                           axi_bvalid,
    output                          axi_bready,

    // adc axis input
    output                          axis_tready_0,
    input                           axis_tvalid_0,
    input           [127:0]         axis_tdata_0,

    output                          axis_tready_1,
    input                           axis_tvalid_1,
    input           [127:0]         axis_tdata_1,

    output                          axis_tready_2,
    input                           axis_tvalid_2,
    input           [127:0]         axis_tdata_2,

    output                          axis_tready_3,
    input                           axis_tvalid_3,
    input           [127:0]         axis_tdata_3,

    output                          axis_tready_4,
    input                           axis_tvalid_4,
    input           [127:0]         axis_tdata_4,

    output                          axis_tready_5,
    input                           axis_tvalid_5,
    input           [127:0]         axis_tdata_5,

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

// 1. handle each adc axis input 
wire [7:0]  stream_0_sample_0_data = (axis_tdata_0[15:7] + axis_tdata_0[31:24] + 1)>>1;  //round
wire [7:0]  stream_0_sample_1_data = (axis_tdata_0[47:40] + axis_tdata_0[63:56] + 1)>>1;  //round
wire [7:0]  stream_0_sample_2_data = (axis_tdata_0[79:72] + axis_tdata_0[95:88] + 1)>>1;  //round
wire [7:0]  stream_0_sample_3_data = (axis_tdata_0[111:104] + axis_tdata_0[127:120] + 1)>>1;  //round
wire [31:0] stream_0_tdata = {stream_0_sample_3_data, stream_0_sample_2_data, stream_0_sample_1_data, stream_0_sample_0_data};

wire [7:0]  stream_1_sample_0_data = (axis_tdata_1[15:7] + axis_tdata_1[31:24] + 1)>>1;  //round
wire [7:0]  stream_1_sample_1_data = (axis_tdata_1[47:40] + axis_tdata_1[63:56] + 1)>>1;  //round
wire [7:0]  stream_1_sample_2_data = (axis_tdata_1[79:72] + axis_tdata_1[95:88] + 1)>>1;  //round
wire [7:0]  stream_1_sample_3_data = (axis_tdata_1[111:104] + axis_tdata_1[127:120] + 1)>>1;  //round
wire [31:0] stream_1_tdata = {stream_1_sample_3_data, stream_1_sample_2_data, stream_1_sample_1_data, stream_1_sample_0_data};

wire [7:0]  stream_2_sample_0_data = (axis_tdata_2[15:7] + axis_tdata_2[31:24] + 1)>>1;  //round
wire [7:0]  stream_2_sample_1_data = (axis_tdata_2[47:40] + axis_tdata_2[63:56] + 1)>>1;  //round
wire [7:0]  stream_2_sample_2_data = (axis_tdata_2[79:72] + axis_tdata_2[95:88] + 1)>>1;  //round
wire [7:0]  stream_2_sample_3_data = (axis_tdata_2[111:104] + axis_tdata_2[127:120] + 1)>>1;  //round
wire [31:0] stream_2_tdata = {stream_2_sample_3_data, stream_2_sample_2_data, stream_2_sample_1_data, stream_2_sample_0_data};

wire [7:0]  stream_3_sample_0_data = (axis_tdata_3[15:7] + axis_tdata_3[31:24] + 1)>>1;  //round
wire [7:0]  stream_3_sample_1_data = (axis_tdata_3[47:40] + axis_tdata_3[63:56] + 1)>>1;  //round
wire [7:0]  stream_3_sample_2_data = (axis_tdata_3[79:72] + axis_tdata_3[95:88] + 1)>>1;  //round
wire [7:0]  stream_3_sample_3_data = (axis_tdata_3[111:104] + axis_tdata_3[127:120] + 1)>>1;  //round
wire [31:0] stream_3_tdata = {stream_3_sample_3_data, stream_3_sample_2_data, stream_3_sample_1_data, stream_3_sample_0_data};

// 2. each axis async fifo, depth = 64
wire [31:0] fifo_tdata_0, fifo_tdata_1, fifo_tdata_2, fifo_tdata_3, fifo_tdata_4, fifo_tdata_5;
wire        fifo_tready_0, fifo_tready_1, fifo_tready_2, fifo_tready_3, fifo_tready_4, fifo_tready_5;
wire        fifo_tvalid_0, fifo_tvalid_1, fifo_tvalid_2, fifo_tvalid_3, fifo_tvalid_4, fifo_tvalid_5;

axis_data_fifo_32b stream_0_fifo (
    .s_axis_aresetn                 (rf_rstb),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk),           // input wire s_axis_aclk
    .s_axis_tvalid                  (axis_tready_0),    // input wire s_axis_tvalid
    .s_axis_tready                  (axis_tvalid_0),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_0_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_tvalid                  (fifo_tvalid_0),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_tready_0),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_tdata_0)      // output wire [31 : 0] m_axis_tdata
);

axis_data_fifo_32b stream_1_fifo (
    .s_axis_aresetn                 (rf_rstb),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk),           // input wire s_axis_aclk
    .s_axis_tvalid                  (axis_tready_1),    // input wire s_axis_tvalid
    .s_axis_tready                  (axis_tvalid_1),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_1_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_tvalid                  (fifo_tvalid_1),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_tready_1),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_tdata_1)      // output wire [31 : 0] m_axis_tdata
);

axis_data_fifo_32b stream_2_fifo (
    .s_axis_aresetn                 (rf_rstb),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk),           // input wire s_axis_aclk
    .s_axis_tvalid                  (axis_tready_2),    // input wire s_axis_tvalid
    .s_axis_tready                  (axis_tvalid_2),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_2_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_tvalid                  (fifo_tvalid_2),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_tready_2),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_tdata_2)      // output wire [31 : 0] m_axis_tdata
);

axis_data_fifo_32b stream_3_fifo (
    .s_axis_aresetn                 (rf_rstb),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk),           // input wire s_axis_aclk
    .s_axis_tvalid                  (axis_tready_3),    // input wire s_axis_tvalid
    .s_axis_tready                  (axis_tvalid_3),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_3_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_tvalid                  (fifo_tvalid_3),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_tready_3),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_tdata_3)      // output wire [31 : 0] m_axis_tdata
);

axis_data_fifo_32b stream_4_fifo (
    .s_axis_aresetn                 (rf_rstb),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk),           // input wire s_axis_aclk
    .s_axis_tvalid                  (axis_tready_4),    // input wire s_axis_tvalid
    .s_axis_tready                  (axis_tvalid_4),    // output wire s_axis_tready
    .s_axis_tdata                   (axis_tdata_4),     // input wire [31 : 0] s_axis_tdata
    .m_axis_tvalid                  (fifo_tvalid_4),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_tready_4),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_tdata_4)      // output wire [31 : 0] m_axis_tdata
);

axis_data_fifo_32b stream_5_fifo (
    .s_axis_aresetn                 (rf_rstb),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk),           // input wire s_axis_aclk
    .s_axis_tvalid                  (axis_tready_5),    // input wire s_axis_tvalid
    .s_axis_tready                  (axis_tvalid_5),    // output wire s_axis_tready
    .s_axis_tdata                   (axis_tdata_5),     // input wire [31 : 0] s_axis_tdata
    .m_axis_tvalid                  (fifo_tvalid_5),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_tready_5),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_tdata_5)      // output wire [31 : 0] m_axis_tdata
);

// 3. merge all axis data to one stream
wire [5:0]   cbin_axis_tvalid = {fifo_tvalid_5, fifo_tvalid_4, fifo_tvalid_3, fifo_tvalid_2, fifo_tvalid_1, fifo_tvalid_0};
wire [5:0]   cbin_axis_tready = {fifo_tready_5, fifo_tready_4, fifo_tready_3, fifo_tready_2, fifo_tready_1, fifo_tready_0};
wire [191:0] cbin_axis_tdata = {fifo_tdata_5, fifo_tdata_4, fifo_tdata_3, fifo_tdata_2, fifo_tdata_1, fifo_tdata_0};
wire         cbout_axis_tvalid;
wire         cbout_axis_tready;
wire [191:0] cbout_axis_tdata;

axis_combiner_0 axis_combiner (
    .aclk                           (rf_clk),               // input wire aclk
    .aresetn                        (rf_rstb),              // input wire aresetn
    .s_axis_tvalid                  (cbin_axis_tvalid),     // input wire [5 : 0] s_axis_tvalid
    .s_axis_tready                  (cbin_axis_tready),     // output wire [5 : 0] s_axis_tready
    .s_axis_tdata                   (cbin_axis_tdata),      // input wire [191 : 0] s_axis_tdata
    .m_axis_tvalid                  (cbout_axis_tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (cbout_axis_tready),    // input wire m_axis_tready
    .m_axis_tdata                   (cbout_axis_tdata)      // output wire [191 : 0] m_axis_tdata
);
wire [191:0] reorder_tdata = {cbout_axis_tdata[191:184], cbout_axis_tdata[159:152], cbout_axis_tdata[127:120], cbout_axis_tdata[95:88], cbout_axis_tdata[63:56], cbout_axis_tdata[31:24], 
                              cbout_axis_tdata[183:176], cbout_axis_tdata[151:144], cbout_axis_tdata[119:112], cbout_axis_tdata[87:80], cbout_axis_tdata[55:48], cbout_axis_tdata[23:16],
                              cbout_axis_tdata[175:168], cbout_axis_tdata[143:136], cbout_axis_tdata[111:104], cbout_axis_tdata[79:72], cbout_axis_tdata[47:40], cbout_axis_tdata[15:8],
                              cbout_axis_tdata[167:160], cbout_axis_tdata[135:128], cbout_axis_tdata[103:96], cbout_axis_tdata[71:64], cbout_axis_tdata[39:32], cbout_axis_tdata[7:0]};

// 4. async fifo, from rf_clk to ps_clk
wire [191:0] afifo_tdata;
wire         afifo_tvalid;
wire         afifo_tready;
axis_data_afifo_192b axis_data_afifo (
    .s_axis_aresetn                 (rf_rstb),              // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk),               // input wire s_axis_aclk
    .s_axis_tvalid                  (cbout_axis_tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (cbout_axis_tready),    // output wire s_axis_tready
    .s_axis_tdata                   (reorder_tdata),        // input wire [191 : 0] s_axis_tdata
    .m_axis_aclk                    (ps_clk),               // input wire m_axis_aclk
    .m_axis_tvalid                  (afifo_tvalid),         // output wire m_axis_tvalid
    .m_axis_tready                  (afifo_tready),         // input wire m_axis_tready
    .m_axis_tdata                   (afifo_tdata)           // output wire [191 : 0] m_axis_tdata
);

// 5. change bit width from 192 to 128
wire [127:0] dw_axis_tdata;
wire         dw_axis_tvalid;
wire         dw_axis_tready;
axis_dwidth_converter_wr axis_dwidth_converter_wr (
    .aclk                           (ps_clk),               // input wire aclk
    .aresetn                        (ps_rstb),              // input wire aresetn
    .s_axis_tvalid                  (afifo_tvalid),         // input wire s_axis_tvalid
    .s_axis_tready                  (afifo_tready),         // output wire s_axis_tready
    .s_axis_tdata                   (afifo_tdata),          // input wire [191 : 0] s_axis_tdata
    .m_axis_tvalid                  (dw_axis_tvalid),       // output wire m_axis_tvalid
    .m_axis_tready                  (dw_axis_tready),       // input wire m_axis_tready
    .m_axis_tdata                   (dw_axis_tdata)         // output wire [127 : 0] m_axis_tdata
);

// 6. axi_dma_wr to move data to ddr
axi_dma_wr u_axi_dma_wr (
    // clock & reset
    .axi_aclk           (ps_clk),
    .axi_rstb           (ps_rstb),
    .axis_st_clk        (axilite_clk),
    .axis_st_rstb       (axilite_rstb),

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
    .axis_tdata         (dw_axis_tdata),
    .axis_tready        (dw_axis_tready),
    .axis_tvalid        (dw_axis_tvalid),

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
