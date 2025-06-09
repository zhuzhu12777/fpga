/**
 * @Author: ftl 
 * @Email: ftl@gaosuxiangji.com
 * @Date: 2025-03-26 19:18:52 
 * @Last Modified by: ftl 
 * @Last Modified time: 2025-03-26 19:18:52
 * @copyright (c) Agile. Inc
 * @Description: 
             ______________________________________________
            | GTY Quad 131 |                | GTH Quad 231 |
         ___| X0Y16-X0Y19  |                | X0Y28-X0Y31  |___
        |   |______________|                |______________|   |
        |   | GTY Quad 130 |                | GTH Quad 230 |   |
refclk0---->| X0Y12-X0Y15  |                | X0Y24-X0Y27  |<----refclk0
        |   |______________|                |______________|   |
        |___| GTY Quad 129 |                | GTH Quad 229 |___|
            | X0Y8-X0Y11   |                | X0Y20-X0Y23  |
            |______________|                |______________|
            | GTY Quad 128 |                | GTH Quad 228 |<----refclk0 for C2C X0Y17
refclk0---->| X0Y4-X0Y7    |                | X0Y16-X0Y19  |___
        |   |______________|                |______________|   |
        |___| GTY Quad 127 |                | GTH Quad 227 |   |
            | X0Y0-X0Y3    |                | X0Y12-X0Y15  |<----refclk0
            |______________|                |______________|   |
            |                               | GTH Quad 226 |___|
            |                               | X0Y8-X0Y11   |
            |                               |______________|
            |                               | GTH Quad 225 |
            |                               | X0Y4-X0Y7    |<----refclk0
            |                               |______________|   |
            |                               | GTH Quad 224 |___|
            |                               | X0Y0-X0Y3    |
            |_______________________________|______________|

 */


`timescale 1ns / 1ps

module GT_Wrapper_All_Quad #(
    parameter EN_ILA                        = 0                     
)(
    input  logic                            gt_init_clk             ,//input 1-bit
    input  logic                            gt_reset                ,//input 1-bit, sync to init_clk
    input  logic                            gth_quad230_refclk0_p   ,//input 1-bit
    input  logic                            gth_quad230_refclk0_n   ,//input 1-bit
    input  logic                            gth_quad227_refclk0_p   ,//input 1-bit
    input  logic                            gth_quad227_refclk0_n   ,//input 1-bit
    input  logic                            gth_quad225_refclk0_p   ,//input 1-bit
    input  logic                            gth_quad225_refclk0_n   ,//input 1-bit
    input  logic                            gty_quad130_refclk0_p   ,//input 1-bit
    input  logic                            gty_quad130_refclk0_n   ,//input 1-bit
    input  logic                            gty_quad128_refclk0_p   ,//input 1-bit
    input  logic                            gty_quad128_refclk0_n   ,//input 1-bit
    input  logic [50:0]                     gt_rxp                  ,//input 51-bit
    input  logic [50:0]                     gt_rxn                  ,//input 51-bit
    output logic [50:0]                     userclk_out             ,//output 51-bit, sync by all below signals
    output logic [50:0]                     userrst_out             ,//output 51-bit
    output logic [50:0][15:0]               rx_data                 ,//output 51*16-bit
    output logic [50:0][1:0]                rx_chariscomma          ,//output 51*2-bit
    output logic [50:0][1:0]                rx_charisk              ,//output 51*2-bit
    output logic [50:0][1:0]                rx_disperr              ,//output 51*2-bit
    output logic [50:0][1:0]                rx_notintable           ,//output 51*2-bit
    output logic [50:0]                     rx_realign              ,//output 51-bit
    output logic [50:0]                     rx_byteisaligned        ,//output 51-bit
    input  logic [50:0]                     encommaalign             //input 51-bit
);

    logic       gth_quad230_refclk      ;
    logic       gth_quad227_refclk      ;
    logic       gth_quad225_refclk      ;
    logic       gty_quad130_refclk      ;
    logic       gty_quad128_refclk      ;
    
    IBUFDS_GTE4 #(
        .REFCLK_EN_TX_PATH  (1'b0       ),
        .REFCLK_HROW_CK_SEL (2'b00      ),
        .REFCLK_ICNTL_RX    (2'b00      )
    ) gth_quad230_refclk_ibuf (
        .I     (gth_quad230_refclk0_p   ),
        .IB    (gth_quad230_refclk0_n   ),
        .CEB   (1'b0                    ),
        .O     (gth_quad230_refclk      ),
        .ODIV2 (                        )
    );

    IBUFDS_GTE4 #(
        .REFCLK_EN_TX_PATH  (1'b0       ),
        .REFCLK_HROW_CK_SEL (2'b00      ),
        .REFCLK_ICNTL_RX    (2'b00      )
    ) gth_quad227_refclk_ibuf (
        .I     (gth_quad227_refclk0_p   ),
        .IB    (gth_quad227_refclk0_n   ),
        .CEB   (1'b0                    ),
        .O     (gth_quad227_refclk      ),
        .ODIV2 (                        )
    );

    IBUFDS_GTE4 #(
        .REFCLK_EN_TX_PATH  (1'b0       ),
        .REFCLK_HROW_CK_SEL (2'b00      ),
        .REFCLK_ICNTL_RX    (2'b00      )
    ) gth_quad225_refclk_ibuf (
        .I     (gth_quad225_refclk0_p   ),
        .IB    (gth_quad225_refclk0_n   ),
        .CEB   (1'b0                    ),
        .O     (gth_quad225_refclk      ),
        .ODIV2 (                        )
    );

    IBUFDS_GTE4 #(
        .REFCLK_EN_TX_PATH  (1'b0       ),
        .REFCLK_HROW_CK_SEL (2'b00      ),
        .REFCLK_ICNTL_RX    (2'b00      )
    ) gty_quad130_refclk_ibuf (
        .I     (gty_quad130_refclk0_p   ),
        .IB    (gty_quad130_refclk0_n   ),
        .CEB   (1'b0                    ),
        .O     (gty_quad130_refclk      ),
        .ODIV2 (                        )
    );

    IBUFDS_GTE4 #(
        .REFCLK_EN_TX_PATH  (1'b0       ),
        .REFCLK_HROW_CK_SEL (2'b00      ),
        .REFCLK_ICNTL_RX    (2'b00      )
    ) gty_quad128_refclk_ibuf (
        .I     (gty_quad128_refclk0_p   ),
        .IB    (gty_quad128_refclk0_n   ),
        .CEB   (1'b0                    ),
        .O     (gty_quad128_refclk      ),
        .ODIV2 (                        )
    );

    logic       ch50_39_userclk         ;
    logic       ch38_28_userclk         ;
    logic       ch27_20_userclk         ;
    logic        ch19_8_userclk         ;
    logic         ch7_0_userclk         ;

    logic       ch50_39_userrst         ;
    logic       ch38_28_userrst         ;
    logic       ch27_20_userrst         ;
    logic        ch19_8_userrst         ;
    logic         ch7_0_userrst         ;

    assign userclk_out[50:39] = {12{ch50_39_userclk}}   ;
    assign userclk_out[38:28] = {11{ch38_28_userclk}}   ;
    assign userclk_out[27:20] = {8{ch27_20_userclk}}    ;
    assign userclk_out[19:8]  = {12{ch19_8_userclk}}    ;
    assign userclk_out[7:0]   = {8{ch7_0_userclk}}      ;

    assign userrst_out[50:39] = {12{ch50_39_userrst}}   ;
    assign userrst_out[38:28] = {11{ch38_28_userrst}}   ;
    assign userrst_out[27:20] = {8{ch27_20_userrst}}    ;
    assign userrst_out[19:8]  = {12{ch19_8_userrst}}    ;
    assign userrst_out[7:0]   = {8{ch7_0_userrst}}      ;

    logic       ch50_39_resetdone       ;
    logic       ch38_28_resetdone       ;
    logic       ch27_20_resetdone       ;
    logic        ch19_8_resetdone       ;
    logic         ch7_0_resetdone       ;

    logic       ch50_39_resetcdc        ;
    logic       ch38_28_resetcdc        ;
    logic       ch27_20_resetcdc        ;
    logic        ch19_8_resetcdc        ;
    logic         ch7_0_resetcdc        ;

    xpm_cdc_sync_rst #(
        .DEST_SYNC_FF   (2  ),//2-10, Number of register stages used to synchronize signal in dest_clk
        .INIT           (1  ),//0-1, 0=initialize synchronization registers to 0, 1=initialize synchronization registers to 1
        .INIT_SYNC_FF   (0  ),//0-1, 0=disable simulation init values, 1=enable simulation init values on sync stages
        .SIM_ASSERT_CHK (0  ) //0-1, 0=disable simulation messages, 1=enable simulation messages
    ) ch50_39_resetcdc_inst (
        .dest_rst       (ch50_39_resetcdc   ),//1-bit output: registered src_rst synchronized to dest_clk
        .dest_clk       (ch50_39_userclk    ),//1-bit input: Destination clock.
        .src_rst        (gt_reset           ) //1-bit input: Source reset signal.
    );

    xpm_cdc_sync_rst #(
        .DEST_SYNC_FF   (2  ),//2-10, Number of register stages used to synchronize signal in dest_clk
        .INIT           (1  ),//0-1, 0=initialize synchronization registers to 0, 1=initialize synchronization registers to 1
        .INIT_SYNC_FF   (0  ),//0-1, 0=disable simulation init values, 1=enable simulation init values on sync stages
        .SIM_ASSERT_CHK (0  ) //0-1, 0=disable simulation messages, 1=enable simulation messages
    ) ch38_28_resetcdc_inst (
        .dest_rst       (ch38_28_resetcdc   ),//1-bit output: registered src_rst synchronized to dest_clk
        .dest_clk       (ch38_28_userclk    ),//1-bit input: Destination clock.
        .src_rst        (gt_reset           ) //1-bit input: Source reset signal.
    );

    xpm_cdc_sync_rst #(
        .DEST_SYNC_FF   (2  ),//2-10, Number of register stages used to synchronize signal in dest_clk
        .INIT           (1  ),//0-1, 0=initialize synchronization registers to 0, 1=initialize synchronization registers to 1
        .INIT_SYNC_FF   (0  ),//0-1, 0=disable simulation init values, 1=enable simulation init values on sync stages
        .SIM_ASSERT_CHK (0  ) //0-1, 0=disable simulation messages, 1=enable simulation messages
    ) ch27_20_resetcdc_inst (
        .dest_rst       (ch27_20_resetcdc   ),//1-bit output: registered src_rst synchronized to dest_clk
        .dest_clk       (ch27_20_userclk    ),//1-bit input: Destination clock.
        .src_rst        (gt_reset           ) //1-bit input: Source reset signal.
    );

    xpm_cdc_sync_rst #(
        .DEST_SYNC_FF   (2  ),//2-10, Number of register stages used to synchronize signal in dest_clk
        .INIT           (1  ),//0-1, 0=initialize synchronization registers to 0, 1=initialize synchronization registers to 1
        .INIT_SYNC_FF   (0  ),//0-1, 0=disable simulation init values, 1=enable simulation init values on sync stages
        .SIM_ASSERT_CHK (0  ) //0-1, 0=disable simulation messages, 1=enable simulation messages
    ) ch19_8_resetcdc_inst (
        .dest_rst       (ch19_8_resetcdc    ),//1-bit output: registered src_rst synchronized to dest_clk
        .dest_clk       (ch19_8_userclk     ),//1-bit input: Destination clock.
        .src_rst        (gt_reset           ) //1-bit input: Source reset signal.
    );

    xpm_cdc_sync_rst #(
        .DEST_SYNC_FF   (2  ),//2-10, Number of register stages used to synchronize signal in dest_clk
        .INIT           (1  ),//0-1, 0=initialize synchronization registers to 0, 1=initialize synchronization registers to 1
        .INIT_SYNC_FF   (0  ),//0-1, 0=disable simulation init values, 1=enable simulation init values on sync stages
        .SIM_ASSERT_CHK (0  ) //0-1, 0=disable simulation messages, 1=enable simulation messages
    ) ch7_0_resetcdc_inst (
        .dest_rst       (ch7_0_resetcdc     ),//1-bit output: registered src_rst synchronized to dest_clk
        .dest_clk       (ch7_0_userclk      ),//1-bit input: Destination clock.
        .src_rst        (gt_reset           ) //1-bit input: Source reset signal.
    );

    always @(posedge ch50_39_userclk) begin
        ch50_39_userrst <= ch50_39_resetcdc | ~ch50_39_resetdone;
    end

    always @(posedge ch38_28_userclk) begin
        ch38_28_userrst <= ch38_28_resetcdc | ~ch38_28_resetdone;
    end

    always @(posedge ch27_20_userclk) begin
        ch27_20_userrst <= ch27_20_resetcdc | ~ch27_20_resetdone;
    end

    always @(posedge ch19_8_userclk) begin
        ch19_8_userrst <= ch19_8_resetcdc | ~ch19_8_resetdone  ;
    end

    always @(posedge ch7_0_userclk) begin
        ch7_0_userrst <= ch7_0_resetcdc | ~ch7_0_resetdone    ;
    end

    GT_Wrapper #(
        .IP_NAME_i          (4                      ),
        .IP_is_GTY          (0                      ),
        .GT_CHN_NUM         (12                     ),
        .EN_ILA             (0                      )
    ) gth_quad229_231 (
        .gt_reset           (gt_reset               ),//input 1-bit, sync to init_clk
        .gt_init_clk        (gt_init_clk            ),//input 1-bit                 
        .gt_refclk_in       (gth_quad230_refclk     ),//input 1-bit                 
        .gt_rxp             (gt_rxp[50:39]          ),//input GT_CHN_NUM-bit
        .gt_rxn             (gt_rxn[50:39]          ),//input GT_CHN_NUM-bit
        .gt_txp             (                       ),//output GT_CHN_NUM-bit
        .gt_txn             (                       ),//output GT_CHN_NUM-bit
        .userclk_out        (ch50_39_userclk        ),//output 1-bit, sync by all below signals
        .tx_data            ({(12*16){1'b0}}        ),//input GT_CHN_NUM*USER_DATA_WIDTH-bit, unuesd
        .tx_charisk         ({(12*2){1'b0}}         ),//input GT_CHN_NUM*2-bit, unuesd
        .rx_data            (rx_data[50:39]         ),//output GT_CHN_NUM*USER_DATA_WIDTH-bit
        .rx_chariscomma     (rx_chariscomma[50:39]  ),//output GT_CHN_NUM*2-bit
        .rx_charisk         (rx_charisk[50:39]      ),//output GT_CHN_NUM*2-bit
        .rx_disperr         (rx_disperr[50:39]      ),//output GT_CHN_NUM*2-bit
        .rx_notintable      (rx_notintable[50:39]   ),//output GT_CHN_NUM*2-bit
        .rx_realign         (rx_realign[50:39]      ),//output GT_CHN_NUM-bit
        .rx_byteisaligned   (rx_byteisaligned[50:39]),//output GT_CHN_NUM-bit
        .encommaalign       (encommaalign[50:39]    ),//input GT_CHN_NUM-bit
        .tx_resetdone       (                       ),//output 1-bit
        .rx_resetdone       (ch50_39_resetdone      ),//output 1-bit
        .gt_powergood       (                       ) //output 1-bit
    );

    GT_Wrapper #(
        .IP_NAME_i          (3                      ),
        .IP_is_GTY          (0                      ),
        .GT_CHN_NUM         (11                     ),
        .EN_ILA             (EN_ILA                 )
    ) gth_quad226_228 (
        .gt_reset           (gt_reset               ),//input 1-bit, sync to init_clk
        .gt_init_clk        (gt_init_clk            ),//input 1-bit                 
        .gt_refclk_in       (gth_quad227_refclk     ),//input 1-bit                 
        .gt_rxp             (gt_rxp[38:28]          ),//input GT_CHN_NUM-bit
        .gt_rxn             (gt_rxn[38:28]          ),//input GT_CHN_NUM-bit
        .gt_txp             (                       ),//output GT_CHN_NUM-bit
        .gt_txn             (                       ),//output GT_CHN_NUM-bit
        .userclk_out        (ch38_28_userclk        ),//output 1-bit, sync by all below signals
        .tx_data            ({(11*16){1'b0}}        ),//input GT_CHN_NUM*USER_DATA_WIDTH-bit, unuesd
        .tx_charisk         ({(11*2){1'b0}}         ),//input GT_CHN_NUM*2-bit, unuesd
        .rx_data            (rx_data[38:28]         ),//output GT_CHN_NUM*USER_DATA_WIDTH-bit
        .rx_chariscomma     (rx_chariscomma[38:28]  ),//output GT_CHN_NUM*2-bit
        .rx_charisk         (rx_charisk[38:28]      ),//output GT_CHN_NUM*2-bit
        .rx_disperr         (rx_disperr[38:28]      ),//output GT_CHN_NUM*2-bit
        .rx_notintable      (rx_notintable[38:28]   ),//output GT_CHN_NUM*2-bit
        .rx_realign         (rx_realign[38:28]      ),//output GT_CHN_NUM-bit
        .rx_byteisaligned   (rx_byteisaligned[38:28]),//output GT_CHN_NUM-bit
        .encommaalign       (encommaalign[38:28]    ),//input GT_CHN_NUM-bit
        .tx_resetdone       (                       ),//output 1-bit
        .rx_resetdone       (ch38_28_resetdone      ),//output 1-bit
        .gt_powergood       (                       ) //output 1-bit
    );
    
    GT_Wrapper #(
        .IP_NAME_i          (2                      ),
        .IP_is_GTY          (0                      ),
        .GT_CHN_NUM         (8                      ),
        .EN_ILA             (0                      )
    ) gth_quad224_225 (
        .gt_reset           (gt_reset               ),//input 1-bit, sync to init_clk
        .gt_init_clk        (gt_init_clk            ),//input 1-bit                 
        .gt_refclk_in       (gth_quad225_refclk     ),//input 1-bit                 
        .gt_rxp             (gt_rxp[27:20]          ),//input GT_CHN_NUM-bit
        .gt_rxn             (gt_rxn[27:20]          ),//input GT_CHN_NUM-bit
        .gt_txp             (                       ),//output GT_CHN_NUM-bit
        .gt_txn             (                       ),//output GT_CHN_NUM-bit
        .userclk_out        (ch27_20_userclk        ),//output 1-bit, sync by all below signals
        .tx_data            ({(8*16){1'b0}}         ),//input GT_CHN_NUM*USER_DATA_WIDTH-bit, unuesd
        .tx_charisk         ({(8*2){1'b0}}          ),//input GT_CHN_NUM*2-bit, unuesd
        .rx_data            (rx_data[27:20]         ),//output GT_CHN_NUM*USER_DATA_WIDTH-bit
        .rx_chariscomma     (rx_chariscomma[27:20]  ),//output GT_CHN_NUM*2-bit
        .rx_charisk         (rx_charisk[27:20]      ),//output GT_CHN_NUM*2-bit
        .rx_disperr         (rx_disperr[27:20]      ),//output GT_CHN_NUM*2-bit
        .rx_notintable      (rx_notintable[27:20]   ),//output GT_CHN_NUM*2-bit
        .rx_realign         (rx_realign[27:20]      ),//output GT_CHN_NUM-bit
        .rx_byteisaligned   (rx_byteisaligned[27:20]),//output GT_CHN_NUM-bit
        .encommaalign       (encommaalign[27:20]    ),//input GT_CHN_NUM-bit
        .tx_resetdone       (                       ),//output 1-bit
        .rx_resetdone       (ch27_20_resetdone      ),//output 1-bit
        .gt_powergood       (                       ) //output 1-bit
    );

    GT_Wrapper #(
        .IP_NAME_i          (1                      ),
        .IP_is_GTY          (1                      ),
        .GT_CHN_NUM         (12                     ),
        .EN_ILA             (EN_ILA                 )
    ) gty_quad129_131 (
        .gt_reset           (gt_reset               ),//input 1-bit, sync to init_clk
        .gt_init_clk        (gt_init_clk            ),//input 1-bit                 
        .gt_refclk_in       (gty_quad130_refclk     ),//input 1-bit                 
        .gt_rxp             (gt_rxp[19:8]           ),//input GT_CHN_NUM-bit
        .gt_rxn             (gt_rxn[19:8]           ),//input GT_CHN_NUM-bit
        .gt_txp             (                       ),//output GT_CHN_NUM-bit
        .gt_txn             (                       ),//output GT_CHN_NUM-bit
        .userclk_out        (ch19_8_userclk         ),//output 1-bit, sync by all below signals
        .tx_data            ({(12*16){1'b0}}        ),//input GT_CHN_NUM*USER_DATA_WIDTH-bit, unuesd
        .tx_charisk         ({(12*2){1'b0}}         ),//input GT_CHN_NUM*2-bit, unuesd
        .rx_data            (rx_data[19:8]          ),//output GT_CHN_NUM*USER_DATA_WIDTH-bit
        .rx_chariscomma     (rx_chariscomma[19:8]   ),//output GT_CHN_NUM*2-bit
        .rx_charisk         (rx_charisk[19:8]       ),//output GT_CHN_NUM*2-bit
        .rx_disperr         (rx_disperr[19:8]       ),//output GT_CHN_NUM*2-bit
        .rx_notintable      (rx_notintable[19:8]    ),//output GT_CHN_NUM*2-bit
        .rx_realign         (rx_realign[19:8]       ),//output GT_CHN_NUM-bit
        .rx_byteisaligned   (rx_byteisaligned[19:8] ),//output GT_CHN_NUM-bit
        .encommaalign       (encommaalign[19:8]     ),//input GT_CHN_NUM-bit
        .tx_resetdone       (                       ),//output 1-bit
        .rx_resetdone       (ch19_8_resetdone       ),//output 1-bit
        .gt_powergood       (                       ) //output 1-bit
    );

    GT_Wrapper #(
        .IP_NAME_i          (0                      ),
        .IP_is_GTY          (1                      ),
        .GT_CHN_NUM         (8                      ),
        .EN_ILA             (0                      )
    ) gty_quad127_128 (
        .gt_reset           (gt_reset               ),//input 1-bit, sync to init_clk
        .gt_init_clk        (gt_init_clk            ),//input 1-bit                 
        .gt_refclk_in       (gty_quad128_refclk     ),//input 1-bit                 
        .gt_rxp             (gt_rxp[7:0]            ),//input GT_CHN_NUM-bit
        .gt_rxn             (gt_rxn[7:0]            ),//input GT_CHN_NUM-bit
        .gt_txp             (                       ),//output GT_CHN_NUM-bit
        .gt_txn             (                       ),//output GT_CHN_NUM-bit
        .userclk_out        (ch7_0_userclk          ),//output 1-bit, sync by all below signals
        .tx_data            ({(8*16){1'b0}}         ),//input GT_CHN_NUM*USER_DATA_WIDTH-bit, unuesd
        .tx_charisk         ({(8*2){1'b0}}          ),//input GT_CHN_NUM*2-bit, unuesd
        .rx_data            (rx_data[7:0]           ),//output GT_CHN_NUM*USER_DATA_WIDTH-bit
        .rx_chariscomma     (rx_chariscomma[7:0]    ),//output GT_CHN_NUM*2-bit
        .rx_charisk         (rx_charisk[7:0]        ),//output GT_CHN_NUM*2-bit
        .rx_disperr         (rx_disperr[7:0]        ),//output GT_CHN_NUM*2-bit
        .rx_notintable      (rx_notintable[7:0]     ),//output GT_CHN_NUM*2-bit
        .rx_realign         (rx_realign[7:0]        ),//output GT_CHN_NUM-bit
        .rx_byteisaligned   (rx_byteisaligned[7:0]  ),//output GT_CHN_NUM-bit
        .encommaalign       (encommaalign[7:0]      ),//input GT_CHN_NUM-bit
        .tx_resetdone       (                       ),//output 1-bit
        .rx_resetdone       (ch7_0_resetdone        ),//output 1-bit
        .gt_powergood       (                       ) //output 1-bit
    );

endmodule

