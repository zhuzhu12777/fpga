`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top();

import axi4_task::*;
glbl glbl();

real clk_period_axi = 2.0; // 500MHz
real clk_period_axilite = 10.0; // 100MHz
real clk_period_gt = 1000/187.5;  //187.5MHz


logic axi_aclk, axi_rstb; // 500MHz
logic axilite_clk, axilite_rstb; // 100MHz
logic gt_clk, gt_rstb;
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
    gt_clk = 1'b0;
    forever #(clk_period_gt/2) gt_clk = ~gt_clk;
end

initial begin
    gt_rstb = 1'b0;
    #(clk_period_gt*10) gt_rstb = 1'b1;
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
// AXI4                pl_axi();          // 解除注释并添加接口实例化
AXI4Lite            ps_s_axilite();    // 保持原有接口
RFSOC_REG           regs();          // 移除非法modport声明

reg_map #(
    .ADDR_SEGMENT           (16'h0000)
) u_reg_map (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    // 显式指定modport连接
    .s_axil                 (ps_s_axilite.slave),  // 添加.slave modport
    .regs                   (regs.master)          // 添加.master modport
);


logic [191:0] gt_tx_data;
gt_data_path u_gt_data_path (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .gt_clk                 (gt_clk),
    .gt_rstb                (gt_rstb),

    .ram_addr               (regs.gty_ram_addr),
    .ram_data               (regs.gty_ram_data),
    .ram_we                 (regs.gty_ram_wren),
    .ram_idx                (regs.gty_chn),

    .reg_start              (regs.gty_start),
    .reg_reset              (regs.gty_reset),

    .gt_data                (gt_tx_data)
);

assign axi4_task::axi_aclk = axi_aclk;
assign axi4_task::axilite_clk = axilite_clk;

task automatic gt_data_check(bit [191:0] gt_data[$], ref bit [191:0] read_gt_data[$]);
    bit [191:0] exp_data, read_data;
    int data_size;
    data_size = gt_data.size();
    assert(gt_data.size() == read_gt_data.size()) else $error("gt_data.size() = %0d, read_gt_data.size() = %0d", gt_data.size(), read_gt_data.size());
    for (int i = 0; i < data_size; i++) begin
        exp_data = gt_data.pop_front();
        read_data = read_gt_data.pop_front();
        if (exp_data != read_data) begin
            $display("ERROR: gt_data[%0d] = 0x%0h, read_gt_data[%0d] = 0x%0h", i, exp_data, i, read_data);
        end
    end
endtask

initial begin
    int val, read_data;
    int addr_max;
    bit [191:0] gt_data[$], read_gt_data[$], gt_data_tmp;
    axi4_task::m_axil = ps_s_axilite;
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

