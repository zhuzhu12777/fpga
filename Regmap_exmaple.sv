/**
 * @Author: fantl 
 * @Email: fanner@foxmail.com
 * @Date: 2025-05-07 22:25:13 
 * @Last Modified by: 
 * @Last Modified time: 2025-05-07 22:36:15
 * @Description: 
 * 
 */


`timescale 1ns / 1ps

interface RFSOC_RM_INTF;
    logic [31:0]        dac_start_addr              ;
    logic [31:0]        dac_data_size               ;
    logic               dac_reset                   ;
    logic               dac_start                   ;

    logic [31:0]        adc_start_addr              ;
    logic [31:0]        adc_cap_size                ;
    logic               adc_cap_done                ;
    logic               adc_reset_adc               ;
    logic               adc_start_adc               ;

    logic [3:0]         gty_chn                     ;
    logic [7:0]         gty_ram_addr                ;
    logic [31:0]        gty_ram_data                ;
    logic               gty_ram_wren                ;
    logic               gty_reset                   ;
    logic               gty_start                   ;
    
    
    modport master (
        output dac_start_addr, dac_data_size, dac_reset, dac_start,
               adc_start_addr, adc_cap_size, adc_reset_adc, adc_start_adc,
               gty_chn, gty_ram_addr, gty_ram_data, gty_ram_wren, gty_reset, gty_start,
        input  adc_cap_done
    );
endinterface

module RFSoC_Regmap (
    input  logic                clk                     ,//input 1-bit clk
    input  logic                rst                     ,//input 1-bit rst
    AXI4Lite.slave              s_axil                  ,//AXI4Lite.slave
    RFSOC_RM_INTF.master        rm_intf                  //RFSOC_RM_INTF.master
);

    localparam REG_ADDR_UPPER   = 16'H0010                                  ;
    localparam REG_DW_NUM       = REG_ADDR_UPPER / 4                        ;
    localparam ADDR_MSB         = $clog2(REG_ADDR_UPPER) - 1                ;

    localparam [ADDR_MSB-2:0] A_REG_VERSION                 = 16'H0000 / 4  ;
    localparam [ADDR_MSB-2:0] A_PART_TAG                    = 16'H0004 / 4  ;
    localparam [ADDR_MSB-2:0] A_PART_LOWER                  = 16'H0008 / 4  ;
    localparam [ADDR_MSB-2:0] A_PART_UPPER                  = 16'H000C / 4  ;

    REG_BUS                         regbus()                    ;
    logic [31:0]                    regmap [REG_DW_NUM]         ;

    AXI4Lite_Regbus axil_regbus (
        .clk                        (clk                        ),
        .rst                        (rst                        ),
        .s_axil                     (s_axil                     ),
        .m_regbus                   (regbus                     )
    );

    //write regmap
    always_ff @ (posedge clk) begin
        if(rst) begin  //复位默认值
            for(int i=0; i<REG_DW_NUM; i++)
                regmap[i] <= 32'd0;
            regmap[A_RT_CTRL][7:0] <= 8'd1;
            regmap[A_RT_FRM_TIME]  <= 32'd50000;
        end
        else if (regbus.wren && (regbus.waddr[ADDR_MSB:2]<REG_DW_NUM)) begin
            for(int byte_i=0; byte_i<4; byte_i++) begin
                if(regbus.wstrb[byte_i])
                    regmap[regbus.waddr[ADDR_MSB:2]][(byte_i*8)+: 8] <= regbus.wdata[(byte_i*8)+: 8];
            end
        end
        else begin      //自动清零的信号
            regmap[A_PART_CTRL]  <= 32'd0;
            regmap[A_TOKEN_CTRL][8] <= 1'b0;
        end
    end

    //read regmap
    always_ff @(posedge clk) begin
        if(rst) begin
            regbus.rdata <= 32'd0;
            regbus.rvld  <= 1'b0;
        end
        else if(regbus.rden) begin
            case (regbus.raddr[ADDR_MSB:2])
                A_CUR_PART_TAG              : regbus.rdata <= ddrm_intf.cur_part_tag          ;
                A_CUR_PART_LOWER            : regbus.rdata <= ddrm_intf.cur_part_lower        ;
                A_CUR_PART_UPPER            : regbus.rdata <= ddrm_intf.cur_part_upper        ;
                A_CUR_PART_FRM_CNT          : regbus.rdata <= ddrm_intf.cur_part_frm_cnt      ;
                A_CUR_PART_FRM_NO_END       : regbus.rdata <= ddrm_intf.cur_part_frm_no_end   ;
                A_CUR_PART_REC_PROGRESS     : regbus.rdata <= ddrm_intf.cur_part_rec_progress ;
                A_CUR_PART_STATUS           : regbus.rdata <= ddrm_intf.cur_part_status       ;
                A_RET_STATUS                : regbus.rdata <= ddrm_intf.ret_status            ;
                A_RET_PART_TAG              : regbus.rdata <= ddrm_intf.ret_part_tag          ;
                A_RET_LAST_FRM_ADDR         : regbus.rdata <= ddrm_intf.ret_last_frm_addr     ;
                A_RET_FRM_CNT               : regbus.rdata <= ddrm_intf.ret_frm_cnt           ;
                A_RET_FRM_NO_END            : regbus.rdata <= ddrm_intf.ret_frm_no_end        ;
                A_RET_TRIG_TIM_YD           : regbus.rdata <= ddrm_intf.ret_trig_tim_yd       ;
                A_RET_TRIG_TIM_HMS          : regbus.rdata <= ddrm_intf.ret_trig_tim_hms      ;
                A_RET_TRIG_TIM_NS           : regbus.rdata <= ddrm_intf.ret_trig_tim_ns       ;
                A_STATUS0                   : regbus.rdata <= ddrm_intf.status0               ;
                A_STATUS1                   : regbus.rdata <= ddrm_intf.status1               ;
                A_STATUS2                   : regbus.rdata <= ddrm_intf.status2               ;
                A_STATUS3                   : regbus.rdata <= ddrm_intf.status3               ;
                A_SPI_CTRL                  : regbus.rdata <= {8'd0, rd_valid_flag, regmap[A_SPI_CTRL][22:8], rd_data};
                default: regbus.rdata <= regbus.raddr[ADDR_MSB:2] < REG_DW_NUM ? 
                                         regmap[regbus.raddr[ADDR_MSB:2]] : 32'd0             ; 
            endcase
            regbus.rvld <= 1'b1;
        end
        else begin
            regbus.rvld <= 1'b0;
        end
    end

    assign spi_intf.spi0_ctrl = regmap[A_SPI_CTRL][23:0];

    assign ddrm_intf.part_tag               = regmap[A_PART_TAG]                    ;
    assign ddrm_intf.part_lower             = regmap[A_PART_LOWER]                  ;
    assign ddrm_intf.part_upper             = regmap[A_PART_UPPER]                  ;
    assign ddrm_intf.part_frm_cnt           = regmap[A_PART_FRM_CNT]                ;
    assign ddrm_intf.part_frm_no_end        = regmap[A_PART_FRM_NO_END]             ;
    assign ddrm_intf.part_fifo_wr           = regmap[A_PART_CTRL][0]                ;
    assign ddrm_intf.part_prew_wr           = regmap[A_PART_CTRL][1]                ;
    assign ddrm_intf.part_fifo_clr          = regmap[A_PART_CTRL][2]                ;
    assign ddrm_intf.force_finish           = regmap[A_PART_CTRL][3]                ;
    assign ddrm_intf.rt_token_prio          = regmap[A_RT_CTRL][7:0]                ;
    assign ddrm_intf.rt_frm_time            = regmap[A_RT_FRM_TIME]                 ;
    assign ddrm_intf.control0               = regmap[A_CONTROL0]                    ;
    assign ddrm_intf.control1               = regmap[A_CONTROL1]                    ;
    assign ddrm_intf.control2               = regmap[A_CONTROL2]                    ;
    assign ddrm_intf.control3               = regmap[A_CONTROL3]                    ;
    
endmodule
