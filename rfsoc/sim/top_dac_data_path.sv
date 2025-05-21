`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

import axi4_task::*;
glbl glbl();

real clk_period_axi = 1000/333.25; // 333.25MHz
real clk_period_axilite = 10.0; // 100MHz
real clk_period_rf = 1000/500;  // 500MHz


logic axi_aclk, axi_rstb; // 500MHz
logic axilite_clk, axilite_rstb; // 100MHz
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
wire        dac_usr_clk = rf_clk;
wire        dac_usr_rstb = rf_rstb;

dac_data_path u_dac_data_path (
    // clock & reset
    .pl_clk                 (pl_clk),
    .pl_rstb                (pl_rstb),
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .rf_clk                 (dac_usr_clk),
    .rf_rstb                (dac_usr_rstb),

    // axi4 master read from pl ddr
    .m_axi                  (pl_m_axi_rd),

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
    .start_address          (regs.dac_start_address),
    .cap_size               (regs.dac_cap_size)
);

// here need a AXI4 BRAM TODO
AXI4 #(.DATA_WIDTH(256))    bram_wr_axi();











assign axi4_task::axi_aclk = axi_aclk;
assign axi4_task::axilite_clk = axilite_clk;

initial begin
    int val, read_data;
    int addr_max;
    bit [191:0] gt_data[$], read_gt_data[$], gt_data_tmp;
    axi4_task::m_axil = axil_regs;
    axi4_task::axilite_reset();
    @RST_DONE;
    repeat(100) @(posedge axilite_clk);
    addr_max = $urandom_range(10, 50);
    for(int i = 0; i < addr_max; i++) begin
        gt_data_tmp = {$urandom(), $urandom(), $urandom(), $urandom(), $urandom(), $urandom()};
        gt_data.push_back(gt_data_tmp);
        for(int ch = 0; ch < 6; ch++) begin
            val = (1<<12) | (ch<<8) | i[7:0];
            axi4_task::WriteReg(32'h1c, gt_data_tmp[ch*32+:32]);
            axi4_task::WriteReg(32'h18, val);
        end
    end
    $display("[%t] : Write GT data done", $time);
    repeat(100) @(posedge axilite_clk);

    axi4_task::WriteReg(32'h20, 1);
    $display("[%t] : GT data start, check 1st loop", $time);
    wait(top.u_gt_data_path.gt_start);
    @(posedge gt_clk);
    for(int i = 0; i < addr_max; i++) begin
        @(posedge gt_clk); 
        read_gt_data.push_back(gt_tx_data);
    end
    gt_data_check(gt_data, read_gt_data);

    $display("[%t] : check 2nd loop", $time);
    for(int i = 0; i < addr_max; i++) begin
        @(posedge gt_clk);
        read_gt_data.push_back(gt_tx_data);
    end
    gt_data_check(gt_data, read_gt_data);

    repeat(100) @(posedge axilite_clk);
    $finish;
end

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



endmodule

