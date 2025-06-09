/**
 * @file AXI_DMA_WR.sv
 * @author ftl (ftl@gaosuxiangji.com)
 * @brief 
 * @version 0.1
 * @date 2024-03-11
 * 
 * @copyright Copyright (c) 2024
 * @ note
 */

`timescale 1ns / 1ps

module AXI_DMA_WR #(
    parameter AXI_DATA_WIDTH            = 1024                  ,//AXI data位宽
    parameter WR_ADDR_WIDTH             = 32                     //wr_addr位宽
)(
    input  logic                        clk                     ,//input 1-bit clk
    input  logic                        rst                     ,//input 1-bit rst
    STREAM.slave                        s_stream                ,//STREAM.slave
    AXI4.master                         m_axi_wr                ,//AXI4.master 
    input  logic [WR_ADDR_WIDTH-1:0]    wr_addr                 ,//input 32-bit addr对齐m_axi_wr位宽
    input  logic [31:0]                 wr_size                 ,//input 32-bit size对齐m_axi_wr位宽
    input  logic                        wr_eof                  ,//input 1-bit 是否使用tlast检测error
    input  logic                        wr_vld                  ,//input 1-bit
    output logic                        wr_rdy                  ,//output 1-bit
    output logic                        wr_err                   //output 1-bit
);

    localparam AXI_SHIFT                = $clog2(AXI_DATA_WIDTH/8) ;

    STREAM #(.WIDTH(80))                dma_wr_cmd()            ;
    STREAM #(.WIDTH(8))                 dma_wr_sts()            ;
    logic                               dma_s2mm_err            ;
    logic                               dma_busy = 1'b0         ;
    logic                               dma_wr_ok               ;
    logic                               dma_wr_err              ;

    logic [3:0]                         cmd_TAG                 ;
    logic [39:0]                        cmd_SADDR               ;
    logic                               cmd_EOF                 ;
    logic [22:0]                        cmd_BTT                 ;

    assign wr_rdy               = ~dma_busy                     ;

    assign dma_wr_sts.tready    = 1'b1                          ;
    assign dma_wr_ok            = dma_wr_sts.tvalid & (dma_wr_sts.tdata=={4'd8,cmd_TAG});
    assign dma_wr_err           = dma_wr_sts.tvalid & (dma_wr_sts.tdata!={4'd8,cmd_TAG});
    assign cmd_TAG              = 4'd1                          ;
    assign dma_wr_cmd.tdata     = {4'd0, cmd_TAG, cmd_SADDR, 1'b0, cmd_EOF, 6'd0, 1'b1, cmd_BTT};

    always @(posedge clk) begin
        if(rst)
            dma_wr_cmd.tvalid   <= 1'b0                         ;
        else if(wr_vld && wr_rdy)
            dma_wr_cmd.tvalid   <= 1'b1                         ;
        else if(dma_wr_cmd.tready)
            dma_wr_cmd.tvalid   <= 1'b0                         ;
    end

    always @(posedge clk) begin
        if(rst) begin
            cmd_BTT     <= 23'd0                                ;
            cmd_SADDR   <= 32'd0                                ;
            cmd_EOF     <= 1'b0                                 ;
        end
        else if(wr_vld && wr_rdy) begin
            cmd_BTT     <= wr_size << AXI_SHIFT                 ;
            cmd_SADDR   <= wr_addr << AXI_SHIFT                 ;
            cmd_EOF     <= wr_eof                               ;
        end
    end

    always @(posedge clk) begin
        if(rst)
            dma_busy <= 1'b0                                    ;
        else if(wr_vld && wr_rdy)
            dma_busy <= 1'b1                                    ;
        else if(dma_wr_sts.tvalid)
            dma_busy <= 1'b0                                    ;
    end

    always @(posedge clk) begin
        if(rst)
            wr_err <= 1'b0                                      ;
        else if(wr_vld && wr_rdy)
            wr_err <= 1'b0                                      ;
        else if(dma_wr_err || dma_s2mm_err)
            wr_err <= 1'b1                                      ;
    end

    AXI_Datamover_WR1024 dm_wr_inst (
        //s2mm clk reset [write]
        .m_axi_s2mm_aclk            (clk                        ),// input wire m_axi_s2mm_aclk
        .m_axi_s2mm_aresetn         (~rst                       ),// input wire m_axi_s2mm_aresetn
        .m_axis_s2mm_cmdsts_awclk   (clk                        ),// input wire m_axis_s2mm_cmdsts_awclk
        .m_axis_s2mm_cmdsts_aresetn (~rst                       ),// input wire m_axis_s2mm_cmdsts_aresetn
        .s2mm_err                   (dma_s2mm_err               ),// output wire s2mm_err
        //s2mm_cmd [write]
        .s_axis_s2mm_cmd_tvalid     (dma_wr_cmd.tvalid          ),// input wire s_axis_s2mm_cmd_tvalid
        .s_axis_s2mm_cmd_tready     (dma_wr_cmd.tready          ),// output wire s_axis_s2mm_cmd_tready
        .s_axis_s2mm_cmd_tdata      (dma_wr_cmd.tdata           ),// input wire [79 : 0] s_axis_s2mm_cmd_tdata
        //s2mm_status [write]
        .m_axis_s2mm_sts_tvalid     (dma_wr_sts.tvalid          ),// output wire m_axis_s2mm_sts_tvalid
        .m_axis_s2mm_sts_tready     (dma_wr_sts.tready          ),// input wire m_axis_s2mm_sts_tready
        .m_axis_s2mm_sts_tdata      (dma_wr_sts.tdata           ),// output wire [7 : 0] m_axis_s2mm_sts_tdata
        .m_axis_s2mm_sts_tkeep      (dma_wr_sts.tkeep           ),// output wire [0 : 0] m_axis_s2mm_sts_tkeep
        .m_axis_s2mm_sts_tlast      (dma_wr_sts.tlast           ),// output wire m_axis_s2mm_sts_tlast
        //s2mm_axi [write]
        .m_axi_s2mm_awid            (m_axi_wr.awid              ),// output wire [3 : 0] m_axi_s2mm_awid
        .m_axi_s2mm_awaddr          (m_axi_wr.awaddr            ),// output wire [36 : 0] m_axi_s2mm_awaddr
        .m_axi_s2mm_awlen           (m_axi_wr.awlen             ),// output wire [7 : 0] m_axi_s2mm_awlen
        .m_axi_s2mm_awsize          (m_axi_wr.awsize            ),// output wire [2 : 0] m_axi_s2mm_awsize
        .m_axi_s2mm_awburst         (m_axi_wr.awburst           ),// output wire [1 : 0] m_axi_s2mm_awburst
        .m_axi_s2mm_awprot          (m_axi_wr.awprot            ),// output wire [2 : 0] m_axi_s2mm_awprot
        .m_axi_s2mm_awcache         (m_axi_wr.awcache           ),// output wire [3 : 0] m_axi_s2mm_awcache
        .m_axi_s2mm_awuser          (                           ),// output wire [3 : 0] m_axi_s2mm_awuser
        .m_axi_s2mm_awvalid         (m_axi_wr.awvalid           ),// output wire m_axi_s2mm_awvalid
        .m_axi_s2mm_awready         (m_axi_wr.awready           ),// input wire m_axi_s2mm_awready
        .m_axi_s2mm_wdata           (m_axi_wr.wdata             ),// output wire [511 : 0] m_axi_s2mm_wdata
        .m_axi_s2mm_wstrb           (m_axi_wr.wstrb             ),// output wire [63 : 0] m_axi_s2mm_wstrb
        .m_axi_s2mm_wlast           (m_axi_wr.wlast             ),// output wire m_axi_s2mm_wlast
        .m_axi_s2mm_wvalid          (m_axi_wr.wvalid            ),// output wire m_axi_s2mm_wvalid
        .m_axi_s2mm_wready          (m_axi_wr.wready            ),// input wire m_axi_s2mm_wready
        .m_axi_s2mm_bresp           (m_axi_wr.bresp             ),// input wire [1 : 0] m_axi_s2mm_bresp
        .m_axi_s2mm_bvalid          (m_axi_wr.bvalid            ),// input wire m_axi_s2mm_bvalid
        .m_axi_s2mm_bready          (m_axi_wr.bready            ),// output wire m_axi_s2mm_bready
        //s2mm stream slave [write]
        .s_axis_s2mm_tdata          (s_stream.tdata             ),// input wire [511 : 0] s_axis_s2mm_tdata
        .s_axis_s2mm_tkeep          (s_stream.tkeep             ),// input wire [63 : 0] s_axis_s2mm_tkeep
        .s_axis_s2mm_tlast          (s_stream.tlast             ),// input wire s_axis_s2mm_tlast
        .s_axis_s2mm_tvalid         (s_stream.tvalid            ),// input wire s_axis_s2mm_tvalid
        .s_axis_s2mm_tready         (s_stream.tready            ) // output wire s_axis_s2mm_tready
    );

    assign m_axi_wr.awlock = 1'b0;
    assign m_axi_wr.awqos  = 4'd0;
    
endmodule
