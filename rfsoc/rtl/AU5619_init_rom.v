`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/29 16:23:15
// Design Name: 
// Module Name: AU5619_init_rom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AU5619_init_rom #(
        parameter           DATA_WIDTH  =   32
    )
    (
        input                           arst_n,
        input                           clk_10m,
        
        output reg                      init_complete,
        output reg                      init_cfg_valid,
        output reg  [DATA_WIDTH-1:0]    init_cfg_data
    );
    
    localparam          P_WAIT      = 4'd1;
    localparam          P_READ_ROM  = 4'd2;
    localparam          P_DELAY1    = 4'd3;
    localparam          P_DELAY2    = 4'd4;
    localparam          P_CHECK     = 4'd5;
    localparam          P_DELAY3    = 4'd6;
    localparam          P_FINISH    = 4'd7;
    
    localparam          DELAY_TIME  = 24'd10000;
    localparam          POWERUP_DELAY  = 24'd10000000;
    
    reg         [3:0]   c_state;

    reg         [23:0]  cnt_delay;
    reg                 cfg_start;
    reg                 delay_finish;
    
    reg         [8:0]   addr;
    wire        [DATA_WIDTH-1:0]  data;

    //configuration data FSM
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            c_state <= P_WAIT;
        else
            case(c_state)
            P_WAIT: begin
                if(cfg_start)
                    c_state <= P_READ_ROM;
                else
                    c_state <= P_WAIT;
            end
            P_READ_ROM:c_state <= P_DELAY1;
            P_DELAY1:c_state <= P_DELAY2;
            P_DELAY2:c_state <= P_CHECK;
            P_CHECK: begin
                if(&data)
                    c_state <= P_FINISH;
                else
                    c_state <= P_DELAY3;
            end
            P_DELAY3: begin
                if(delay_finish)
                    c_state <= P_READ_ROM;
                else
                    c_state <= P_DELAY3;
            end
            P_FINISH:c_state <= P_FINISH;
            default:c_state <= P_WAIT;
            endcase
    end
    //delay
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
        begin
            cnt_delay <= 24'd0;
            cfg_start <= 1'b0;
            delay_finish <= 1'b0;
        end
        else
        begin
            if(c_state == P_WAIT)
            begin
                if(cnt_delay == POWERUP_DELAY)
                    cfg_start <= 1'b1;
                else
                    cnt_delay <= cnt_delay + 1'b1;
            end
            else if(c_state == P_DELAY3)
            begin
                if(cnt_delay == DELAY_TIME)
                    delay_finish <= 1'b1;
                else
                    cnt_delay <= cnt_delay + 1'b1;
            end
            else
            begin
                cnt_delay <= 24'd0;
                cfg_start <= 1'b0;
                delay_finish <= 1'b0;
            end
        end
    end
    //rom out data check
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
        begin
            init_cfg_valid <= 1'b0;
            init_cfg_data <= 'b0;
        end
        else
        begin
            if(c_state == P_CHECK)
            begin
                if(&data)
                    init_cfg_valid <= 1'b0;
                else
                begin
                    init_cfg_valid <= 1'b1;
                    init_cfg_data <= data;
                end    
            end
            else
                init_cfg_valid <= 1'b0;
        end
    end
    //read address control
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            addr <= 'd0;
        else
            if((c_state == P_DELAY3) && delay_finish)
                addr <= addr + 1'b1;
            else ;
    end
    //init_complete
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            init_complete <= 1'b0;
        else
            if(c_state == P_FINISH)
                init_complete <= 1'b1;
            else
                init_complete <= 1'b0;
    end
    
    //configuration ROM
    init_rom_au5619 u_init_rom_AU5619 (
        .clka(clk_10m),    // input wire clka
        .addra(addr),  // input wire [8 : 0] addra
        .douta(data)  // output wire [31 : 0] douta
    );
    
endmodule
