`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

real clk_period_axi = 2.0; // 500MHz
real clk_period_axilite = 10.0; // 100MHz


logic axi_aclk, axi_rstb; // 500MHz
logic axilite_clk, axilite_rstb; // 100MHz
event RST_DONE;

initial begin
    axi_aclk = 1'b0;
    forever #(clk_period_axi/2) axi_aclk = ~axi_aclk;
end

initial begin
    axi_rstb = 1'b0;
    #(clk_period_axi*10) axi_rstb = 1'b1;
end

initial begin
    axilite_clk = 1'b0;
    forever #(clk_period_axilite/2) axilite_clk = ~axilite_clk;
end

initial begin
    axilite_rstb = 1'b0;
    #(clk_period_axilite*10) axilite_rstb = 1'b1;
    -> RST_DONE;
end

// interface
AXI4.master axi4_if;



logic            [255:0]     axis_tdata;
logic             [31:0]     axis_tkeep;
logic                        axis_tlast;
logic                        axis_tready;
logic                        axis_tvalid;

logic                        rd_mm2s_err;
logic                        read_start;
logic                        read_reset;
logic             [31:0]     start_address;
logic             [31:0]     cap_size;
logic             [31:0]     current_addr;
logic              [7:0]     run_cycles;

axi_dma_rd axi_dma_rd (
    .axi_aclk(axi_aclk),
    .axi_rstb(axi_rstb),
    .axis_st_clk(axis_st_clk),
    .axis_st_rstb(axis_st_rstb),

    .axi_araddr(axi_araddr),
    .axi_arburst(axi_arburst),
    .axi_arcache(axi_arcache),
    .axi_arid(axi_arid),
    .axi_arlen(axi_arlen),
    .axi_arprot(axi_arprot),
    .axi_arready(axi_arready),
    .axi_arsize(axi_arsize),
    .axi_aruser(axi_aruser),
    .axi_arvalid(axi_arvalid),

    .axi_rdata(axi_rdata),
    .axi_rlast(axi_rlast),
    .axi_rready(axi_rready),
    .axi_rresp(axi_rresp),
    .axi_rvalid(axi_rvalid),

    .axis_tdata(axis_tdata),
    .axis_tkeep(axis_tkeep),
    .axis_tlast(axis_tlast),
    .axis_tready(axis_tready),
    .axis_tvalid(axis_tvalid),

    // Control signals
    .rd_mm2s_err(rd_mm2s_err),
    .run_cycles(run_cycles),
    .current_addr(current_addr),
    .read_start(read_start),
    .read_reset(read_reset),

    // Configuration signals
    .start_address(start_address),
    .cap_size(cap_size)
);
assign axis_tready = 1'b1;

logic    [31:0]  m_axi_awaddr;
logic    [1:0]   m_axi_awburst;
logic    [2:0]   m_axi_awsize;
logic    [7:0]   m_axi_awlen;
logic            m_axi_awvalid, m_axi_awready;
logic            m_axi_wlast, m_axi_wvalid, m_axi_wready;
logic    [255:0] m_axi_wdata;
logic    [31:0]  m_axi_wstrb;
logic            m_axi_bvalid, m_axi_bready;
logic    [1:0]   m_axi_bresp;


axi_bram_ctrl_0 U_BRAM (
  .s_axi_aclk           (axi_aclk),        // input wire s_axi_aclk
  .s_axi_aresetn        (axi_rstb),  // input wire s_axi_aresetn
  .s_axi_awaddr         (m_axi_awaddr[14:0]),    // input wire [14 : 0] s_axi_awaddr
  .s_axi_awlen          (m_axi_awlen),      // input wire [7 : 0] s_axi_awlen
  .s_axi_awsize         (m_axi_awsize),    // input wire [2 : 0] s_axi_awsize
  .s_axi_awburst        (m_axi_awburst),  // input wire [1 : 0] s_axi_awburst
  .s_axi_awlock         (1'b0),         // input wire s_axi_awlock
  .s_axi_awcache        (4'b0),         // input wire [3 : 0] s_axi_awcache
  .s_axi_awprot         (3'b0),         // input wire [2 : 0] s_axi_awprot
  .s_axi_awvalid        (m_axi_awvalid),  // input wire s_axi_awvalid
  .s_axi_awready        (m_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata          (m_axi_wdata),      // input wire [255 : 0] s_axi_wdata
  .s_axi_wstrb          (m_axi_wstrb),      // input wire [31 : 0] s_axi_wstrb
  .s_axi_wlast          (m_axi_wlast),      // input wire s_axi_wlast
  .s_axi_wvalid         (m_axi_wvalid),    // input wire s_axi_wvalid
  .s_axi_wready         (m_axi_wready),    // output wire s_axi_wready
  .s_axi_bresp          (m_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid         (m_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready         (m_axi_bready),    // input wire s_axi_bready
  .s_axi_araddr         (axi.araddr[14:0]),    // input wire [14 : 0] s_axi_araddr
  .s_axi_arlen          (axi.arlen),      // input wire [7 : 0] s_axi_arlen
  .s_axi_arsize         (axi.arsize),    // input wire [2 : 0] s_axi_arsize
  .s_axi_arburst        (axi.arburst),  // input wire [1 : 0] s_axi_arburst
  .s_axi_arlock         (1'b0),         // input wire s_axi_arlock
  .s_axi_arcache        (axi.arcache),  // input wire [3 : 0] s_axi_arcache
  .s_axi_arprot         (axi.arprot),    // input wire [2 : 0] s_axi_arprot
  .s_axi_arvalid        (axi.arvalid),  // input wire s_axi_arvalid
  .s_axi_arready        (axi.arready),  // output wire s_axi_arready
  .s_axi_rdata          (axi.rdata),      // output wire [255 : 0] s_axi_rdata
  .s_axi_rresp          (axi.rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rlast          (axi.rlast),      // output wire s_axi_rlast
  .s_axi_rvalid         (axi.rvalid),    // output wire s_axi_rvalid
  .s_axi_rready         (axi.rready)    // input wire s_axi_rready
);




initial begin
    start_address = 0;
    cap_size = 0;
    read_start = 0;
    read_reset = 0;
    // Wait for reset to be released
    @(RST_DONE);
    repeat(100) @ (posedge axis_st_clk);
    // Set the start address and size
    start_address = 32'h00000000;
    cap_size = 32'h00010000; // 256*256 bytes
    read_start = 1'b1; // Start the read operation
    read_reset = 1'b0;
end



endmodule

