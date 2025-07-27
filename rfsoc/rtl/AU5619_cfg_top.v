`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/29 16:21:24
// Design Name: 
// Module Name: AU5619_cfg_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AU5619_cfg_top(
        input           clk_10m,
        input           arst_n,
        
        output          init_complete,
        
        input           user_cfg_valid,
        input   [31:0]  user_cfg_data,
        output          uesr_rd_valid,
        output  [31:0]  uesr_rd_data,

        output          pll_rstn,
        // input           pll_intrb,
        // input           pll_los_xob,
        // input           pll_flexio14,
        input           m_spi_sdo,
        output          m_spi_sck,
        output          m_spi_ncs,
        output          m_spi_sdi 
    );
        
    wire                rom_cfg_valid ;
    wire        [31:0]  rom_cfg_outbuf;
    (*KEEP = "TRUE"*)wire           cfg_data_valid;
    (*KEEP = "TRUE"*)wire   [31:0]  cfg_data;
    
    (*KEEP = "TRUE"*)wire   [31:0]  rd_data;
    (*KEEP = "TRUE"*)wire           rd_valid;
    
    assign      pll_rstn        = !arst_n;
    
    assign      uesr_rd_valid   = rd_valid;
    assign      uesr_rd_data    = rd_data;
    
    assign      cfg_data_valid  = init_complete ? user_cfg_valid : rom_cfg_valid ;  //if initial finish,user can ctrl device
    assign      cfg_data        = init_complete ? user_cfg_data  : rom_cfg_outbuf;

    AU5619_init_rom u_AU5619_init_rom (
        .arst_n (arst_n),
        .clk_10m(clk_10m),
        
        .init_complete (init_complete),
        .init_cfg_valid(rom_cfg_valid),
        .init_cfg_data (rom_cfg_outbuf)
    );
    
    
    AU5619_spi_if u_AU5619_spi_if (
        .arst_n (arst_n),
        .clk_10m(clk_10m),
        //4 WIRE SPI
        .m_spi_sdo(m_spi_sdo),
        .m_spi_sck(m_spi_sck),
        .m_spi_ncs(m_spi_ncs),
        .m_spi_sdi(m_spi_sdi),
        //user interface
        .spi_cfg_busy(cfg_busy),
        
        .spi_cfg_valid(cfg_data_valid),
        .spi_cfg_data (cfg_data),
        
        .rdback_valid(rd_valid),
        .rdback_data (rd_data)
    );
    
endmodule
