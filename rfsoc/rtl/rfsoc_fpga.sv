module rfsoc_fpga(


    input  logic             ps_clk, ps_rstb,               // 333.25MHz
    input  logic             axilite_clk, axilite_rstb,     // 100MHz

    // axi4 pl 256b TODO

    // axi4 ps 128b TODO

    // axi4l slave TODO




    input  logic    [5:0]   adc_clk_p,
    input  logic    [5:0]   adc_clk_n,
    input  logic            dac_clk_p,
    input  logic            dac_clk_n,
    input  logic            sysref_in_p,
    input  logic            sysref_in_n,
    

    output logic    [5:0]   gt_txp,
    output logic    [5:0]   gt_txn,

    input  logic    [5:0]   vin_p,
    input  logic    [5:0]   vin_n,
    output logic            vout_p,
    output logic            vout_n
);

wire                pl_clk, pl_rstb;    // 333.25MHz
wire                dac_usr_clk, dac_usr_rstb;    // 500MHz
wire [2:0]          adc_usr_clk, adc_usr_rstb;    // 187.5MHz
wire                gt_usr_clk, gt_usr_rstb;      // 187.5MHz
wire                gt_refclk_in;   // 50MHz
wire                gt_init_clk, gt_init_rstb;    // 187.5MHz

// interface
AXI4 #(.DATA_WIDTH(256))    pl_m_axi_rd();
AXI4 #(.DATA_WIDTH(128))    ps_m_axi_wr();
AXI4Lite                    axil_regs();
AXI4Lite                    axil_rf_ctrl();
RFSOC_REG                   regs();

// PLL gen TODO

// reset generator TODO

// here need an axi interconnect TODO

reg_map #(
    .ADDR_SEGMENT           (16'h0010)
) u_reg_map (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    .s_axil                 (ps_s_axilite),
    .regs                   (regs)
);

STREAM #(256) dac_stream;
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

STREAM #(128) adc_stream[6];
adc_data_path u_adc_data_path (
    // clock & reset
    .ps_clk                 (ps_clk),
    .ps_rstb                (ps_rstb),
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .rf_clk0                (adc_usr_clk[0]),
    .rf_rstb0               (adc_usr_rstb[0]),
    .rf_clk1                (adc_usr_clk[1]),
    .rf_rstb1               (adc_usr_rstb[1]),
    .rf_clk2                (adc_usr_clk[2]),
    .rf_rstb2               (adc_usr_rstb[2]),

    // axi write to ps
    .m_axi                  (ps_m_axi_wr),

    // adc axis input
    .s_axis                 (adc_stream),

    // status
    .datamover_status       (regs.adc_datamover_status),
    .current_addr           (regs.adc_current_addr),
    .run_cycles             (regs.adc_run_cycles),
    .wr_mm2s_err            (regs.adc_wr_mm2s_err),
    .cap_done               (regs.adc_cap_done),

    // regs
    .write_start            (regs.adc_start),
    .write_reset            (regs.adc_reset),
    .start_address          (regs.adc_start_address),
    .cap_size               (regs.adc_cap_size)
);

wire [191:0]  gt_tx_data;
gt_data_path u_gt_data_path (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .gt_clk                 (gt_usr_clk),
    .gt_rstb                (gt_usr_rstb),

    .ram_addr               (regs.gty_ram_addr),
    .ram_data               (regs.gty_ram_data),
    .ram_we                 (regs.gty_ram_wren),
    .ram_idx                (regs.gty_chn),

    .reg_start              (regs.gty_start),
    .reg_reset              (regs.gty_reset),

    .gt_data                (gt_tx_data)
);

// rfsoc wrapper
RF_Wrapper #(
    .RF_ADC_NUM             (6),
    .RF_ADC_AXIS_WID        (128)
) u_rf_wrapper (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    .adc_clk_p              (adc_clk_p),
    .adc_clk_n              (adc_clk_n),
    .adc_usr_clk            (adc_usr_clk),
    .adc_usr_rstb           (adc_usr_rstb),
    .dac_clk_p              (dac_clk_p),
    .dac_clk_n              (dac_clk_n),
    .dac_usr_clk            (dac_usr_clk),
    .dac_usr_rstb           (dac_usr_rstb),
    .sysref_in_p            (sysref_in_p),
    .sysref_in_n            (sysref_in_n),

    .vin_p                  (vin_p),
    .vin_n                  (vin_n),
    .vout_p                 (vout_p),
    .vout_n                 (vout_n),

    .s_axil                 (axil_rf_ctrl),
    .m_axis                 (adc_stream),
    .s_axis                 (dac_stream),

    .irq                    (regs.rf_irq)
);

// gt wrapper
GT_TX_Wrapper #(
    .GT_CHN_NUM            (6),
    .MASTER_CHN            (3),
    .USER_DATA_WIDTH       (32)
) u_gt_tx_wrapper (
    .gt_reset              (!gt_init_rstb),
    .gt_init_clk           (gt_init_clk),
    .gt_refclk_in          (gt_refclk_in),
    .gt_txp                (gt_txp),
    .gt_txn                (gt_txn),
    .userclk_out           (gt_usr_clk),
    .userrst_out           (gt_usr_rstb),
    .tx_data               (gt_tx_data),
    .gt_powergood          (regs.gt_powergood)
);

endmodule
