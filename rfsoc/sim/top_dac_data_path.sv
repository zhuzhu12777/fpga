`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

import axi4_task::*;
glbl glbl();

initial begin
    string wave_file;
    int tmp;
    $timeformat(-9, 2, " ns", 16);  // set time format to allow #?ns etc.
    if ($test$plusargs("WAVE_FILE"))
        tmp = $value$plusargs("WAVE_FILE=%s", wave_file);
    else
        wave_file = "wave.vcd";
    $dumpfile(wave_file);
    $dumpvars(0, top);
end

real clk_period_axi = 1000/333.25; // 333.25MHz
real clk_period_axilite = 10.0; // 100MHz
real clk_period_rf = 1000/500;  // 500MHz


logic axi_aclk, axi_rstb;
logic axilite_clk, axilite_rstb;
logic rf_clk, rf_rstb;
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
    rf_clk = 1'b0;
    forever #(clk_period_rf/2) rf_clk = ~rf_clk;
end

initial begin
    rf_rstb = 1'b0;
    #(clk_period_rf*10) rf_rstb = 1'b1;
end


initial begin
    axilite_clk = 1'b0;
    forever #(clk_period_axilite/2) axilite_clk = ~axilite_clk;
end

initial begin
    axilite_rstb = 1'b0;
    #(clk_period_axilite*10) axilite_rstb = 1'b1;
    -> RST_DONE;
    $display("[%t] Reset Done", $time);
end

// interface
AXI4 #(.DATA_WIDTH(256))    pl_m_axi_rd();
AXI4 #(.DATA_WIDTH(128))    ps_m_axi_wr();
AXI4Lite                    axil_regs();
AXI4Lite                    axil_rf_ctrl();
RFSOC_REG                   regs();
STREAM #(256)               dac_stream();

AXI4 #(.DATA_WIDTH(256))    bram_wr_axi();

reg_map u_reg_map (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    // 显式指定modport连接
    .s_axil                 (axil_regs),
    .regs                   (regs)
);

wire        pl_clk = axi_aclk;
wire        pl_rstb = axi_rstb;
wire        dac_usr_clk = rf_clk;
wire        dac_usr_rstb = rf_rstb;

dac_data_path u_dac_data_path (
    // clock & reset
    .pl_clk                 (axi_aclk),
    .pl_rstb                (axi_rstb),
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .rf_clk                 (rf_clk),
    .rf_rstb                (rf_rstb),

    // axi4 master read from pl ddr
    .m_axi                  (bram_wr_axi),

    // dac axis output to rf
    .m_axis                 (dac_stream),

    // status for debug
    .datamover_status       (regs.dac_datamover_status),
    .current_addr           (regs.dac_current_addr),
    .run_cycles             (regs.dac_run_cycles),
    .read_mm2s_err          (regs.dac_read_mm2s_err),

    // regs
    .read_start             (regs.dac_start),
    .read_reset             (regs.dac_reset),
    .start_address          (regs.dac_start_addr),
    .cap_size               (regs.dac_cap_size)
);

// here need a AXI4 BRAM
axi_bram_ctrl_256b u_bram_ctrl_256b (
    .s_axi_aclk                 (axi_aclk),         // input wire s_axi_aclk
    .s_axi_aresetn              (axi_rstb),         // input wire s_axi_aresetn
    .s_axi_awid                 (bram_wr_axi.awid),        // input wire [3 : 0] s_axi_awid
    .s_axi_awaddr               (bram_wr_axi.awaddr[17:0]),    // input wire [17 : 0] s_axi_awaddr
    .s_axi_awlen                (bram_wr_axi.awlen),      // input wire [7 : 0] s_axi_awlen
    .s_axi_awsize               (bram_wr_axi.awsize),    // input wire [2 : 0] s_axi_awsize
    .s_axi_awburst              (bram_wr_axi.awburst),  // input wire [1 : 0] s_axi_awburst
    .s_axi_awlock               (bram_wr_axi.awlock),    // input wire s_axi_awlock
    .s_axi_awcache              (bram_wr_axi.awcache),  // input wire [3 : 0] s_axi_awcache
    .s_axi_awprot               (bram_wr_axi.awprot),    // input wire [2 : 0] s_axi_awprot
    .s_axi_awvalid              (bram_wr_axi.awvalid),  // input wire s_axi_awvalid
    .s_axi_awready              (bram_wr_axi.awready),  // output wire s_axi_awready
    .s_axi_wdata                (bram_wr_axi.wdata),      // input wire [255 : 0] s_axi_wdata
    .s_axi_wstrb                (bram_wr_axi.wstrb),      // input wire [31 : 0] s_axi_wstrb
    .s_axi_wlast                (bram_wr_axi.wlast),      // input wire s_axi_wlast
    .s_axi_wvalid               (bram_wr_axi.wvalid),    // input wire s_axi_wvalid
    .s_axi_wready               (bram_wr_axi.wready),    // output wire s_axi_wready
    .s_axi_bid                  (bram_wr_axi.bid),          // output wire [3 : 0] s_axi_bid
    .s_axi_bresp                (bram_wr_axi.bresp),      // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid               (bram_wr_axi.bvalid),    // output wire s_axi_bvalid
    .s_axi_bready               (bram_wr_axi.bready),    // input wire s_axi_bready
    .s_axi_arid                 (bram_wr_axi.arid),        // input wire [3 : 0] s_axi_arid
    .s_axi_araddr               (bram_wr_axi.araddr[17:0]),    // input wire [17 : 0] s_axi_araddr
    .s_axi_arlen                (bram_wr_axi.arlen),      // input wire [7 : 0] s_axi_arlen
    .s_axi_arsize               (bram_wr_axi.arsize),    // input wire [2 : 0] s_axi_arsize
    .s_axi_arburst              (bram_wr_axi.arburst),  // input wire [1 : 0] s_axi_arburst
    .s_axi_arlock               (bram_wr_axi.arlock),    // input wire s_axi_arlock
    .s_axi_arcache              (bram_wr_axi.arcache),  // input wire [3 : 0] s_axi_arcache
    .s_axi_arprot               (bram_wr_axi.arprot),    // input wire [2 : 0] s_axi_arprot
    .s_axi_arvalid              (bram_wr_axi.arvalid),  // input wire s_axi_arvalid
    .s_axi_arready              (bram_wr_axi.arready),  // output wire s_axi_arready
    .s_axi_rid                  (bram_wr_axi.rid),          // output wire [3 : 0] s_axi_rid
    .s_axi_rdata                (bram_wr_axi.rdata),      // output wire [255 : 0] s_axi_rdata
    .s_axi_rresp                (bram_wr_axi.rresp),      // output wire [1 : 0] s_axi_rresp
    .s_axi_rlast                (bram_wr_axi.rlast),      // output wire s_axi_rlast
    .s_axi_rvalid               (bram_wr_axi.rvalid),    // output wire s_axi_rvalid
    .s_axi_rready               (bram_wr_axi.rready)    // input wire s_axi_rready
);

task automatic check_dac_data_path(bit [255:0] exp_data[$], ref bit [255:0] real_data[$]);
    bit [255:0] exp_val, real_val;
    int data_size;
    data_size = exp_data.size();
    assert(exp_data.size() == real_data.size()) else $error("exp_data.size() = %0d, real_data.size() = %0d", exp_data.size(), real_data.size());
    for (int i = 0; i < data_size; i++) begin
        exp_val = exp_data.pop_front();
        real_val = real_data.pop_front();
        if (exp_val != real_val) begin
            $display("ERROR: exp_data[%0d] = 0x%0h, real_data[%0d] = 0x%0h", i, exp_val, i, real_val);
        end
    end
endtask


assign axi4_task::axi_aclk = axi_aclk;
assign axi4_task::axilite_clk = axilite_clk;


parameter PKG_NUM = 10;

initial begin
    bit [255:0] exp_data[$], real_data[$];
    bit [255:0] val, val1, val2;
    dac_stream.tready = '0;
    axi4_task::m_axi = bram_wr_axi;
    axi4_task::m_axil = axil_regs;
    axi4_task::axilite_reset();
    axi4_task::axi4_reset();

    @RST_DONE;
    // write data to bram
    for (int i = 0; i < PKG_NUM; i++) begin
        axi4_task::axi4_write(i*32, {16{i[15:0] + 16'd1}});
        exp_data.push_back({16{i[15:0] + 16'd1}});
    end
    repeat(100) @(posedge axilite_clk);

    dac_stream.tready <= '1;

    // config regs
    axi4_task::WriteReg(32'h0, 0);              // start_addr
    axi4_task::WriteReg(32'h4, PKG_NUM * 32);     // cap_size
    axi4_task::WriteReg(32'h8, 1);  //[0]start, [1]reset
    
    $display("[%t] : dac data start, check 1st loop", $time);
    wait(dac_stream.tvalid);
    for (int i = 0; i < PKG_NUM; i++) begin
        @(posedge rf_clk);
        if (dac_stream.tvalid) begin
            val1 = dac_stream.tdata;
        end
        @(posedge rf_clk);
        if (dac_stream.tvalid) begin
            val2 = dac_stream.tdata;
        end
        val = {val2[255-:8], val2[255-16-:8], val2[255-32-:8], val2[255-48-:8], val2[255-64-:8], val2[255-80-:8], val2[255-96-:8], val2[255-112-:8], val2[255-128-:8], val2[255-144-:8], val2[255-160-:8], val2[255-176-:8], val2[255-192-:8], val2[255-208-:8], val2[255-224-:8], val2[255-240-:8], val1[255-:8], val1[255-16-:8], val1[255-32-:8], val1[255-48-:8], val1[255-64-:8], val1[255-80-:8], val1[255-96-:8], val1[255-112-:8], val1[255-128-:8], val1[255-144-:8], val1[255-160-:8], val1[255-176-:8], val1[255-192-:8], val1[255-208-:8], val1[255-224-:8], val1[255-240-:8]};
        real_data.push_back(val);
    end
    check_dac_data_path(exp_data, real_data);

    $display("[%t] : check 2nd loop", $time);
    for (int i = 0; i < PKG_NUM; i++) begin
        @(posedge rf_clk);
        if (dac_stream.tvalid) begin
            val1 = dac_stream.tdata;
        end
        @(posedge rf_clk);
        if (dac_stream.tvalid) begin
            val2 = dac_stream.tdata;
        end
        val = {val2[255-:8], val2[255-16-:8], val2[255-32-:8], val2[255-48-:8], val2[255-64-:8], val2[255-80-:8], val2[255-96-:8], val2[255-112-:8], val2[255-128-:8], val2[255-144-:8], val2[255-160-:8], val2[255-176-:8], val2[255-192-:8], val2[255-208-:8], val2[255-224-:8], val2[255-240-:8], val1[255-:8], val1[255-16-:8], val1[255-32-:8], val1[255-48-:8], val1[255-64-:8], val1[255-80-:8], val1[255-96-:8], val1[255-112-:8], val1[255-128-:8], val1[255-144-:8], val1[255-160-:8], val1[255-176-:8], val1[255-192-:8], val1[255-208-:8], val1[255-224-:8], val1[255-240-:8]};
        real_data.push_back(val);
    end
    check_dac_data_path(exp_data, real_data);

    repeat(100) @(posedge axilite_clk);
    $finish;
end





endmodule

