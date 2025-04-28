
`timescale 1ns/1ps

module fifo(
    input                   clk,
    input                   resetn
);

wire    wr_clk, rd_clk;
wire    rstb;

wire    clk_buf;
BUFG BUFG_inst (
    .O (clk_buf),
    .I (clk)
);

clk_wiz_0 clk_wiz_inst (
    .clk_in1(clk_buf), // 25Mhz
    .clk_out1(wr_clk), // 75Mhz
    .clk_out2(rd_clk), // 100Mhz
    .reset(~resetn),
    .locked(rstb)
);

parameter IDLE = 2'b00;
parameter WR   = 2'b01;
parameter RD   = 2'b10;

reg [7:0] cnt, wcnt, rcnt;
parameter CNT_MAX = 8'd255;
parameter WCNT_MAX = 8'd79;
parameter RCNT_MAX = 8'd59;

always @(posedge wr_clk or negedge rstb) begin
    if(!rstb) begin
        cnt <= 8'd0;
    end else if(state == IDLE) begin
        if(cnt == CNT_MAX) begin
            cnt <= 8'd0;
        end else begin
            cnt <= cnt + 1'b1;
        end
    end else begin
        cnt <= 8'd0;
    end
end

always @(posedge wr_clk or negedge rstb) begin
    if(!rstb) begin
        wcnt <= 8'd0;
    end else if(state == WR) begin
        if(wcnt == WCNT_MAX) begin
            wcnt <= 8'd0;
        end else begin
            wcnt <= wcnt + 1'b1;
        end
    end else begin
        wcnt <= 8'd0;
    end
end

reg rd_done;
wire rd_done_sync;
always @(posedge rd_clk or negedge rstb) begin
    if(!rstb) begin
        rcnt <= 8'd0;
        rd_done <= 1'b0;
    end else if(state == RD) begin
        if(rcnt == RCNT_MAX) begin
            rcnt <= 8'd0;
            rd_done <= 1'b1;
        end else begin
            rcnt <= rcnt + 1'b1;
            rd_done <= 1'b0;
        end
    end else begin
        rcnt <= 8'd0;
        rd_done <= 1'b0;
    end
end

sync #(
    .WIDTH(1)
) sync_inst (
    .clk(wr_clk),
    .rst_n(rstb),
    .din(rd_done),
    .dout(rd_done_sync)
);

reg [1:0] state, next_state;
always @(posedge clk or negedge rstb) begin
    if(!rstb) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

always @(*) begin
    case(state)
        IDLE: begin
            if(cnt == CNT_MAX) begin
                next_state = WR;
            end else begin
                next_state = IDLE;
            end
        end
        WR: begin
            if(wcnt == WCNT_MAX) begin
                next_state = RD;
            end else begin
                next_state = WR;
            end
        end
        RD: begin
            if(rd_done_sync) begin
                next_state = IDLE;
            end else begin
                next_state = RD;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

wire fifo_push, fifo_pop;
wire [15:0] fifo_din, fifo_dout;
wire full, empty;
wire [8:0] rd_data_count, wr_data_count;

fifo_ip u_fifo (
    .rst        (~rstb),                // input rst
    .wr_clk     (wr_clk),               // input wr_clk
    .rd_clk     (rd_clk),               // input rd_clk
    .din        (fifo_din),             // input [15 : 0] din
    .wr_en      (fifo_push),            // input wr_en
    .rd_en      (fifo_pop),             // input rd_en
    .dout       (fifo_dout),            // output [15 : 0] dout
    .full       (full),                 // output full
    .empty      (empty),                // output empty
    .rd_data_count (rd_data_count),     // output [8 : 0] rd_data_count
    .wr_data_count (wr_data_count)      // output [8 : 0] wr_data_count
);

assign fifo_push = (state == WR) && !full;
assign fifo_pop = (state == RD) && !empty;
assign fifo_din = {wcnt+1'b1, wcnt};

ila_m0 ila_wr_fifo(
    .clk        (wr_clk), // input wire clk
    .probe0     (state), // input wire [1:0] probe0
    .probe1     (wcnt), // input wire [7:0] probe1
    .probe2     (fifo_din), // input wire [15:0] probe2
    .probe3     (full), // input wire [0:0] probe3
    .probe4     (wr_data_count) // input wire [8:0] probe4
);

ila_m1 ila_rd_fifo(
    .clk        (rd_clk), // input wire clk
    .probe0     (rcnt), // input wire [7:0] probe0
    .probe1     (fifo_dout), // input wire [15:0] probe1
    .probe2     (empty), // input wire [0:0] probe2
    .probe3     (rd_data_count) // input wire [8:0] probe3
);



endmodule
