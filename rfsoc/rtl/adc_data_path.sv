`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// rf data converter adc data to ddr path

module adc_data_path(
    // clock & reset
    input                           ps_clk, ps_rstb,            // axi wr clock, 333.25MHz
    input                           axilite_clk, axilite_rstb,  // axilite clock, 100MHz
    input                           rf_clk0, rf_rstb0,            // rf adc clock, 187.5MHz
    input                           rf_clk1, rf_rstb1,            // rf adc clock, 187.5MHz
    input                           rf_clk2, rf_rstb2,            // rf adc clock, 187.5MHz

    // axi write to ps
    AXI4.master                     m_axi,      // aw w b

    // adc axis input
    STREAM.slave                    s_axis[6],

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
wire [7:0]  stream_0_sample_0_data = (s_axis[0].tdata[15:8] + s_axis[0].tdata[31:24] + 1)>>1;  //round
wire [7:0]  stream_0_sample_1_data = (s_axis[0].tdata[47:40] + s_axis[0].tdata[63:56] + 1)>>1;  //round
wire [7:0]  stream_0_sample_2_data = (s_axis[0].tdata[79:72] + s_axis[0].tdata[95:88] + 1)>>1;  //round
wire [7:0]  stream_0_sample_3_data = (s_axis[0].tdata[111:104] + s_axis[0].tdata[127:120] + 1)>>1;  //round
wire [31:0] stream_0_tdata = {stream_0_sample_3_data, stream_0_sample_2_data, stream_0_sample_1_data, stream_0_sample_0_data};

wire [7:0]  stream_1_sample_0_data = (s_axis[1].tdata[15:8] + s_axis[1].tdata[31:24] + 1)>>1;  //round
wire [7:0]  stream_1_sample_1_data = (s_axis[1].tdata[47:40] + s_axis[1].tdata[63:56] + 1)>>1;  //round
wire [7:0]  stream_1_sample_2_data = (s_axis[1].tdata[79:72] + s_axis[1].tdata[95:88] + 1)>>1;  //round
wire [7:0]  stream_1_sample_3_data = (s_axis[1].tdata[111:104] + s_axis[1].tdata[127:120] + 1)>>1;  //round
wire [31:0] stream_1_tdata = {stream_1_sample_3_data, stream_1_sample_2_data, stream_1_sample_1_data, stream_1_sample_0_data};

wire [7:0]  stream_2_sample_0_data = (s_axis[2].tdata[15:8] + s_axis[2].tdata[31:24] + 1)>>1;  //round
wire [7:0]  stream_2_sample_1_data = (s_axis[2].tdata[47:40] + s_axis[2].tdata[63:56] + 1)>>1;  //round
wire [7:0]  stream_2_sample_2_data = (s_axis[2].tdata[79:72] + s_axis[2].tdata[95:88] + 1)>>1;  //round
wire [7:0]  stream_2_sample_3_data = (s_axis[2].tdata[111:104] + s_axis[2].tdata[127:120] + 1)>>1;  //round
wire [31:0] stream_2_tdata = {stream_2_sample_3_data, stream_2_sample_2_data, stream_2_sample_1_data, stream_2_sample_0_data};

wire [7:0]  stream_3_sample_0_data = (s_axis[3].tdata[15:8] + s_axis[3].tdata[31:24] + 1)>>1;  //round
wire [7:0]  stream_3_sample_1_data = (s_axis[3].tdata[47:40] + s_axis[3].tdata[63:56] + 1)>>1;  //round
wire [7:0]  stream_3_sample_2_data = (s_axis[3].tdata[79:72] + s_axis[3].tdata[95:88] + 1)>>1;  //round
wire [7:0]  stream_3_sample_3_data = (s_axis[3].tdata[111:104] + s_axis[3].tdata[127:120] + 1)>>1;  //round
wire [31:0] stream_3_tdata = {stream_3_sample_3_data, stream_3_sample_2_data, stream_3_sample_1_data, stream_3_sample_0_data};

wire [7:0]  stream_4_sample_0_data = (s_axis[4].tdata[15:8] + s_axis[4].tdata[31:24] + 1)>>1;  //round
wire [7:0]  stream_4_sample_1_data = (s_axis[4].tdata[47:40] + s_axis[4].tdata[63:56] + 1)>>1;  //round
wire [7:0]  stream_4_sample_2_data = (s_axis[4].tdata[79:72] + s_axis[4].tdata[95:88] + 1)>>1;  //round
wire [7:0]  stream_4_sample_3_data = (s_axis[4].tdata[111:104] + s_axis[4].tdata[127:120] + 1)>>1;  //round
wire [31:0] stream_4_tdata = {stream_4_sample_3_data, stream_4_sample_2_data, stream_4_sample_1_data, stream_4_sample_0_data};

wire [7:0]  stream_5_sample_0_data = (s_axis[5].tdata[15:8] + s_axis[5].tdata[31:24] + 1)>>1;  //round
wire [7:0]  stream_5_sample_1_data = (s_axis[5].tdata[47:40] + s_axis[5].tdata[63:56] + 1)>>1;  //round
wire [7:0]  stream_5_sample_2_data = (s_axis[5].tdata[79:72] + s_axis[5].tdata[95:88] + 1)>>1;  //round
wire [7:0]  stream_5_sample_3_data = (s_axis[5].tdata[111:104] + s_axis[5].tdata[127:120] + 1)>>1;  //round
wire [31:0] stream_5_tdata = {stream_5_sample_3_data, stream_5_sample_2_data, stream_5_sample_1_data, stream_5_sample_0_data};

// if write_start = 0, ignore all axis
wire write_start_sync0, write_start_sync1, write_start_sync2;
xpm_cdc_single #(
    .DEST_SYNC_FF(2),   // 同步寄存器级数，通常2-4
    .INIT_SYNC_FF(0),   // 0=禁用初始同步，1=启用
    .SIM_ASSERT_CHK(0), // 0=禁用仿真检查，1=启用
    .SRC_INPUT_REG(1)   // 0=无输入寄存器，1=有输入寄存器
) u_write_start_sync0 (
    .src_clk            (axilite_clk),      // 源时钟 (可选，如果SRC_INPUT_REG=1)
    .src_in             (write_start),        // 输入信号
    .dest_clk           (rf_clk0),           // 目标时钟
    .dest_out           (write_start_sync0)          // 同步后的输出信号
);
xpm_cdc_single #(
    .DEST_SYNC_FF(2),   // 同步寄存器级数，通常2-4
    .INIT_SYNC_FF(0),   // 0=禁用初始同步，1=启用
    .SIM_ASSERT_CHK(0), // 0=禁用仿真检查，1=启用
    .SRC_INPUT_REG(1)   // 0=无输入寄存器，1=有输入寄存器
) u_write_start_sync1 (
    .src_clk            (axilite_clk),      // 源时钟 (可选，如果SRC_INPUT_REG=1)
    .src_in             (write_start),        // 输入信号
    .dest_clk           (rf_clk1),           // 目标时钟
    .dest_out           (write_start_sync1)          // 同步后的输出信号
);
xpm_cdc_single #(
    .DEST_SYNC_FF(2),   // 同步寄存器级数，通常2-4
    .INIT_SYNC_FF(0),   // 0=禁用初始同步，1=启用
    .SIM_ASSERT_CHK(0), // 0=禁用仿真检查，1=启用
    .SRC_INPUT_REG(1)   // 0=无输入寄存器，1=有输入寄存器
) u_write_start_sync2 (
    .src_clk            (axilite_clk),      // 源时钟 (可选，如果SRC_INPUT_REG=1)
    .src_in             (write_start),        // 输入信号
    .dest_clk           (rf_clk2),           // 目标时钟
    .dest_out           (write_start_sync2)          // 同步后的输出信号
);

wire stream_0_tready, stream_1_tready, stream_2_tready;
wire stream_3_tready, stream_4_tready, stream_5_tready;
wire stream_0_tvalid = write_start_sync0 ? s_axis[0].tvalid : 1'b0;
wire stream_1_tvalid = write_start_sync0 ? s_axis[1].tvalid : 1'b0;
wire stream_2_tvalid = write_start_sync1 ? s_axis[2].tvalid : 1'b0;
wire stream_3_tvalid = write_start_sync1 ? s_axis[3].tvalid : 1'b0;
wire stream_4_tvalid = write_start_sync2 ? s_axis[4].tvalid : 1'b0;
wire stream_5_tvalid = write_start_sync2 ? s_axis[5].tvalid : 1'b0;
assign s_axis[0].tready = write_start_sync0 ? stream_0_tready : 1'b1;
assign s_axis[1].tready = write_start_sync0 ? stream_1_tready : 1'b1;
assign s_axis[2].tready = write_start_sync1 ? stream_2_tready : 1'b1;
assign s_axis[3].tready = write_start_sync1 ? stream_3_tready : 1'b1;
assign s_axis[4].tready = write_start_sync2 ? stream_4_tready : 1'b1;
assign s_axis[5].tready = write_start_sync2 ? stream_5_tready : 1'b1;

// 2. each axis async fifo, depth = 128
STREAM #(32) fifo_stream[6]();
axis_data_afifo_32b u_stream_0_fifo (
    .s_axis_aresetn                 (rf_rstb0),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk0),           // input wire s_axis_aclk
    .s_axis_tvalid                  (stream_0_tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (stream_0_tready),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_0_tdata),       // input wire [31 : 0] s_axis_tdata
    .m_axis_aclk                    (ps_clk),               // input wire m_axis_aclk
    .m_axis_tvalid                  (fifo_stream[0].tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_stream[0].tready),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_stream[0].tdata)      // output wire [31 : 0] m_axis_tdata
);

axis_data_afifo_32b u_stream_1_fifo (
    .s_axis_aresetn                 (rf_rstb0),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk0),           // input wire s_axis_aclk
    .s_axis_tvalid                  (stream_1_tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (stream_1_tready),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_1_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_aclk                    (ps_clk),               // input wire m_axis_aclk
    .m_axis_tvalid                  (fifo_stream[1].tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_stream[1].tready),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_stream[1].tdata)      // output wire [31 : 0] m_axis_tdata
);

axis_data_afifo_32b u_stream_2_fifo (
    .s_axis_aresetn                 (rf_rstb1),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk1),           // input wire s_axis_aclk
    .s_axis_tvalid                  (stream_2_tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (stream_2_tready),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_2_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_aclk                    (ps_clk),               // input wire m_axis_aclk
    .m_axis_tvalid                  (fifo_stream[2].tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_stream[2].tready),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_stream[2].tdata)      // output wire [31 : 0] m_axis_tdata
);

axis_data_afifo_32b u_stream_3_fifo (
    .s_axis_aresetn                 (rf_rstb1),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk1),           // input wire s_axis_aclk
    .s_axis_tvalid                  (stream_3_tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (stream_3_tready),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_3_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_aclk                    (ps_clk),               // input wire m_axis_aclk
    .m_axis_tvalid                  (fifo_stream[3].tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_stream[3].tready),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_stream[3].tdata)      // output wire [31 : 0] m_axis_tdata
);

axis_data_afifo_32b u_stream_4_fifo (
    .s_axis_aresetn                 (rf_rstb2),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk2),           // input wire s_axis_aclk
    .s_axis_tvalid                  (stream_4_tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (stream_4_tready),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_4_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_aclk                    (ps_clk),               // input wire m_axis_aclk
    .m_axis_tvalid                  (fifo_stream[4].tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_stream[4].tready),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_stream[4].tdata)      // output wire [31 : 0] m_axis_tdata
);

axis_data_afifo_32b u_stream_5_fifo (
    .s_axis_aresetn                 (rf_rstb2),          // input wire s_axis_aresetn
    .s_axis_aclk                    (rf_clk2),           // input wire s_axis_aclk
    .s_axis_tvalid                  (stream_5_tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (stream_5_tready),    // output wire s_axis_tready
    .s_axis_tdata                   (stream_5_tdata),   // input wire [31 : 0] s_axis_tdata
    .m_axis_aclk                    (ps_clk),               // input wire m_axis_aclk
    .m_axis_tvalid                  (fifo_stream[5].tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (fifo_stream[5].tready),    // input wire m_axis_tready
    .m_axis_tdata                   (fifo_stream[5].tdata)      // output wire [31 : 0] m_axis_tdata
);

// 3. merge all axis data to one stream
STREAM #(192) cbout_axis();
assign cbout_axis.tvalid = fifo_stream[0].tvalid & fifo_stream[1].tvalid & fifo_stream[2].tvalid & fifo_stream[3].tvalid & fifo_stream[4].tvalid & fifo_stream[5].tvalid;
assign fifo_stream[0].tready = cbout_axis.tvalid & cbout_axis.tready;
assign fifo_stream[1].tready = cbout_axis.tvalid & cbout_axis.tready;
assign fifo_stream[2].tready = cbout_axis.tvalid & cbout_axis.tready;
assign fifo_stream[3].tready = cbout_axis.tvalid & cbout_axis.tready;
assign fifo_stream[4].tready = cbout_axis.tvalid & cbout_axis.tready;
assign fifo_stream[5].tready = cbout_axis.tvalid & cbout_axis.tready;
wire [191:0] merge_tdata = {fifo_stream[5].tdata, fifo_stream[4].tdata, fifo_stream[3].tdata, fifo_stream[2].tdata, fifo_stream[1].tdata, fifo_stream[0].tdata};

// 4. reorder data
assign cbout_axis.tdata = {merge_tdata[191:184], merge_tdata[159:152], merge_tdata[127:120], merge_tdata[95:88], merge_tdata[63:56], merge_tdata[31:24], 
                           merge_tdata[183:176], merge_tdata[151:144], merge_tdata[119:112], merge_tdata[87:80], merge_tdata[55:48], merge_tdata[23:16],
                           merge_tdata[175:168], merge_tdata[143:136], merge_tdata[111:104], merge_tdata[79:72], merge_tdata[47:40], merge_tdata[15:8],
                           merge_tdata[167:160], merge_tdata[135:128], merge_tdata[103:96],  merge_tdata[71:64], merge_tdata[39:32], merge_tdata[7:0]};

// 5. change bit width from 192 to 128
STREAM #(128) dw_axis();
axis_dwidth_converter_wr u_axis_dwidth_converter_wr (
    .aclk                           (ps_clk),               // input wire aclk
    .aresetn                        (ps_rstb),              // input wire aresetn
    .s_axis_tvalid                  (cbout_axis.tvalid),         // input wire s_axis_tvalid
    .s_axis_tready                  (cbout_axis.tready),         // output wire s_axis_tready
    .s_axis_tdata                   (cbout_axis.tdata),          // input wire [191 : 0] s_axis_tdata
    .m_axis_tvalid                  (dw_axis.tvalid),       // output wire m_axis_tvalid
    .m_axis_tready                  (dw_axis.tready),       // input wire m_axis_tready
    .m_axis_tdata                   (dw_axis.tdata)         // output wire [127 : 0] m_axis_tdata
);

//6. add fifo, depth=128
STREAM #(128) dma_axis();
axis_data_fifo_128b u_axis_fifo_dma (
    .s_axis_aresetn                 (ps_rstb),           // input wire s_axis_aresetn
    .s_axis_aclk                    (ps_clk),          // input wire s_axis_aclk
    .s_axis_tvalid                  (dw_axis.tvalid),    // input wire s_axis_tvalid
    .s_axis_tready                  (dw_axis.tready),    // output wire s_axis_tready
    .s_axis_tdata                   (dw_axis.tdata),      // input wire [127 : 0] s_axis_tdata
    .m_axis_tvalid                  (dma_axis.tvalid),    // output wire m_axis_tvalid
    .m_axis_tready                  (dma_axis.tready),    // input wire m_axis_tready
    .m_axis_tdata                   (dma_axis.tdata)      // output wire [127 : 0] m_axis_tdata
);

// if write_start = 0, ignore all stream
wire write_start_ps;
xpm_cdc_single #(
    .DEST_SYNC_FF(2),   // 同步寄存器级数，通常2-4
    .INIT_SYNC_FF(0),   // 0=禁用初始同步，1=启用
    .SIM_ASSERT_CHK(0), // 0=禁用仿真检查，1=启用
    .SRC_INPUT_REG(1)   // 0=无输入寄存器，1=有输入寄存器
) u_write_start_ps (
    .src_clk            (axilite_clk),      // 源时钟 (可选，如果SRC_INPUT_REG=1)
    .src_in             (write_start),        // 输入信号
    .dest_clk           (ps_clk),           // 目标时钟
    .dest_out           (write_start_ps)          // 同步后的输出信号
);

STREAM #(128) dma_axis_mux();
assign dma_axis_mux.tdata = dma_axis.tdata;
assign dma_axis_mux.tvalid = write_start_ps ? dma_axis.tvalid : 1'b0;
assign dma_axis.tready = write_start_ps ? dma_axis_mux.tready : 1'b1;

// 7. axi_dma_wr to move data to ddr
axi_dma_wr u_axi_dma_wr (
    // clock & reset
    .axi_aclk                       (ps_clk),
    .axi_rstb                       (ps_rstb),
    .axilite_clk                    (axilite_clk),
    .axilite_rstb                   (axilite_rstb),

    // axi4 master write
    .m_axi                          (m_axi),

    // axis
    .s_axis                         (dma_axis_mux),

    // status
    .datamover_status               (datamover_status),
    .current_addr                   (current_addr),
    .run_cycles                     (run_cycles),
    .wr_mm2s_err                    (wr_mm2s_err),
    .cap_done                       (cap_done),

    // regs
    .write_start                    (write_start),
    .write_reset                    (write_reset),
    .start_address                  (start_address),
    .cap_size                       (cap_size)
);

endmodule
