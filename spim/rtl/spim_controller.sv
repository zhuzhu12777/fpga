`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module spim_controller(

    output  logic       [7:0]       reg_rx_data,
    output  logic                   reg_rx_valid,
    output  logic                   fifo_overflow,
    output  logic                   spi_done,

    input   logic                   clk, rstb,
    input   logic       [15:0]      div_n,
    input   logic       [23:0]      reg_tx_data,
    input   logic                   reg_tx_valid,
    SPI_BUS.master                  m_spi
);

// tx fifo packets
logic                       tfifo_full;
logic                       tfifo_wr_en;
logic                       tfifo_rd_en;
logic                       tfifo_empty;
logic       [23:0]          tfifo_rdata;
logic                       tfifo_rd_ready;

logic       [23:0]          tfifo_rdata_lat;

assign tfifo_wr_en = reg_tx_valid & ~tfifo_full;
assign tfifo_rd_en = ~tfifo_empty & tfifo_rd_ready;
fifo_256x24b u_spim_cmd_fifo (
    .clk                    (clk),                      // input wire clk
    .srst                   (~rstb),                    // input wire srst
    .din                    (reg_tx_data),              // input wire [23 : 0] din
    .wr_en                  (tfifo_wr_en),              // input wire wr_en
    .rd_en                  (tfifo_rd_en),              // input wire rd_en
    .dout                   (tfifo_rdata),              // output wire [23: 0] dout
    .full                   (tfifo_full),               // output wire full
    .empty                  (tfifo_empty)               // output wire empty
);

always@(posedge clk or negedge rstb) begin
    if (!rstb)
        fifo_overflow <= 1'b0;
    else if(reg_tx_valid & tfifo_full)
        fifo_overflow <= 1'b1;
end

always@(posedge clk or negedge rstb) begin
    if (!rstb)
        tfifo_rdata_lat <= #1 24'd0;
    else if(tfifo_rd_en)
        tfifo_rdata_lat <= tfifo_rdata;
end

// rd data
logic       [7:0]           sel_rx_data;
logic                       sel_rx_valid;
logic       [1:0]           tx_cnt, rx_cnt;
logic                       rd_flag;

logic       [7:0]           spi_tx_data;
logic                       spi_tx_ready;
logic                       spi_tx_valid;
logic                       spi_tx_lst;

always@(posedge clk or negedge rstb) begin
    if (!rstb)
        spi_done <= 1'b1;
    else if(~tfifo_empty)
        spi_done <= 1'b0;
    else if(tx_cnt == 2'd0 && sel_rx_valid)
        spi_done <= 1'b1;
end

assign tfifo_rd_ready = tx_cnt == 2'd0;
assign spi_tx_valid = tx_cnt != 2'd0;
assign spi_tx_lst = tx_cnt == 2'd1;
always@(posedge clk or negedge rstb) begin
    if (!rstb)
        tx_cnt <= 2'd0;
    else if(tfifo_rd_en)
        tx_cnt <= 2'd3;
    else if(spi_tx_ready && spi_tx_valid)
        tx_cnt <= tx_cnt - 2'd1;
end

always@(*) begin
    case(tx_cnt)
        2'd3: spi_tx_data = tfifo_rdata_lat[23:16];
        2'd2: spi_tx_data = tfifo_rdata_lat[15: 8];
        2'd1: spi_tx_data = tfifo_rdata_lat[ 7: 0];
        default: spi_tx_data = 8'd0;
    endcase
end

always@(posedge clk or negedge rstb) begin
    if (!rstb)
        rx_cnt <= 2'd0;
    else if(sel_rx_valid && rx_cnt == 2'd2)
        rx_cnt <= 2'd0;
    else if(sel_rx_valid)
        rx_cnt <= rx_cnt + 2'd1;
end

always@(posedge clk or negedge rstb) begin
    if (!rstb)
        rd_flag <= 1'b0;
    else if(sel_rx_valid && rx_cnt == 2'd0)
        rd_flag <= tfifo_rdata_lat[23];
    else if(sel_rx_valid && rx_cnt == 2'd2)
        rd_flag <= 1'b0;
end

always@(posedge clk or negedge rstb) begin
    if (!rstb)
        reg_rx_data <= 8'd0;
    else if(sel_rx_valid && rx_cnt == 2'd2)
        reg_rx_data <= sel_rx_data;
end

always@(posedge clk or negedge rstb) begin
    if (!rstb)
        reg_rx_valid <= 1'b0;
    else if(tfifo_rd_en)
        reg_rx_valid <= 1'b0;
    else if(rd_flag && sel_rx_valid && rx_cnt == 2'd2)
        reg_rx_valid <= 1'b1;
end


spim_core #(
    .MODE                   (0)
) u_spim_core(
    .clk                    (clk),
    .rst                    (~rstb),
    .div_n                  (div_n),
    .tx_dat                 (spi_tx_data),
    .tx_lst                 (spi_tx_lst),
    .tx_vld                 (spi_tx_valid),
    .tx_rdy                 (spi_tx_ready),
    .rx_dat                 (sel_rx_data),
    .rx_vld                 (sel_rx_valid),
    .m_spi                  (m_spi)
);


endmodule
