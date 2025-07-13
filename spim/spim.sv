/**
 * @Author: fantl 
 * @Email: fanner@foxmail.com
 * @Date: 2025-05-07 22:16:06 
 * @Last Modified by: 
 * @Last Modified time: 2025-05-07 22:18:29
 * @Description: 
 *  模式0（CPOL=0，CPHA=0）：空闲时钟为低电平，数据在上升沿被采样
 *  模式1（CPOL=0，CPHA=1）：空闲时钟为低电平，数据在下降沿被采样
 *  模式2（CPOL=1，CPHA=0）：空闲时钟为高电平，数据在下降沿被采样
 *  模式3（CPOL=1，CPHA=1）：空闲时钟为高电平，数据在上升沿被采样
 */

`timescale 1ns / 1ps

module SPI_Master #(
    parameter MODE                      = 0                  //MODE=0~3
)(
    input  logic                        clk                 ,//input 1-bit clk
    input  logic                        rst                 ,//input 1-bit rst
    input  logic [15:0]                 div_n               ,//input 16-bit spi_sck div_n
    input  logic [7:0]                  tx_dat              ,//input 8-bit tx data
    input  logic                        tx_lst              ,//input 1-bit tx data last
    input  logic                        tx_vld              ,//input 1-bit tx data valid
    output logic                        tx_rdy              ,//output 1-bit tx ready
    output logic [7:0]                  rx_dat              ,//output 8-bit rx data
    output logic                        rx_vld              ,//output 1-bit rx data valid
    SPI_BUS.master                      m_spi                //SPI_BUS.master
);

    enum logic [5:0] {
        st_IDLE         = 6'b000001 ,
        st_PREP         = 6'b000010 ,
        st_DATA         = 6'b000100 ,
        st_DRDY         = 6'b001000 ,
        st_POST         = 6'b010000 ,
        st_TAIL         = 6'b100000
    } state;

    assign tx_rdy = (state == st_IDLE) | (state == st_DRDY);

    logic [15:0]                r_div_n                 ;
    logic [15:0]                clk_cnt                 ;
    logic [3:0]                 tx_cnt                  ;
    logic                       hit_div_n_1_2           ;
    logic                       hit_div_n_1             ;
    logic                       last_flag               ;
    logic [7:0]                 shift_tx_data           ;
    logic [7:0]                 shift_rx_data           ;
    logic                       lock_rx_pulse           ;

    assign hit_div_n_1_2 = (clk_cnt == r_div_n[15:1]-1) ;
    assign hit_div_n_1   = (clk_cnt == r_div_n-1)       ;

    always @(posedge clk) begin
        if(rst)
            state <= st_IDLE;
        else case (state)
            st_IDLE: begin
                if(tx_vld)
                    state <= st_PREP;
            end
            st_PREP: begin
                if(hit_div_n_1)
                    state <= st_DATA;
            end
            st_DATA: begin
                if((tx_cnt == 4'd7) && hit_div_n_1) begin
                    if(last_flag)
                        state <= st_POST;
                    else  
                        state <= st_DRDY;
                end
            end
            st_DRDY: begin
                if(tx_vld)
                    state <= st_DATA;
            end
            st_POST: begin
                if(hit_div_n_1)
                    state <= st_TAIL;
            end
            st_TAIL: begin
                if(hit_div_n_1)
                    state <= st_IDLE;
            end
            default: begin
                state <= st_IDLE;
            end
        endcase
    end

    always @(posedge clk) begin
        if(rst)
            r_div_n <= 16'd2    ;
        else if(state == st_IDLE)
            r_div_n <= div_n    ;
        else
            r_div_n <= r_div_n  ;
    end

    always @(posedge clk) begin
        if(rst)
            clk_cnt <= 16'd0;
        else if(hit_div_n_1)
            clk_cnt <= 16'd0;
        else if((state == st_PREP) || (state == st_DATA) || (state == st_POST) || (state == st_TAIL))
            clk_cnt <= clk_cnt + 16'd1;
    end

    always @(posedge clk) begin
        if(rst)
            tx_cnt <= 4'd0;
        else if((state == st_IDLE) || (state == st_DRDY))
            tx_cnt <= 4'd0;
        else if((state == st_DATA) && hit_div_n_1)
            tx_cnt <= tx_cnt + 4'd1;
    end

    always @(posedge clk) begin
        if(rst)
            last_flag <= 1'b0;
        else if(tx_vld && tx_lst && tx_rdy)
            last_flag <= 1'b1;
        else if((state == st_DATA) && (tx_cnt == 4'd7) && hit_div_n_1)
            last_flag <= 1'b0;
    end

    always @(posedge clk) begin
        if(rst)
            shift_tx_data <= 8'd0;
        else if(tx_vld && tx_rdy)
            shift_tx_data <= tx_dat;
        else if((!MODE[0] && (state == st_DATA) && hit_div_n_1_2) ||    //第一个沿采样
                ( MODE[0] && (state == st_DATA) && hit_div_n_1))        //第二个沿采样
            shift_tx_data <= {shift_tx_data[6:0], 1'b0};
    end

    always @(posedge clk) begin
        if(rst)
            shift_rx_data <= 8'd0;
        else if((state == st_IDLE) || (state == st_DRDY))
            shift_rx_data <= 8'd0;
        else if((!MODE[0] && (state == st_DATA) && hit_div_n_1_2) ||    //第一个沿采样
                ( MODE[0] && (state == st_DATA) && hit_div_n_1))        //第二个沿采样
            shift_rx_data <= {shift_rx_data[6:0], m_spi.miso};
    end

    always @(posedge clk) begin
        if(rst)
            lock_rx_pulse <= 1'b0;
        else if((!MODE[0] && (state == st_DATA) && (tx_cnt == 4'd7) && hit_div_n_1_2) ||    //第一个沿采样
                ( MODE[0] && (state == st_DATA) && (tx_cnt == 4'd7) && hit_div_n_1))        //第二个沿采样
            lock_rx_pulse <= 1'b1;
        else
            lock_rx_pulse <= 1'b0;
    end

    always @(posedge clk) begin
        if(rst)
            m_spi.csn <= 1'b1;
        else
            m_spi.csn <= (state != st_PREP) & (state != st_DATA) & (state != st_DRDY) & (state != st_POST);
    end

    always @(posedge clk) begin
        if(rst)
            m_spi.sck <= MODE[1] ? 1'b1 : 1'b0;
        else if((state == st_DATA) && hit_div_n_1_2)
            m_spi.sck <= MODE[1] ? 1'b0 : 1'b1;
        else if((state == st_DATA) && hit_div_n_1)
            m_spi.sck <= MODE[1] ? 1'b1 : 1'b0;
    end

    // assign m_spi.mosi = shift_tx_data[7];
generate if(!MODE[0]) begin   //第一个沿采样
    always @(posedge clk) begin
        if(rst)
            m_spi.mosi <= 1'b1;
        else if(tx_vld && tx_rdy)
            m_spi.mosi <= tx_dat[7];
        else if((state == st_DATA) && hit_div_n_1) begin
            if(tx_cnt == 4'd7)
                m_spi.mosi <= m_spi.mosi | last_flag;
            else
                m_spi.mosi <= shift_tx_data[7];
        end
    end
end
else begin
    always @(posedge clk) begin //第二个沿采样
        if(rst)
            m_spi.mosi <= 1'b1;
        else if((state == st_POST) && hit_div_n_1_2)
            m_spi.mosi <= 1'b1;
        else if((state == st_DATA) && hit_div_n_1_2)
            m_spi.mosi <= shift_tx_data[7];
    end
end
endgenerate
    

    always @(posedge clk) begin
        if(rst)
            rx_dat <= 8'd0;
        else if(lock_rx_pulse)
            rx_dat <= shift_rx_data;
    end

    always @(posedge clk) begin
        if(rst)
            rx_vld <= 1'b0;
        else if(lock_rx_pulse)
            rx_vld <= 1'b1;
        else  
            rx_vld <= 1'b0;
    end

endmodule
