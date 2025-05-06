`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// used for generate axis cmd
// cmd[71:0]
// [71:64] Reserved 
// [63:32] Address
// [31] Type, 0=MM2S, 1=S2MM
// [30] EOF, End of Frame
// [29:24] Reserved 
// [23] SOF, Start of Frame
// [22:0] BTT, Burst Type and Transfer Length

module axis_cmd_gen_mm2s #(
    parameter BTT_WIDTH = 23,       // BTT字段宽度
    parameter MAX_BURST_LEN = 512   // 最大突发长度（字节）, 256*128bit
)(
    input                       clk,
    input                       resetn,
    
    output reg      [71:0]      m_axis_tdata,
    output reg                  m_axis_tvalid,
    input                       m_axis_tready,
    output                      m_axis_tlast,

    input                       read_start,
    input                       read_reset,
    input           [31:0]      base_addr,
    input           [31:0]      cap_size
);

// 状态定义
localparam  IDLE        = 2'd0;
localparam  SEND_CMD    = 2'd1;
localparam  WAIT_READY  = 2'd2;

reg  [1:0]  state;
reg  [31:0] current_addr;
reg  [31:0] remaining_size;

// 计算每次传输的实际大小（不超过MAX_BURST_LEN）
wire [31:0] transfer_size = (remaining_size > MAX_BURST_LEN) ? MAX_BURST_LEN : remaining_size;

// 命令格式组装
wire [BTT_WIDTH-1:0] btt = transfer_size[BTT_WIDTH-1:0];
wire [71:0] cmd = {
    4'b0000,        // 保留
    4'b0000,        // 保留
    current_addr,   // 当前地址
    1'b0,           // 类型：0=MM2S（内存到流）
    1'b1,           // EOF
    6'b000000,      // 保留
    1'b1,           // SOF
    btt             // BTT字段
};

assign m_axis_tlast = 1'b1;  // 每个命令都是单独的包

always @(posedge clk) begin
    if (!resetn) begin
        state <= IDLE;
        m_axis_tvalid <= 1'b0;
        m_axis_tdata <= 0;
        current_addr <= 0;
        remaining_size <= 0;
    end else if(read_reset) begin
        // 同步软件复位
        state <= IDLE;
        m_axis_tvalid <= 1'b0;
        m_axis_tdata <= 0;
        current_addr <= base_addr;  // 复位到基地址
        remaining_size <= cap_size; // 复位到总容量
    end else begin
        case (state)
            IDLE: begin
                if (read_start) begin
                    current_addr <= base_addr;
                    remaining_size <= cap_size;
                    state <= SEND_CMD;
                end
            end
            
            SEND_CMD: begin
                m_axis_tdata <= cmd;
                m_axis_tvalid <= 1'b1;
                state <= WAIT_READY;
            end
            
            WAIT_READY: begin
                if (m_axis_tready && m_axis_tvalid) begin
                    m_axis_tvalid <= 1'b0;
                    
                    // 更新地址和剩余大小
                    current_addr <= current_addr + transfer_size;
                    remaining_size <= remaining_size - transfer_size;
                    
                    // 检查是否到达末尾
                    if (remaining_size <= transfer_size) begin
                        // 回到起始地址重新开始
                        current_addr <= base_addr;
                        remaining_size <= cap_size;
                    end
                    
                    state <= SEND_CMD;
                end
            end
        endcase
    end
end

endmodule