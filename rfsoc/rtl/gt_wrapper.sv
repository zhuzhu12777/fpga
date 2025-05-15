/**
 * @Author: fantl 
 * @Email: fanner@foxmail.com
 * @Date: 2025-05-07 22:36:38 
 * @Last Modified by: 
 * @Last Modified time: 2025-05-07 22:58:23
 * @Description: 
 * 
 */


`timescale 1ns / 1ps

module GT_TX_Wrapper #(
    parameter GT_CHN_NUM                                = 6             ,
    parameter MASTER_CHN                                = GT_CHN_NUM / 2,
    parameter USER_DATA_WIDTH                           = 32            
)(
    input  logic                                        gt_reset        ,//input 1-bit, sync to init_clk
    input  logic                                        gt_init_clk     ,//input 1-bit
    input  logic                                        gt_refclk_in    ,//input 1-bit
    output logic [GT_CHN_NUM-1:0]                       gt_txp          ,//output GT_CHN_NUM-bit
    output logic [GT_CHN_NUM-1:0]                       gt_txn          ,//output GT_CHN_NUM-bit
    output logic                                        userclk_out     ,//output 1-bit, sync by all below signals
    input  logic [GT_CHN_NUM-1:0][USER_DATA_WIDTH-1:0]  tx_data         ,//input GT_CHN_NUM*USER_DATA_WIDTH-bit, unuesd
    output logic                                        tx_resetdone    ,//output 1-bit
    output logic                                        gt_powergood     //output 1-bit
);

    `define GT_IP_NAME_0 GTY_Raw_6CHN
    `define GT_IP_NAME_1 

    localparam IP_is_GTY = 1;
    localparam IP_NAME_i = 0;

    genvar                                  i                                       ;
    logic                                   gtwiz_userclk_tx_reset_in               ;
    logic                                   gtwiz_userclk_rx_reset_in               ;
    logic                                   gtwiz_userclk_tx_active_in              ;
    logic                                   gtwiz_userclk_rx_active_in              ;
    logic                                   gtwiz_reset_clk_freerun_in              ;
    logic                                   gtwiz_reset_all_in                      ;
    logic                                   gtwiz_reset_tx_pll_and_datapath_in      ;
    logic                                   gtwiz_reset_tx_datapath_in              ;
    logic                                   gtwiz_reset_rx_pll_and_datapath_in      ;
    logic                                   gtwiz_reset_rx_datapath_in              ;
    logic                                   gtwiz_reset_rx_cdr_stable_out           ;
    logic                                   gtwiz_reset_tx_done_out                 ;
    logic                                   gtwiz_reset_rx_done_out                 ;
    logic [GT_CHN_NUM*USER_DATA_WIDTH-1:0]  gtwiz_userdata_tx_in                    ;
    logic [GT_CHN_NUM*USER_DATA_WIDTH-1:0]  gtwiz_userdata_rx_out                   ;
    logic [GT_CHN_NUM-1:0]                  drpclk_in                               ;
    logic [GT_CHN_NUM-1:0]                  gtrefclk0_in                            ;
    logic [GT_CHN_NUM-1:0]                  gthrxn_in                               ;
    logic [GT_CHN_NUM-1:0]                  gthrxp_in                               ;
    logic [GT_CHN_NUM-1:0]                  gtyrxn_in                               ;
    logic [GT_CHN_NUM-1:0]                  gtyrxp_in                               ;
    logic [GT_CHN_NUM-1:0]                  rxusrclk_in                             ;
    logic [GT_CHN_NUM-1:0]                  rxusrclk2_in                            ;
    logic [GT_CHN_NUM-1:0]                  txusrclk_in                             ;
    logic [GT_CHN_NUM-1:0]                  txusrclk2_in                            ;
    logic [GT_CHN_NUM-1:0]                  gtpowergood_out                         ;
    logic [GT_CHN_NUM-1:0]                  gtytxn_out                              ;
    logic [GT_CHN_NUM-1:0]                  gtytxp_out                              ;
    logic [GT_CHN_NUM-1:0]                  rxoutclk_out                            ;
    logic [GT_CHN_NUM-1:0]                  rxpmaresetdone_out                      ;
    logic [GT_CHN_NUM-1:0]                  txoutclk_out                            ;
    logic [GT_CHN_NUM-1:0]                  txpmaresetdone_out                      ;

    logic       txusrclk2_int               ;
    logic       rxusrclk2_int               ;
    logic       txpll_not_locked            ;
    logic       rxpll_not_locked            ;

    assign userclk_out   = txusrclk2_int    ;
    assign rxusrclk2_int = txusrclk2_int    ;

    BUFG_GT tx_userclk_buf (
        .I       (txoutclk_out[MASTER_CHN]  ),
        .CE      (1'b1                      ),
        .DIV     (3'b000                    ),
        .CEMASK  (1'b0                      ),
        .CLR     (gtwiz_userclk_tx_reset_in ), 
        .CLRMASK (1'b0                      ),
        .O       (txusrclk2_int             )
    );
    
    // BUFG_GT rx_userclk_buf (
    //     .I       (rxoutclk_out[MASTER_CHN]  ),
    //     .CE      (1'b1                      ),
    //     .DIV     (3'b000                    ),
    //     .CEMASK  (1'b0                      ),
    //     .CLR     (gtwiz_userclk_rx_reset_in ), 
    //     .CLRMASK (1'b0                      ),
    //     .O       (rxusrclk2_int             )
    // );

    assign gtwiz_userclk_tx_reset_in = ~(&txpmaresetdone_out)   ;//只使能了TX
    assign gtwiz_userclk_rx_reset_in = ~(&txpmaresetdone_out)   ;

    always @(posedge txusrclk2_int) begin 
        if(gtwiz_userclk_tx_reset_in)
            txpll_not_locked  <=  1'b1;
        else
            txpll_not_locked  <=  1'b0;
        
        gtwiz_userclk_tx_active_in <= ~txpll_not_locked ;
    end

    always @(posedge rxusrclk2_int) begin
        if(gtwiz_userclk_rx_reset_in)
            rxpll_not_locked  <=  1'b1;
        else
            rxpll_not_locked  <=  1'b0;
        
        gtwiz_userclk_rx_active_in <= ~rxpll_not_locked ;
    end

    assign gtwiz_reset_clk_freerun_in           = gt_init_clk   ;
    assign gtwiz_reset_all_in                   = 1'b0          ;//sync to init_clk
    assign gtwiz_reset_tx_datapath_in    	    = 1'b0          ;//sync to init_clk
    assign gtwiz_reset_rx_datapath_in           = 1'b0          ;//sync to init_clk
    assign gtwiz_reset_tx_pll_and_datapath_in	= gt_reset      ;//sync to init_clk
    assign gtwiz_reset_rx_pll_and_datapath_in   = gt_reset      ;//sync to init_clk
    
    assign gtwiz_userdata_tx_in             = tx_data                   ;
    // assign rx_data                          = gtwiz_userdata_rx_out     ;
    
    generate if(IP_is_GTY) begin: gty
        assign gtyrxp_in                    = gt_rxp                    ;
        assign gtyrxn_in                    = gt_rxn                    ;
        assign gt_txp                       = gtytxp_out                ;
        assign gt_txn                       = gtytxn_out                ;
    end
    else begin: gth
        assign gthrxp_in                    = gt_rxp                    ;
        assign gthrxn_in                    = gt_rxn                    ;
        assign gt_txp                       = gthtxp_out                ;
        assign gt_txn                       = gthtxn_out                ;
    end
    endgenerate

    generate for(i=0; i<GT_CHN_NUM; i=i+1) begin
        assign drpclk_in[i]             = gt_init_clk               ;
        assign gtrefclk0_in[i]          = gt_refclk_in              ;
        assign rxusrclk_in[i]           = rxusrclk2_int             ;//sync_clk = user_clk
        assign rxusrclk2_in[i]          = rxusrclk2_int             ;
        assign txusrclk_in[i]           = txusrclk2_int             ;//sync_clk = user_clk
        assign txusrclk2_in[i]          = txusrclk2_int             ;
    end
    endgenerate

    logic [2:0]             gt_rxresetdone_r        ;
    logic [2:0]             gt_txresetdone_r        ;
    logic [2:0]             gt_powergood_r          ;

    assign rx_resetdone     = gt_rxresetdone_r[2]   ;
    assign tx_resetdone     = gt_txresetdone_r[2]   ;
    assign gt_powergood     = gt_powergood_r[2]     ;
    
    always @(posedge userclk_out) begin
        gt_rxresetdone_r    <= {gt_rxresetdone_r[1:0], gtwiz_reset_rx_done_out};
        gt_txresetdone_r    <= {gt_txresetdone_r[1:0], gtwiz_reset_tx_done_out};
        gt_powergood_r      <= {gt_powergood_r[1:0]  , &gtpowergood_out       };
    end
    
    generate
             if(IP_NAME_i == 0) begin: ip0 `GT_IP_NAME_0 gt_inst (.*); end
        else if(IP_NAME_i == 1) begin: ip1 `GT_IP_NAME_1 gt_inst (.*); end
    endgenerate

endmodule
