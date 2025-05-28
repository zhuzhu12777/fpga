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
logic rf_clk[3], rf_rstb[3];
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
    rf_clk[0] = 1'b0;
    forever #(clk_period_rf/2) rf_clk[0] = ~rf_clk[0];
end

initial begin
    rf_rstb[0] = 1'b0;
    #(clk_period_rf*10) rf_rstb[0] = 1'b1;
end

initial begin
    rf_clk[1] = 1'b0;
    #1;
    forever #(clk_period_rf/2) rf_clk[1] = ~rf_clk[1];
end

initial begin
    rf_rstb[1] = 1'b0;
    #2;
    #(clk_period_rf*10) rf_rstb[1] = 1'b1;
end

initial begin
    rf_clk[2] = 1'b0;
    forever #(clk_period_rf/2) rf_clk[2] = ~rf_clk[2];
end

initial begin
    rf_rstb[2] = 1'b0;
    #(clk_period_rf*10) rf_rstb[2] = 1'b1;
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
STREAM #(128)               adc_stream[6]();

AXI4 #(.DATA_WIDTH(128))    bram_wr_axi();

reg_map #(
    .ADDR_SEGMENT           (16'h0000)
) u_reg_map (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    // 显式指定modport连接
    .s_axil                 (axil_regs),
    .regs                   (regs)
);

wire        pl_clk = axi_aclk;
wire        pl_rstb = axi_rstb;

adc_data_path u_adc_data_path (
    // clock & reset
    .ps_clk                 (axi_aclk),
    .ps_rstb                (axi_rstb),
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .rf_clk0                (rf_clk[0]),
    .rf_rstb0               (rf_rstb[0]),
    .rf_clk1                (rf_clk[1]),
    .rf_rstb1               (rf_rstb[1]),
    .rf_clk2                (rf_clk[2]),
    .rf_rstb2               (rf_rstb[2]),

    // axi write to ps
    .m_axi                  (bram_wr_axi),

    // dac axis output to rf
    .s_axis                 (adc_stream),

    // status for debug
    .datamover_status       (regs.adc_datamover_status),
    .current_addr           (regs.adc_current_addr),
    .run_cycles             (regs.adc_run_cycles),
    .wr_mm2s_err            (regs.adc_wr_mm2s_err),
    .cap_done               (regs.adc_cap_done),

    // regs
    .write_start            (regs.adc_start),
    .write_reset            (regs.adc_reset),
    .start_address          (regs.adc_start_addr),
    .cap_size               (regs.adc_cap_size)
);

// here need a AXI4 BRAM
axi_bram_ctrl_128b u_bram_ctrl_128b (
    .s_axi_aclk                 (axi_aclk),         // input wire s_axi_aclk
    .s_axi_aresetn              (axi_rstb),         // input wire s_axi_aresetn
    .s_axi_awid                 (bram_wr_axi.awid),        // input wire [3 : 0] s_axi_awid
    .s_axi_awaddr               (bram_wr_axi.awaddr[16:0]),    // input wire [17 : 0] s_axi_awaddr
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
    .s_axi_araddr               (bram_wr_axi.araddr[16:0]),    // input wire [17 : 0] s_axi_araddr
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

task automatic check_adc_data_path(bit [127:0] exp_data[6][$], ref bit [127:0] real_data[$]);
    bit [127:0] exp_val, real_val;
    int data_size;
    data_size = real_data.size();
    
    // for (int i = 0; i < data_size; i++) begin
    //     exp_val = exp_data.pop_front();
    //     real_val = real_data.pop_front();
    //     if (exp_val != real_val) begin
    //         $display("ERROR: exp_data[%0d] = 0x%0h, real_data[%0d] = 0x%0h", i, exp_val, i, real_val);
    //     end
    // end
endtask


assign axi4_task::axi_aclk = axi_aclk;
assign axi4_task::axilite_clk = axilite_clk;


parameter PKG_NUM = 10;

initial begin
    bit [127:0] tmp_data[6][$], exp_data[$], real_data[$];
    bit [127:0] val[6];
    bit [31:0] val_32b[6];
    bit [191:0] val_192b, val_reorder;
    bit op_done;
    bit [31:0] read_data;
    axi4_task::m_axi = bram_wr_axi;
    axi4_task::m_axil = axil_regs;
    axi4_task::axilite_reset();
    axi4_task::axi4_reset();

    adc_stream[0].tvalid <= '0;
    adc_stream[1].tvalid <= '0;
    adc_stream[2].tvalid <= '0;
    adc_stream[3].tvalid <= '0;
    adc_stream[4].tvalid <= '0;
    adc_stream[5].tvalid <= '0;
    adc_stream[0].tdata <= '0;
    adc_stream[1].tdata <= '0;
    adc_stream[2].tdata <= '0;
    adc_stream[3].tdata <= '0;
    adc_stream[4].tdata <= '0;
    adc_stream[5].tdata <= '0;

    @RST_DONE;
    // driver
    fork
        begin : stream_0
            for(int i = 0; i < PKG_NUM; i++) begin
                val[0] = {$urandom(), $urandom(), $urandom(), $urandom()};
                tmp_data[0].push_back(val[0]);
                wait(adc_stream[0].tready);
                @(posedge rf_clk[0]);
                adc_stream[0].tvalid <= '1;
                adc_stream[0].tdata <= val[0];
            end
            adc_stream[0].tvalid <= '0;
        end
        begin : stream_1
            for(int i = 0; i < PKG_NUM; i++) begin
                val[1] = {$urandom(), $urandom(), $urandom(), $urandom()};
                tmp_data[1].push_back(val[1]);
                wait(adc_stream[1].tready);
                @(posedge rf_clk[0]);
                adc_stream[1].tvalid <= '1;
                adc_stream[1].tdata <= val[1];
            end
            adc_stream[1].tvalid <= '0;
        end
        begin : stream_2
            for(int i = 0; i < PKG_NUM; i++) begin
                val[2] = {$urandom(), $urandom(), $urandom(), $urandom()};
                tmp_data[2].push_back(val[2]);
                wait(adc_stream[2].tready);
                @(posedge rf_clk[1]);
               adc_stream[2].tvalid <= '1;
               adc_stream[2].tdata <= val[2];
            end
            adc_stream[2].tvalid <= '0;
        end
        begin : stream_3
            for(int i = 0; i < PKG_NUM; i++) begin
                val[3] = {$urandom(), $urandom(), $urandom(), $urandom()};
                tmp_data[3].push_back(val[3]);
                wait(adc_stream[3].tready);
                @(posedge rf_clk[1]);
                adc_stream[3].tvalid <= '1;
                adc_stream[3].tdata <= val[3];
            end
            adc_stream[3].tvalid <= '0;
        end
        begin : stream_4
            for(int i = 0; i < PKG_NUM; i++) begin
                val[4] = {$urandom(), $urandom(), $urandom(), $urandom()};
                tmp_data[4].push_back(val[4]);
                wait(adc_stream[4].tready);
                @(posedge rf_clk[2]);
                adc_stream[4].tvalid <= '1;
                adc_stream[4].tdata <= val[4];
            end
            adc_stream[4].tvalid <= '0;
        end
        begin : stream_5
            for(int i = 0; i < PKG_NUM; i++) begin
                val[5] = {$urandom(), $urandom(), $urandom(), $urandom()};
                tmp_data[5].push_back(val[5]);
                wait(adc_stream[5].tready);
                @(posedge rf_clk[2]);
                adc_stream[5].tvalid <= '1;
                adc_stream[5].tdata <= val[5];
            end
            adc_stream[5].tvalid <= '0;
        end
    join

    repeat(100) @(posedge axilite_clk);

    // config regs
    axi4_task::WriteReg(32'h0c, 0);              // start_addr
    axi4_task::WriteReg(32'h10, PKG_NUM * 32);     // cap_size
    axi4_task::WriteReg(32'h14, 1);  //[0]start, [1]reset
    op_done = 0;
    while(!op_done) begin
        repeat(10) @(posedge axilite_clk);
        axi4_task::ReadReg(32'h14, read_data);
        op_done = read_data[8];
    end

    // capture data
    for(int i = 0; i < 2*PKG_NUM; i++) begin
        axi4_task::axi4_read(16*i, val[0]);
        real_data.push_back(val[0]);
    end

    $display("[%t] : dac data start, check 1st loop", $time);
    check_adc_data_path(tmp_data, real_data);

    repeat(100) @(posedge axilite_clk);
    $finish;
end





endmodule

