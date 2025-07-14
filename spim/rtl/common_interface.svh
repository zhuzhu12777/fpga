`ifndef _COMMON_INTERFACE_SVH_
`define _COMMON_INTERFACE_SVH_

`timescale 1ns/1ps

interface STREAM #(
    parameter WIDTH = 512
)();
    logic [WIDTH-1:0]       tdata       ;
    logic [WIDTH/8-1:0]     tkeep       ;
    logic                   tlast       ;
    logic                   tvalid      ;
    logic                   tready      ;
    modport master(
        input  tready,
        output tdata, tkeep, tlast, tvalid
    );
    modport slave(
        output tready,
        input  tdata, tkeep, tlast, tvalid
    );
endinterface

interface SPI_BUS ();
    logic       csn     ;
    logic       sck     ;
    logic       mosi    ;
    logic       miso    ;
    modport master(output csn, sck, mosi, input  miso);
    modport slave (input  csn, sck, mosi, output miso);
endinterface

interface AXI4Lite #(
    parameter ADDR_WIDTH        = 32        ,
    parameter DATA_WIDTH        = 32
)();
    logic [ADDR_WIDTH-1:0]      awaddr      ;
    logic [2:0]                 awprot      ;
    logic                       awvalid     ;
    logic                       awready     ;
    logic [DATA_WIDTH-1:0]      wdata       ;
    logic [DATA_WIDTH/8-1:0]    wstrb       ;
    logic                       wvalid      ;
    logic                       wready      ;
    logic [1:0]                 bresp       ;
    logic                       bvalid      ;
    logic                       bready      ;
    logic [ADDR_WIDTH-1:0]      araddr      ;
    logic [2:0]                 arprot      ;
    logic                       arvalid     ;
    logic                       arready     ;
    logic [DATA_WIDTH-1:0]      rdata       ;
    logic [1:0]                 rresp       ;
    logic                       rvalid      ;
    logic                       rready      ;
    
    modport master(
        output awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready,
               araddr, arprot, arvalid, rready,
        input  awready, wready, bresp, bvalid,
               arready, rdata, rresp, rvalid
    );
    modport slave(
        input  awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready,
               araddr, arprot, arvalid, rready,
        output awready, wready, bresp, bvalid,
               arready, rdata, rresp, rvalid
    );
endinterface

interface APB4 #(
    parameter ADDR_WIDTH = 32,    // Address bus width
    parameter DATA_WIDTH = 32     // Data bus width
)();
    logic [ADDR_WIDTH-1:0]      paddr;      // Address
    logic                       psel;       // Select (expanded from SEL_WIDTH for clarity)
    logic                       penable;    // Enable
    logic                       pwrite;     // Write/read control
    logic [DATA_WIDTH-1:0]      pwdata;     // Write data
    logic [DATA_WIDTH/8-1:0]    pstrb;     // Write strobe
    logic [2:0]                 pprot;
    logic [DATA_WIDTH-1:0]      prdata;     // Read data
    logic                       pready;     // Ready from slave
    logic                       pslverr;    // Error response

    modport master(
        output paddr, psel, penable, pwrite, pwdata, pstrb, pprot,
        input  prdata, pready, pslverr
    );
    modport slave(
        input  paddr, psel, penable, pwrite, pwdata, pstrb, pprot,
        output prdata, pready, pslverr
    );
endinterface


interface SPIM_REGS();
    logic [23:0] spim_ctrl[0:15];
    logic [15:0] spim_transfer;
    logic [15:0] spim_load;

    logic [7:0]  rx_data[0:15];
    logic [15:0] rx_status;

    logic [15:0] div_n;


    modport master(
        output spim_ctrl, spim_transfer, spim_load, div_n,
        input  rx_data, rx_status
    );

endinterface



`endif
