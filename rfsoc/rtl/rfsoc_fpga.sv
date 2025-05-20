module rfsoc_fpga(


    AXI4.master             pl_m_axi_rd,          // axi4 master read from pl ddr
    AXI4.master             ps_m_axi_wr,          // axi4 master write to ps ddr
    AXI4Lite.slave          ps_s_axilite,         // axilite slave

    output logic    [5:0]   gt_txp,
    output logic    [5:0]   gt_txn,

    input  logic    [5:0]   vin_p,
    input  logic    [5:0]   vin_n,
    output logic            vout_p,
    output logic            vout_n,
    output logic            ps_int
);

wire                pl_clk, pl_rstb;    // 333.25MHz
wire                ps_clk, ps_rstb;    // 333.25MHz
wire                dac_clk, dac_rstb;    // 500MHz
wire                adc_clk, adc_rstb;    // 187.5MHz
wire                gt_clk, gt_rstb;      // 187.5MHz
wire                axilite_clk, axilite_rstb; // 100MHz

wire                gt_refclk_in;

wire    [5:0]       adc0_clk_p, adc0_clk_n;
wire                dac0_clk_p, dac0_clk_n;
wire                sysref_in_p, sysref_in_n;








// reset generator
wire        gt_tx_resetdone;
//reset_generator u_reset_generator();



RFSOC_REG regs;
reg_map #(
    .ADDR_SEGMENT           (16'h0000)
) u_reg_map (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    .s_axil                 (ps_s_axilite),
    .regs                   (regs)
);
assign ps_int = regs.rf_int;

STREAM #(256) dac_stream;
dac_data_path u_dac_data_path (
    // clock & reset
    .pl_clk                 (pl_clk),
    .pl_rstb                (pl_rstb),
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),
    .rf_clk                 (dac_clk),
    .rf_rstb                (dac_rstb),

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
    .rf_clk                 (adc_clk),
    .rf_rstb                (adc_rstb),

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

// rfsoc wrapper
RF_Wrapper #(
    .RF_ADC_NUM                                (6),
    .RF_ADC_AXIS_WID                           (128)
) u_rf_wrapper (
    .axilite_clk                               (axilite_clk),
    .axilite_rstb                              (axilite_rstb),

    .adc_clk_p                                 (adc0_clk_p),
    .adc_clk_n                                 (adc0_clk_n),
    .clk_adc                                   (adc_clk),
    .adc_rstb                                  (adc_rstb),
    .dac_clk_p                                 (dac0_clk_p),
    .dac_clk_n                                 (dac0_clk_n),
    .clk_dac                                   (dac_clk),
    .dac_rstb                                  (dac_rstb),
    .sysref_in_p                               (sysref_in_p),
    .sysref_in_n                               (sysref_in_n),

    .vin_p                                     (vin_p),
    .vin_n                                     (vin_n),
    .vout_p                                    (vout_p),
    .vout_n                                    (vout_n),

    .s_axil                                    (ps_s_axilite),
    .m_axis                                    (adc_stream),
    .s_axis                                    (dac_stream),

    .irq                                       (regs.rf_irq)
);

// gt wrapper
GT_TX_Wrapper #(
    .GT_CHN_NUM            (6),
    .MASTER_CHN            (3),
    .USER_DATA_WIDTH       (32)
) u_gt_tx_wrapper (
    .gt_reset              (!gt_rstb),
    .gt_init_clk           (gt_clk),
    .gt_refclk_in          (gt_refclk_in),
    .gt_txp                (gt_txp),
    .gt_txn                (gt_txn),
    .userclk_out           (),
    .tx_data               (gt_tx_data),
    .tx_resetdone          (gt_tx_resetdone),
    .gt_powergood          (regs.gt_powergood)
);

endmodule
