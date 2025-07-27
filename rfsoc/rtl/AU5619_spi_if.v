`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/29 16:12:38
// Design Name: 
// Module Name: AU5619_spi_if
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


module AU5619_spi_if #(
        parameter           DATA_WIDTH  =   32,
        parameter           ADDR_WIDTH  =   24
    )(
        input               arst_n,
        input               clk_10m,
        //4 WIRE SPI
        input               m_spi_sdo,
        output              m_spi_sck,
        output              m_spi_ncs,
        output              m_spi_sdi,
        //user interface
        output  reg         spi_cfg_busy,
        input                           spi_cfg_valid,
        input       [DATA_WIDTH-1:0]    spi_cfg_data,
        
        output  reg                     rdback_valid,
        output  reg [DATA_WIDTH-1:0]    rdback_data
    );
    
    localparam          P_IDLE       =   4'd1 ;
    localparam          P_WRITE_ADDR =   4'd2 ;
    localparam          P_WR_GAP     =   4'd3 ;
    localparam          P_WR_GAP1    =   4'd4 ;
    localparam          P_WRITE_DATA =   4'd5 ;
    localparam          P_WR_DELAY   =   4'd6 ;
    localparam          P_SHIFT_DONE =   4'd7 ;
    localparam          P_READ_ADDR  =   4'd8 ;
    localparam          P_READ_DATA  =   4'd9 ;
    localparam          P_RD_DELAY1  =   4'd10;
    localparam          P_RD_DELAY2  =   4'd11;
    localparam          P_RD_DOUT    =   4'd12;
    localparam          P_RD_GAP     =   4'd13;
    localparam          P_RD_GAP1    =   4'd14;
    
    reg         [3:0]   c_state;
    reg         [DATA_WIDTH-1:0]  shift_inreg;
    reg         [DATA_WIDTH-1:0]  shift_outreg;
    reg         [ADDR_WIDTH-1:0]  addr_cache;
    
    reg                 clk_en;
    reg                 spi_cs;
    reg                 spi_mosi;
    reg         [7:0]   trans_bit;
    
    wire                spi_sdo_iddr;

    //FSM
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            c_state <= P_IDLE;
        else
        begin
            case(c_state)
            P_IDLE: begin
                if(spi_cfg_valid)
                begin
                    if(spi_cfg_data[15:13] == 3'b010) //Single Write --> 010xxxxx
                        c_state <= P_WRITE_ADDR;
                    else if(spi_cfg_data[15:13] == 3'b100) //Single Read --> 100xxxxx
                        c_state <= P_READ_ADDR;
                    else
                        c_state <= P_IDLE;
                end
                else
                    c_state <= P_IDLE;
            end
            //--------------------------------------------
            //write data
            P_WRITE_ADDR: begin
                if(trans_bit == ((DATA_WIDTH>>1)-1))
                    c_state <= P_WR_GAP;
                else
                    c_state <= P_WRITE_ADDR;
            end
            P_WR_GAP: begin
                c_state <= P_WR_GAP1;
            end
            P_WR_GAP1: begin
                c_state <= P_WRITE_DATA;
            end
            P_WRITE_DATA: begin
                if(trans_bit == ((DATA_WIDTH>>1)-1))
                    c_state <= P_WR_DELAY;
                else
                    c_state <= P_WRITE_DATA;
            end
            P_WR_DELAY: begin
                c_state <= P_SHIFT_DONE;
            end
            P_SHIFT_DONE: begin
                c_state <= P_IDLE;
            end
            //--------------------------------------------
            //read data
            P_READ_ADDR: begin
                if(trans_bit == ((DATA_WIDTH>>1)-1))
                    c_state <= P_RD_GAP;
                else
                    c_state <= P_READ_ADDR;
            end
            P_RD_GAP: begin
                c_state <= P_RD_GAP1;
            end
            P_RD_GAP1: begin
                c_state <= P_READ_DATA;
            end
            P_READ_DATA: begin
                if(trans_bit == ((DATA_WIDTH>>1)-1))
                    c_state <= P_RD_DELAY1;
                else
                    c_state <= P_READ_DATA;
            end
            P_RD_DELAY1: begin
                c_state <= P_RD_DELAY2;
            end
            P_RD_DELAY2: begin
                c_state <= P_RD_DOUT;
            end
            P_RD_DOUT: begin
                c_state <= P_IDLE;
            end
            default:c_state <= P_IDLE;
            endcase
        end
    end
    //output clock control
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            clk_en <= 1'b0;
        else
        begin
            if((c_state == P_WRITE_ADDR) | (c_state == P_WRITE_DATA) | 
                (c_state == P_READ_ADDR) | (c_state == P_READ_DATA))
               clk_en <= 1'b1;
            else
               clk_en <= 1'b0;
        end
    end
    //spi cs control
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            spi_cs <= 1'b1;
        else
        begin
            if(c_state == P_IDLE)
            begin
                if(spi_cfg_valid)
                    spi_cs <= 1'b0;
                else
                    spi_cs <= 1'b1;
            end
            else if((c_state == P_WRITE_DATA) | (c_state == P_READ_DATA))
                spi_cs <= 1'b0;
            else if((c_state == P_RD_DELAY2)|
                    (c_state == P_SHIFT_DONE)| 
                    (c_state == P_WR_GAP1)| 
                    (c_state == P_RD_GAP1))
                spi_cs <= 1'b1;
            else ;
        end
    end
    //trans bit count
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            trans_bit <= 8'd0;
        else
        begin
            if((c_state == P_WRITE_ADDR) | 
               (c_state == P_WRITE_DATA) |
               (c_state == P_READ_ADDR) |
               (c_state == P_READ_DATA))
                trans_bit <= trans_bit + 1'b1;
            else
                trans_bit <= 8'd0;
        end
    end
    //output data shift
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
        begin
            shift_outreg <= 'd0;
            addr_cache <= 'd0;
            spi_mosi <= 1'b0;
        end
        else
        begin
            if(c_state == P_IDLE)
            begin
                if(spi_cfg_valid)
                begin
                    shift_outreg <= spi_cfg_data;
                    addr_cache <= spi_cfg_data[(DATA_WIDTH-1):(DATA_WIDTH-ADDR_WIDTH)];
                end
                else ;
            end
            else if((c_state == P_WRITE_ADDR) | (c_state == P_WRITE_DATA) | 
               (c_state == P_READ_ADDR) |
               (c_state == P_READ_DATA))
            begin
                shift_outreg <= {shift_outreg[DATA_WIDTH-2:0],1'b0};
                spi_mosi <= shift_outreg[DATA_WIDTH-1];
            end
            else ; 
        end
    end
    //output busy
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            spi_cfg_busy <= 1'b1;
        else
        begin
            if(c_state == P_IDLE)
                spi_cfg_busy <= 1'b0;
            else
                spi_cfg_busy <= 1'b1;
        end
    end
    //input data shift
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
            shift_inreg <= 'd0;
        else
        begin
            if(c_state == P_IDLE)
                shift_inreg <= 'd0;
            else
                shift_inreg <= {shift_inreg[DATA_WIDTH-2:0],spi_sdo_iddr};   
        end
    end
    //read data output
    always @ (posedge clk_10m or negedge arst_n)
    begin
        if(!arst_n)
        begin
            rdback_valid <= 1'b0;
            rdback_data <= 'd0;
        end
        else
        begin
            if(c_state == P_RD_DOUT)
            begin
                rdback_valid <= 1'b1;
                rdback_data <= {addr_cache,shift_inreg[7:0]};
            end
            else
                rdback_valid <= 1'b0;
        end
    end
    
    //IDDR/ODDR deal   
    IDDRE1 #(
        .DDR_CLK_EDGE("OPPOSITE_EDGE"), // IDDRE1 mode (OPPOSITE_EDGE, SAME_EDGE, SAME_EDGE_PIPELINED)
        .IS_CB_INVERTED(1'b0),          // Optional inversion for CB
        .IS_C_INVERTED(1'b0)            // Optional inversion for C
    )
    IDDRE1_sdo (
        .Q1(), // 1-bit output: Registered parallel output 1
        .Q2(spi_sdo_iddr), // 1-bit output: Registered parallel output 2
        .C(clk_10m),   // 1-bit input: High-speed clock
        .CB(!clk_10m), // 1-bit input: Inversion of High-speed clock C
        .D(m_spi_sdo),   // 1-bit input: Serial Data Input
        .R(1'b0)    // 1-bit input: Active-High Async Reset
    );
    
    ODDRE1 #(
        .IS_C_INVERTED(1'b0),           // Optional inversion for C
        .IS_D1_INVERTED(1'b0),          // Unsupported, do not use
        .IS_D2_INVERTED(1'b0),          // Unsupported, do not use
        .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version for simulation functionality (ULTRASCALE,
                                        // ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
        .SRVAL(1'b0)                    // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
    ) ODDRE1_sck (
        .Q(m_spi_sck),   // 1-bit output: Data output to IOB
        .C(clk_10m),   // 1-bit input: High-speed clock input
        .D1(1'b0  ), // 1-bit input: Parallel data input 1
        .D2(clk_en), // 1-bit input: Parallel data input 2
        .SR(1'b0)  // 1-bit input: Active-High Async Reset
    );    

    ODDRE1 #(
        .IS_C_INVERTED(1'b0),           // Optional inversion for C
        .IS_D1_INVERTED(1'b0),          // Unsupported, do not use
        .IS_D2_INVERTED(1'b0),          // Unsupported, do not use
        .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version for simulation functionality (ULTRASCALE,
                                        // ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
        .SRVAL(1'b0)                    // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
    ) ODDRE1_ncs (
        .Q(m_spi_ncs),   // 1-bit output: Data output to IOB
        .C(clk_10m),   // 1-bit input: High-speed clock input
        .D1(spi_cs), // 1-bit input: Parallel data input 1
        .D2(spi_cs), // 1-bit input: Parallel data input 2
        .SR(1'b0)  // 1-bit input: Active-High Async Reset
    );  
 
    ODDRE1 #(
        .IS_C_INVERTED(1'b0),           // Optional inversion for C
        .IS_D1_INVERTED(1'b0),          // Unsupported, do not use
        .IS_D2_INVERTED(1'b0),          // Unsupported, do not use
        .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version for simulation functionality (ULTRASCALE,
                                        // ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
        .SRVAL(1'b0)                    // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
    ) ODDRE1_sdi (
        .Q(m_spi_sdi),   // 1-bit output: Data output to IOB
        .C(clk_10m),   // 1-bit input: High-speed clock input
        .D1(spi_mosi), // 1-bit input: Parallel data input 1
        .D2(spi_mosi), // 1-bit input: Parallel data input 2
        .SR(1'b0)  // 1-bit input: Active-High Async Reset
    );  
    
endmodule
