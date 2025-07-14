`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module spim_controller(

    output              [7:0]       rx_data,
    output                          rx_status,

    input                           clk, rstb,
    input               [15:0]      div_n,
    input               [23:0]      spim_ctrl,
    input                           spim_transfer,
    SPI_BUS.master                  m_spi
);

// tx fifo packets
logic                       txfifo_wr_en;
logic                       txfifo_full;
logic                       txfifo_rd_en;
logic                       txfifo_data_valid;
logic                       txfifo_empty;
















SPI_Master #(
    .MODE                   (0)
) U_SPIM(
    .clk                    (clk),
    .rst                    (~rstb),
    .div_n                  (regs.div_n),
    .tx_dat                 (),
    .tx_lst                 (),
    .tx_vld                 (),
    .tx_rdy                 (),
    .rx_dat                 (),
    .rx_vld                 (),
    .m_spi                  (m_spi)
);




endmodule
