//-----------------------------------------------------------------------------
// Filename:        usp_rf_data_converter_0_axi_lite_ipif.v
// Version:         v1.00.a
// Description:     This is the top level design file for the usp_rf_data_converter_0_axi_lite_ipif
//                  function. It provides a standardized slave interface
//                  between the IP and the AXI. This version supports
//                  single read/write transfers only.  It does not provide
//                  address pipelining or simultaneous read and write
//                  operations.
//-----------------------------------------------------------------------------
// Structure:   This section shows the hierarchical structure of axi_lite_ipif.
//
//              --axi_lite_ipif.v
//                    --slave_attachment.v
//                       --address_decoder.v
//                       --pselect_f.v
//                    --counter_f.v
//-----------------------------------------------------------------------------
// Naming Conventions:
//      active low signals:                     "*_n"
//      clock signals:                          "clk", "clk_div#", "clk_#x"
//      reset signals:                          "rst", "rst_n"
//      generics:                               "C_*"
//      user defined types:                     "*_TYPE"
//      state machine next state:               "*_ns"
//      state machine current state:            "*_cs"
//      combinatorial signals:                  "*_cmb"
//      pipelined or register delay signals:    "*_d#"
//      counter signals:                        "*cnt*"
//      clock enable signals:                   "*_ce"
//      internal version of output port         "*_i"
//      device pins:                            "*_pin"
//      ports:                                  - Names begin with Uppercase
//      processes:                              "*_PROCESS"
//      component instantiations:               "<ENTITY_>I_<#|FUNC>
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//                     Definition of Generics
//-----------------------------------------------------------------------------
// C_S_AXI_DATA_WIDTH    -- AXI data bus width
// C_S_AXI_MIN_SIZE      -- Minimum address range of the IP
// C_USE_WSTRB           -- Use write strobs or not
// C_DPHASE_TIMEOUT      -- Data phase time out counter
// C_NUM_ADDRESS_RANGES  -- Total Number of address ranges
// C_TOTAL_NUM_CE        -- Total number of chip enables in all the ranges
// C_NUM_ADDRESS_RANGES  -- Number of address ranges in C_ARD_ADDR_RANGE_ARRAY
// C_ARD_ADDR_RANGE_ARRAY-- Base /High Address Pair for each Address Range
// C_ARD_NUM_CE_ARRAY    -- Desired number of chip enables for an address range
// C_FAMILY              -- Target FPGA family
//-----------------------------------------------------------------------------
//                  Definition of Ports
//-----------------------------------------------------------------------------
// S_AXI_ACLK            -- AXI Clock
// S_AXI_ARESETN         -- AXI Reset
// S_AXI_AWADDR          -- AXI Write address
// S_AXI_AWVALID         -- Write address valid
// S_AXI_AWREADY         -- Write address ready
// S_AXI_WDATA           -- Write data
// S_AXI_WSTRB           -- Write strobes
// S_AXI_WVALID          -- Write valid
// S_AXI_WREADY          -- Write ready
// S_AXI_BRESP           -- Write response
// S_AXI_BVALID          -- Write response valid
// S_AXI_BREADY          -- Response ready
// S_AXI_ARADDR          -- Read address
// S_AXI_ARVALID         -- Read address valid
// S_AXI_ARREADY         -- Read address ready
// S_AXI_RDATA           -- Read data
// S_AXI_RRESP           -- Read response
// S_AXI_RVALID          -- Read valid
// S_AXI_RREADY          -- Read ready
// Bus2IP_Clk            -- Synchronization clock provided to User IP
// Bus2IP_Reset          -- Active high reset for use by the User IP
// Bus2IP_Addr           -- Desired address of read or write operation
// Bus2IP_RNW            -- Read or write indicator for the transaction
// Bus2IP_BE             -- Byte enables for the data bus
// Bus2IP_CS             -- Chip select for the transcations
// Bus2IP_RdCE           -- Chip enables for the read
// Bus2IP_WrCE           -- Chip enables for the write
// Bus2IP_Data           -- Write data bus to the User IP
// IP2Bus_Data           -- Input Read Data bus from the User IP
// IP2Bus_WrAck          -- Active high Write Data qualifier from the IP
// IP2Bus_RdAck          -- Active high Read Data qualifier from the IP
// IP2Bus_Error          -- Error signal from the IP
//-----------------------------------------------------------------------------
`timescale 1 ps/1 ps
(* DowngradeIPIdentifiedWarnings = "yes" *)
module usp_rf_data_converter_0_axi_lite_ipif
#(
// AXI port dependant parameters
parameter                              C_S_AXI_DATA_WIDTH   = 32,
parameter [31:0]                       C_S_AXI_MIN_SIZE     = 32'h000001FF,
parameter                              C_USE_WSTRB          = 1,
parameter                              C_DPHASE_TIMEOUT     = 0,
parameter                              C_NUM_ADDRESS_RANGES = 1,
parameter                              C_TOTAL_NUM_CE       = 1,
parameter [0:32*2*C_NUM_ADDRESS_RANGES-1]   C_ARD_ADDR_RANGE_ARRAY  = 
                                             {2*C_NUM_ADDRESS_RANGES
                                              {32'h00000000}
                                             },
parameter [0:8*C_NUM_ADDRESS_RANGES-1] C_ARD_NUM_CE_ARRAY  = 
                                            {
                                             C_NUM_ADDRESS_RANGES{8'd1}
                                             },
parameter                              C_FAMILY            = "virtex7"
)
(
input                                  S_AXI_ACLK,
input                                  S_AXI_ARESETN,
input [17:0]                           S_AXI_AWADDR, 
input                                  S_AXI_AWVALID,   
output S_AXI_AWREADY,    
input [C_S_AXI_DATA_WIDTH - 1:0]       S_AXI_WDATA, 
input [(C_S_AXI_DATA_WIDTH / 8) - 1:0] S_AXI_WSTRB, 
input                                  S_AXI_WVALID, 
output                                 S_AXI_WREADY, 
output[1:0]                            S_AXI_BRESP, 
output                                 S_AXI_BVALID,   
input                                  S_AXI_BREADY, 
input [17:0]                           S_AXI_ARADDR, 
input                                  S_AXI_ARVALID, 
output                                 S_AXI_ARREADY, 
output[C_S_AXI_DATA_WIDTH - 1:0]       S_AXI_RDATA, 
output[1:0]                            S_AXI_RRESP, 
output                                 S_AXI_RVALID, 
input                                  S_AXI_RREADY, 
output                                 Bus2IP_Clk,    
output                                 Bus2IP_Resetn,  
output[17:0]                           Bus2IP_Addr,  
output                                 Bus2IP_RNW, 
output[((C_S_AXI_DATA_WIDTH / 8)-1):0] Bus2IP_BE, 
output[C_NUM_ADDRESS_RANGES-1:0]       Bus2IP_CS, 
output[C_TOTAL_NUM_CE-1:0]  Bus2IP_RdCE,   
output[C_TOTAL_NUM_CE-1:0]  Bus2IP_WrCE,   
output[(C_S_AXI_DATA_WIDTH - 1):0]     Bus2IP_Data,    
input [(C_S_AXI_DATA_WIDTH - 1):0]     IP2Bus_Data, 
input                                  IP2Bus_WrAck, 
input                                  IP2Bus_RdAck, 
input                                  IP2Bus_Error,
output                                 timeout
);
//-----------------------------------------------------------------------------
// Begin architecture logic
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Slave Attachment
//-----------------------------------------------------------------------------
usp_rf_data_converter_0_slave_attachment 
#(
.C_NUM_ADDRESS_RANGES(C_NUM_ADDRESS_RANGES),
.C_TOTAL_NUM_CE(C_TOTAL_NUM_CE),
.C_ARD_ADDR_RANGE_ARRAY(C_ARD_ADDR_RANGE_ARRAY),
.C_ARD_NUM_CE_ARRAY(C_ARD_NUM_CE_ARRAY), 
.C_IPIF_ABUS_WIDTH(18),
.C_IPIF_DBUS_WIDTH(C_S_AXI_DATA_WIDTH), 
.C_S_AXI_MIN_SIZE(C_S_AXI_MIN_SIZE), 
.C_USE_WSTRB(C_USE_WSTRB), 
.C_DPHASE_TIMEOUT(C_DPHASE_TIMEOUT),
.C_FAMILY(C_FAMILY)
) 
I_SLAVE_ATTACHMENT
(
// AXI signals
.S_AXI_ACLK(S_AXI_ACLK), 
.S_AXI_ARESETN(S_AXI_ARESETN),
.S_AXI_AWADDR(S_AXI_AWADDR), 
.S_AXI_AWVALID(S_AXI_AWVALID),
.S_AXI_AWREADY(S_AXI_AWREADY), 
.S_AXI_WDATA(S_AXI_WDATA),
.S_AXI_WSTRB(S_AXI_WSTRB), 
.S_AXI_WVALID(S_AXI_WVALID),
.S_AXI_WREADY(S_AXI_WREADY), 
.S_AXI_BRESP(S_AXI_BRESP),
.S_AXI_BVALID(S_AXI_BVALID), 
.S_AXI_BREADY(S_AXI_BREADY),
.S_AXI_ARADDR(S_AXI_ARADDR), 
.S_AXI_ARVALID(S_AXI_ARVALID),
.S_AXI_ARREADY(S_AXI_ARREADY), 
.S_AXI_RDATA(S_AXI_RDATA),
.S_AXI_RRESP(S_AXI_RRESP), 
.S_AXI_RVALID(S_AXI_RVALID),
.S_AXI_RREADY(S_AXI_RREADY), 
// IPIC signals
.Bus2IP_Clk(Bus2IP_Clk),
.Bus2IP_Resetn(Bus2IP_Resetn), 
.Bus2IP_Addr(Bus2IP_Addr),
.Bus2IP_RNW(Bus2IP_RNW),
.Bus2IP_BE(Bus2IP_BE), 
.Bus2IP_CS(Bus2IP_CS),
.Bus2IP_RdCE(Bus2IP_RdCE),
.Bus2IP_WrCE(Bus2IP_WrCE), 
.Bus2IP_Data(Bus2IP_Data),
.IP2Bus_Data(IP2Bus_Data), 
.IP2Bus_WrAck(IP2Bus_WrAck),
.IP2Bus_RdAck(IP2Bus_RdAck), 
.IP2Bus_Error(IP2Bus_Error),
.timeout(timeout)
); 
endmodule
