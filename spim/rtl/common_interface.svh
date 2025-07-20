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

interface AXI4 #(
    parameter ID_WIDTH          = 4         ,
    parameter ADDR_WIDTH        = 32        ,
    parameter DATA_WIDTH        = 256
)();
    logic [ID_WIDTH-1:0]        awid        ;
    logic [ADDR_WIDTH-1:0]      awaddr      ;
    logic [7:0]                 awlen       ;
    logic [2:0]                 awsize      ;
    logic [1:0]                 awburst     ;
    logic [0:0]                 awlock      ;
    logic [3:0]                 awcache     ;
    logic [2:0]                 awprot      ;
    logic [3:0]                 awregion    ;
    logic [3:0]                 awqos       ;
    logic                       awvalid     ;
    logic                       awready     ;
    logic [DATA_WIDTH-1:0]      wdata       ;
    logic [DATA_WIDTH/8-1:0]    wstrb       ;
    logic                       wlast       ;
    logic                       wvalid      ;
    logic                       wready      ;
    logic [ID_WIDTH-1:0]        bid         ;
    logic [1:0]                 bresp       ;
    logic                       bvalid      ;
    logic                       bready      ;
    logic [ID_WIDTH-1:0]        arid        ;
    logic [ADDR_WIDTH-1:0]      araddr      ;
    logic [7:0]                 arlen       ;
    logic [2:0]                 arsize      ;
    logic [1:0]                 arburst     ;
    logic [0:0]                 arlock      ;
    logic [3:0]                 arcache     ;
    logic [2:0]                 arprot      ;
    logic [3:0]                 arregion    ;
    logic [3:0]                 arqos       ;
    logic                       arvalid     ;
    logic                       arready     ;
    logic [ID_WIDTH-1:0]        rid         ;
    logic [1:0]                 rresp       ;
    logic [DATA_WIDTH-1:0]      rdata       ;
    logic                       rlast       ;
    logic                       rvalid      ;
    logic                       rready      ;
    modport master(
        output awid    , awaddr , awlen   , awsize , awburst, awlock ,
               awcache , awprot , awregion, awqos  , awvalid,
               wdata   , wstrb  , wlast   , wvalid , bready ,
               arid    , araddr , arlen   , arsize , arburst, arlock ,
               arcache , arprot , arregion, arqos  , arvalid, rready ,
        input  awready , wready , bid     , bresp  , bvalid ,
               arready , rid    , rresp   , rdata  , rlast  , rvalid 
    );
    modport slave(
        input  awid    , awaddr , awlen   , awsize , awburst, awlock ,
               awcache , awprot , awregion, awqos  , awvalid,
               wdata   , wstrb  , wlast   , wvalid , bready ,
               arid    , araddr , arlen   , arsize , arburst, arlock ,
               arcache , arprot , arregion, arqos  , arvalid, rready ,
        output awready , wready , bid     , bresp  , bvalid ,
               arready , rid    , rresp   , rdata  , rlast  , rvalid 
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

`endif
