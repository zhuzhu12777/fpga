module rfsoc_fpga(

    input   logic           ps_clk, ps_rstb,               // 333.25MHz
    input   logic           axilite_clk, axilite_rstb,     // 100MHz

    // axi4 pl 256b
    AXI4.master             pl_m_axi_rd,

    // axi4 ps 128b
    AXI4.master             ps_m_axi_wr,

    // axi4l slave
    AXI4Lite.slave          ps_s_axilite,

    // adc/dac clocks
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
    output logic            vout_n,

    input  logic            c0_init_calib_complete


);

wire                pl_clk, pl_rstb;    // 333.25MHz
wire                dac_usr_clk, dac_usr_rstb;    // 500MHz
wire [2:0]          adc_usr_clk, adc_usr_rstb;    // 187.5MHz
wire                gt_usr_clk, gt_usr_rstb;      // 187.5MHz

assign pl_clk  = ps_clk;
assign pl_rstb = ps_rstb;


// interface
AXI4Lite                    axil_regs();
AXI4Lite                    axil_rf_ctrl();
RFSOC_REG                   regs();

// axilite crossbar to regs and rf_ctrl
// rf_ctrl: 0x8000_0000 ~ 0x800F_FFFF
// regs:  0x8010_0000 ~ 0x8010_FFFF
axilite_crossbar_0 u_axilite_crossbar (
    .aclk                   (axilite_clk),                      // input wire aclk
    .aresetn                (axilite_rstb),                     // input wire aresetn
    .s_axi_awaddr           (ps_s_axilite.awaddr                       ),    // input wire [31 : 0] s_axi_awaddr
    .s_axi_awprot           (ps_s_axilite.awprot                       ),    // input wire [2 : 0] s_axi_awprot
    .s_axi_awvalid          (ps_s_axilite.awvalid                      ),  // input wire [0 : 0] s_axi_awvalid
    .s_axi_awready          (ps_s_axilite.awready                      ),  // output wire [0 : 0] s_axi_awready
    .s_axi_wdata            (ps_s_axilite.wdata                        ),      // input wire [31 : 0] s_axi_wdata
    .s_axi_wstrb            (ps_s_axilite.wstrb                        ),      // input wire [3 : 0] s_axi_wstrb
    .s_axi_wvalid           (ps_s_axilite.wvalid                       ),    // input wire [0 : 0] s_axi_wvalid
    .s_axi_wready           (ps_s_axilite.wready                       ),    // output wire [0 : 0] s_axi_wready
    .s_axi_bresp            (ps_s_axilite.bresp                        ),      // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid           (ps_s_axilite.bvalid                       ),    // output wire [0 : 0] s_axi_bvalid
    .s_axi_bready           (ps_s_axilite.bready                       ),    // input wire [0 : 0] s_axi_bready
    .s_axi_araddr           (ps_s_axilite.araddr                       ),    // input wire [31 : 0] s_axi_araddr
    .s_axi_arprot           (ps_s_axilite.arprot                       ),    // input wire [2 : 0] s_axi_arprot
    .s_axi_arvalid          (ps_s_axilite.arvalid                      ),  // input wire [0 : 0] s_axi_arvalid
    .s_axi_arready          (ps_s_axilite.arready                      ),  // output wire [0 : 0] s_axi_arready
    .s_axi_rdata            (ps_s_axilite.rdata                        ),      // output wire [31 : 0] s_axi_rdata
    .s_axi_rresp            (ps_s_axilite.rresp                        ),      // output wire [1 : 0] s_axi_rresp
    .s_axi_rvalid           (ps_s_axilite.rvalid                       ),    // output wire [0 : 0] s_axi_rvalid
    .s_axi_rready           (ps_s_axilite.rready                       ),    // input wire [0 : 0] s_axi_rready
    .m_axi_awaddr           ({axil_regs.awaddr  , axil_rf_ctrl.awaddr }),    // output wire [63 : 0] m_axi_awaddr
    .m_axi_awprot           ({axil_regs.awprot  , axil_rf_ctrl.awprot }),    // output wire [5 : 0] m_axi_awprot
    .m_axi_awvalid          ({axil_regs.awvalid , axil_rf_ctrl.awvalid}),  // output wire [1 : 0] m_axi_awvalid
    .m_axi_awready          ({axil_regs.awready , axil_rf_ctrl.awready}),  // input wire [1 : 0] m_axi_awready
    .m_axi_wdata            ({axil_regs.wdata   , axil_rf_ctrl.wdata  }),      // output wire [63 : 0] m_axi_wdata
    .m_axi_wstrb            ({axil_regs.wstrb   , axil_rf_ctrl.wstrb  }),      // output wire [7 : 0] m_axi_wstrb
    .m_axi_wvalid           ({axil_regs.wvalid  , axil_rf_ctrl.wvalid }),    // output wire [1 : 0] m_axi_wvalid
    .m_axi_wready           ({axil_regs.wready  , axil_rf_ctrl.wready }),    // input wire [1 : 0] m_axi_wready
    .m_axi_bresp            ({axil_regs.bresp   , axil_rf_ctrl.bresp  }),      // input wire [3 : 0] m_axi_bresp
    .m_axi_bvalid           ({axil_regs.bvalid  , axil_rf_ctrl.bvalid }),    // input wire [1 : 0] m_axi_bvalid
    .m_axi_bready           ({axil_regs.bready  , axil_rf_ctrl.bready }),    // output wire [1 : 0] m_axi_bready
    .m_axi_araddr           ({axil_regs.araddr  , axil_rf_ctrl.araddr }),    // output wire [63 : 0] m_axi_araddr
    .m_axi_arprot           ({axil_regs.arprot  , axil_rf_ctrl.arprot }),    // output wire [5 : 0] m_axi_arprot
    .m_axi_arvalid          ({axil_regs.arvalid , axil_rf_ctrl.arvalid}),  // output wire [1 : 0] m_axi_arvalid
    .m_axi_arready          ({axil_regs.arready , axil_rf_ctrl.arready}),  // input wire [1 : 0] m_axi_arready
    .m_axi_rdata            ({axil_regs.rdata   , axil_rf_ctrl.rdata  }),      // input wire [63 : 0] m_axi_rdata
    .m_axi_rresp            ({axil_regs.rresp   , axil_rf_ctrl.rresp  }),      // input wire [3 : 0] m_axi_rresp
    .m_axi_rvalid           ({axil_regs.rvalid  , axil_rf_ctrl.rvalid }),    // input wire [1 : 0] m_axi_rvalid
    .m_axi_rready           ({axil_regs.rready  , axil_rf_ctrl.rready })    // output wire [1 : 0] m_axi_rready
);

reg_map #(
    .ADDR_SEGMENT           (16'h8010)
) u_reg_map (
    .axilite_clk            (axilite_clk),
    .axilite_rstb           (axilite_rstb),

    .s_axil                 (ps_s_axilite),
    .regs                   (regs)
);

STREAM #(256) dac_stream();
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
    .start_address          (regs.dac_start_addr),
    .cap_size               (regs.dac_cap_size)
);

STREAM #(128) adc_stream[6]();
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
    .start_address          (regs.adc_start_addr),
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
    .RF_ADC_NUM             (6)
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
    .gt_reset              (!axilite_rstb),
    .gt_init_clk           (axilite_clk),
    .gt_refclk_in          (axilite_clk),
    .gt_txp                (gt_txp),
    .gt_txn                (gt_txn),
    .userclk_out           (gt_usr_clk),
    .userrst_out           (gt_usr_rstb),
    .tx_data               (gt_tx_data),
    .gt_powergood          (regs.gt_powergood)
);

endmodule
