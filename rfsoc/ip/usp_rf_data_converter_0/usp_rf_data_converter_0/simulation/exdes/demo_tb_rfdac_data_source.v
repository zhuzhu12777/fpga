// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 
`timescale 1ps / 1ps

// Uncomment the line below to allow signal type selection via the AXI interface
// This also enables full control over the initial start values for the generation counters
`define DACEXDES_ENABLETYPE_SELECTION

(* DowngradeIPIdentifiedWarnings="yes" *)
module demo_tb_rfdac_data_source #(
  
  parameter  enable_override          = 1'd1, // 

  parameter  default_signal_type      = 4'h4, //
  parameter  initial_interword_offset = 1     // 

) (

   // AXI-Lite Interface
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR"  *) input  wire [17:0] s_axi_awaddr   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input  wire        s_axi_awvalid  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output wire        s_axi_awready  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA"   *) input  wire [31:0] s_axi_wdata    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID"  *) input  wire        s_axi_wvalid   , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY"  *) output wire        s_axi_wready   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB"   *) input  wire  [3:0] s_axi_wstrb    , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP"   *) output wire  [1:0] s_axi_bresp    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID"  *) output wire        s_axi_bvalid   , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY"  *) input  wire        s_axi_bready   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR"  *) input  wire [17:0] s_axi_araddr   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input  wire        s_axi_arvalid  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output wire        s_axi_arready  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA"   *) output wire [31:0] s_axi_rdata    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP"   *) output wire  [1:0] s_axi_rresp    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID"  *) output wire        s_axi_rvalid   , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY"  *) input  wire        s_axi_rready   , // 

   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00 TDATA" *)       output wire [255:0] m00_tdata ,     //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00 TVALID" *)      output wire         m00_tvalid,     //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00 TREADY" *)      input  wire         m00_tready,     //


   (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m0_axis_clock CLK" *)
   (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m00" *)
   input  wire           m0_axis_clock, //
   // AXI-Lite Clock/Reset. Be explicit with the IPI interface declarations
   (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *)
   (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi" *)
   input  wire           s_axi_aclk   ,
   (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *)
   (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
   input  wire           s_axi_aresetn
  
  );

// ----------------------------------------------------------------------------
// Local params
// ----------------------------------------------------------------------------
localparam  p_useable_w         = 16; // 
localparam  p_increment_w       = 7;  // 
localparam  p_data_inc_val_init = 1;  // 
localparam  p_data_type_width   = 4;  // 
localparam  p_init_incval       = 8;  // 
localparam  p_con_w             = 16; //

// ----------------------------------------------------------------------------
// Wire declarations
// ----------------------------------------------------------------------------
wire                            enable;
wire                            timeout_enable;
wire                     [11:0] timeout_value;
wire                     [3:0] axis_resetn_rt;
(* ASYNC_REG = "TRUE" *) reg [5:0] s_axi_aresetn_r [3:0];
wire                     [15:0] m00_dg_enable; //
wire                      [7:0] m00_dg_control;//
wire        [p_increment_w-1:0] m00_dg_inc   ; //
wire                    [255:0] m00_dg_init  ; //
wire                    [255:0] m00_dg_init_i; //
wire    [p_data_type_width-1:0] m00_dg_type  ; //

wire                            m00_dg_pulse_control_0;//
wire                     [15:0] m00_dg_i_value_0      ;//
wire                     [15:0] m00_dg_q_value_0      ;//
wire                      [2:0] m00_dg_mult_control_0 ;//


`ifndef DACEXDES_ENABLETYPE_SELECTION
assign m00_dg_init[(16* 1) - 1 : (16* 0)]  =  0 * initial_interword_offset;
assign m00_dg_init[(16* 2) - 1 : (16* 1)]  =  1 * initial_interword_offset;
assign m00_dg_init[(16* 3) - 1 : (16* 2)]  =  2 * initial_interword_offset;
assign m00_dg_init[(16* 4) - 1 : (16* 3)]  =  3 * initial_interword_offset;
assign m00_dg_init[(16* 5) - 1 : (16* 4)]  =  4 * initial_interword_offset;
assign m00_dg_init[(16* 6) - 1 : (16* 5)]  =  5 * initial_interword_offset;
assign m00_dg_init[(16* 7) - 1 : (16* 6)]  =  6 * initial_interword_offset;
assign m00_dg_init[(16* 8) - 1 : (16* 7)]  =  7 * initial_interword_offset;
assign m00_dg_init[(16* 9) - 1 : (16* 8)]  =  8 * initial_interword_offset;
assign m00_dg_init[(16*10) - 1 : (16* 9)]  =  9 * initial_interword_offset;
assign m00_dg_init[(16*11) - 1 : (16*10)]  = 10 * initial_interword_offset;
assign m00_dg_init[(16*12) - 1 : (16*11)]  = 11 * initial_interword_offset;
assign m00_dg_init[(16*13) - 1 : (16*12)]  = 12 * initial_interword_offset;
assign m00_dg_init[(16*14) - 1 : (16*13)]  = 13 * initial_interword_offset;
assign m00_dg_init[(16*15) - 1 : (16*14)]  = 14 * initial_interword_offset;
assign m00_dg_init[(16*16) - 1 : (16*15)]  = 15 * initial_interword_offset;
`endif

dg_slice #(
   
  .p_cons        (16),
  .p_con_w       (p_con_w),
  .p_useable_w   (p_useable_w),
  .p_increment_w (p_increment_w),
  .p_data_type_w (p_data_type_width)

) dg_slice_00 (

   .clk       ( m0_axis_clock ),
   .dg_enable ( m00_dg_enable[15:0] | {16{enable_override}}),
   .dg_inc    ( m00_dg_inc       ),
`ifdef DACEXDES_ENABLETYPE_SELECTION
   .dg_type   ( m00_dg_type      ),
`else
   .dg_type   ( default_signal_type   ),
`endif
   .dg_init   ( m00_dg_init      ),
   .dg_control( m00_dg_control   ), //

   .dg_tdata  ( m00_tdata        ),
   .dg_tvalid ( m00_tvalid       ),
   .dg_tready ( m00_tready       )

);

//-----------------------------------------------------------------------------
// Retime the AXIS resets for each tile
//-----------------------------------------------------------------------------
always @(posedge m0_axis_clock) begin
  s_axi_aresetn_r[0][5:1] <= s_axi_aresetn_r[0][4:0];
  s_axi_aresetn_r[0][0]   <= s_axi_aresetn;
end
assign axis_resetn_rt[0] = s_axi_aresetn_r[0][5];
assign axis_resetn_rt[1] = s_axi_aresetn;
assign axis_resetn_rt[2] = s_axi_aresetn;
assign axis_resetn_rt[3] = s_axi_aresetn;

//-----------------------------------------------------------------------------
// Control and status registers
//-----------------------------------------------------------------------------
rfdac_source_demo_tb_ctrl rfdac_demo_tb_ctrl_i (
   .dac00_dg_enable_0            (m00_dg_enable ), //
   .dac00_dg_inc_0               (m00_dg_inc    ), //
   .dac00_dg_inc_0_pdef          (7'd16), //
   .dac00_dg_type_0              (m00_dg_type   ), //
   .dac00_dg_type_0_pdef         ( default_signal_type ), //
`ifdef DACEXDES_ENABLETYPE_SELECTION
   .dac00_dg_init_0              (m00_dg_init_i   ), //
`else
   .dac00_dg_init_0              (), //
`endif
   .dac00_dg_control_0           (m00_dg_control), //
   .dac00_dg_control_0_pdef      (8'd0), //
   .dac00_dg_pulse_control_0     (m00_dg_pulse_control_0), //
   .dac00_dg_i_value_0           (m00_dg_i_value_0      ), //
   .dac00_dg_q_value_0           (m00_dg_q_value_0      ), //
   .dac00_dg_mult_control_0      (m00_dg_mult_control_0 ), //
   .dac00_dg_i_value_0_pdef      (16'd0), //
   .dac00_dg_q_value_0_pdef      (16'd0), //
   .dac00_dg_mult_control_0_pdef (3'd0),  //

   .dac01_dg_type_0_pdef         (4'd0), //
   .dac01_dg_control_0_pdef      (8'd0), //
   .dac01_dg_inc_0_pdef          (7'd0),//
   .dac01_dg_enable_0            (), //
   .dac01_dg_inc_0               (), //
   .dac01_dg_type_0              (), //
   .dac01_dg_init_0              (), //
   .dac01_dg_control_0           (), //
   .dac01_dg_pulse_control_0     (), //
   .dac01_dg_i_value_0           (), //
   .dac01_dg_q_value_0           (), //
   .dac01_dg_mult_control_0      (), //
   .dac01_dg_i_value_0_pdef      (16'd0), //
   .dac01_dg_q_value_0_pdef      (16'd0), //
   .dac01_dg_mult_control_0_pdef (3'd0),  //

   .dac02_dg_type_0_pdef         (4'd0), //
   .dac02_dg_control_0_pdef      (8'd0), //
   .dac02_dg_inc_0_pdef          (7'd0),//
   .dac02_dg_enable_0            (), //
   .dac02_dg_inc_0               (), //
   .dac02_dg_type_0              (), //
   .dac02_dg_init_0              (), //
   .dac02_dg_control_0           (), //
   .dac02_dg_pulse_control_0     (), //
   .dac02_dg_i_value_0           (), //
   .dac02_dg_q_value_0           (), //
   .dac02_dg_mult_control_0      (), //
   .dac02_dg_i_value_0_pdef      (16'd0), //
   .dac02_dg_q_value_0_pdef      (16'd0), //
   .dac02_dg_mult_control_0_pdef (3'd0),  //

   .dac03_dg_type_0_pdef         (4'd0), //
   .dac03_dg_control_0_pdef      (8'd0), //
   .dac03_dg_inc_0_pdef          (7'd0),//
   .dac03_dg_enable_0            (), //
   .dac03_dg_inc_0               (), //
   .dac03_dg_type_0              (), //
   .dac03_dg_init_0              (), //
   .dac03_dg_control_0           (), //
   .dac03_dg_pulse_control_0     (), //
   .dac03_dg_i_value_0           (), //
   .dac03_dg_q_value_0           (), //
   .dac03_dg_mult_control_0      (), //
   .dac03_dg_i_value_0_pdef      (16'd0), //
   .dac03_dg_q_value_0_pdef      (16'd0), //
   .dac03_dg_mult_control_0_pdef (3'd0),  //

   .dac10_dg_type_0_pdef         (4'd0), //
   .dac10_dg_control_0_pdef      (8'd0), //
   .dac10_dg_inc_0_pdef          (7'd0),//
   .dac10_dg_enable_0            (), //
   .dac10_dg_inc_0               (), //
   .dac10_dg_type_0              (), //
   .dac10_dg_init_0              (), //
   .dac10_dg_control_0           (), //
   .dac10_dg_pulse_control_0     (), //
   .dac10_dg_i_value_0           (), //
   .dac10_dg_q_value_0           (), //
   .dac10_dg_mult_control_0      (), //
   .dac10_dg_i_value_0_pdef      (16'd0), //
   .dac10_dg_q_value_0_pdef      (16'd0), //
   .dac10_dg_mult_control_0_pdef (3'd0),  //

   .dac11_dg_type_0_pdef         (4'd0), //
   .dac11_dg_control_0_pdef      (8'd0), //
   .dac11_dg_inc_0_pdef          (7'd0),//
   .dac11_dg_enable_0            (), //
   .dac11_dg_inc_0               (), //
   .dac11_dg_type_0              (), //
   .dac11_dg_init_0              (), //
   .dac11_dg_control_0           (), //
   .dac11_dg_pulse_control_0     (), //
   .dac11_dg_i_value_0           (), //
   .dac11_dg_q_value_0           (), //
   .dac11_dg_mult_control_0      (), //
   .dac11_dg_i_value_0_pdef      (16'd0), //
   .dac11_dg_q_value_0_pdef      (16'd0), //
   .dac11_dg_mult_control_0_pdef (3'd0),  //

   .dac12_dg_type_0_pdef         (4'd0), //
   .dac12_dg_control_0_pdef      (8'd0), //
   .dac12_dg_inc_0_pdef          (7'd0),//
   .dac12_dg_enable_0            (), //
   .dac12_dg_inc_0               (), //
   .dac12_dg_type_0              (), //
   .dac12_dg_init_0              (), //
   .dac12_dg_control_0           (), //
   .dac12_dg_pulse_control_0     (), //
   .dac12_dg_i_value_0           (), //
   .dac12_dg_q_value_0           (), //
   .dac12_dg_mult_control_0      (), //
   .dac12_dg_i_value_0_pdef      (16'd0), //
   .dac12_dg_q_value_0_pdef      (16'd0), //
   .dac12_dg_mult_control_0_pdef (3'd0),  //

   .dac13_dg_type_0_pdef         (4'd0), //
   .dac13_dg_control_0_pdef      (8'd0), //
   .dac13_dg_inc_0_pdef          (7'd0),//
   .dac13_dg_enable_0            (), //
   .dac13_dg_inc_0               (), //
   .dac13_dg_type_0              (), //
   .dac13_dg_init_0              (), //
   .dac13_dg_control_0           (), //
   .dac13_dg_pulse_control_0     (), //
   .dac13_dg_i_value_0           (), //
   .dac13_dg_q_value_0           (), //
   .dac13_dg_mult_control_0      (), //
   .dac13_dg_i_value_0_pdef      (16'd0), //
   .dac13_dg_q_value_0_pdef      (16'd0), //
   .dac13_dg_mult_control_0_pdef (3'd0),  //

   .dac20_dg_type_0_pdef         (4'd0), //
   .dac20_dg_control_0_pdef      (8'd0), //
   .dac20_dg_inc_0_pdef          (7'd0),//
   .dac20_dg_enable_0            (), //
   .dac20_dg_inc_0               (), //
   .dac20_dg_type_0              (), //
   .dac20_dg_init_0              (), //
   .dac20_dg_control_0           (), //
   .dac20_dg_pulse_control_0     (), //
   .dac20_dg_i_value_0           (), //
   .dac20_dg_q_value_0           (), //
   .dac20_dg_mult_control_0      (), //
   .dac20_dg_i_value_0_pdef      (16'd0), //
   .dac20_dg_q_value_0_pdef      (16'd0), //
   .dac20_dg_mult_control_0_pdef (3'd0),  //

   .dac21_dg_type_0_pdef         (4'd0), //
   .dac21_dg_control_0_pdef      (8'd0), //
   .dac21_dg_inc_0_pdef          (7'd0),//
   .dac21_dg_enable_0            (), //
   .dac21_dg_inc_0               (), //
   .dac21_dg_type_0              (), //
   .dac21_dg_init_0              (), //
   .dac21_dg_control_0           (), //
   .dac21_dg_pulse_control_0     (), //
   .dac21_dg_i_value_0           (), //
   .dac21_dg_q_value_0           (), //
   .dac21_dg_mult_control_0      (), //
   .dac21_dg_i_value_0_pdef      (16'd0), //
   .dac21_dg_q_value_0_pdef      (16'd0), //
   .dac21_dg_mult_control_0_pdef (3'd0),  //

   .dac22_dg_type_0_pdef         (4'd0), //
   .dac22_dg_control_0_pdef      (8'd0), //
   .dac22_dg_inc_0_pdef          (7'd0),//
   .dac22_dg_enable_0            (), //
   .dac22_dg_inc_0               (), //
   .dac22_dg_type_0              (), //
   .dac22_dg_init_0              (), //
   .dac22_dg_control_0           (), //
   .dac22_dg_pulse_control_0     (), //
   .dac22_dg_i_value_0           (), //
   .dac22_dg_q_value_0           (), //
   .dac22_dg_mult_control_0      (), //
   .dac22_dg_i_value_0_pdef      (16'd0), //
   .dac22_dg_q_value_0_pdef      (16'd0), //
   .dac22_dg_mult_control_0_pdef (3'd0),  //

   .dac23_dg_type_0_pdef         (4'd0), //
   .dac23_dg_control_0_pdef      (8'd0), //
   .dac23_dg_inc_0_pdef          (7'd0),//
   .dac23_dg_enable_0            (), //
   .dac23_dg_inc_0               (), //
   .dac23_dg_type_0              (), //
   .dac23_dg_init_0              (), //
   .dac23_dg_control_0           (), //
   .dac23_dg_pulse_control_0     (), //
   .dac23_dg_i_value_0           (), //
   .dac23_dg_q_value_0           (), //
   .dac23_dg_mult_control_0      (), //
   .dac23_dg_i_value_0_pdef      (16'd0), //
   .dac23_dg_q_value_0_pdef      (16'd0), //
   .dac23_dg_mult_control_0_pdef (3'd0),  //

   .dac30_dg_type_0_pdef         (4'd0), //
   .dac30_dg_control_0_pdef      (8'd0), //
   .dac30_dg_inc_0_pdef          (7'd0),//
   .dac30_dg_enable_0            (), //
   .dac30_dg_inc_0               (), //
   .dac30_dg_type_0              (), //
   .dac30_dg_init_0              (), //
   .dac30_dg_control_0           (), //
   .dac30_dg_pulse_control_0     (), //
   .dac30_dg_i_value_0           (), //
   .dac30_dg_q_value_0           (), //
   .dac30_dg_mult_control_0      (), //
   .dac30_dg_i_value_0_pdef      (16'd0), //
   .dac30_dg_q_value_0_pdef      (16'd0), //
   .dac30_dg_mult_control_0_pdef (3'd0),  //

   .dac31_dg_type_0_pdef         (4'd0), //
   .dac31_dg_control_0_pdef      (8'd0), //
   .dac31_dg_inc_0_pdef          (7'd0),//
   .dac31_dg_enable_0            (), //
   .dac31_dg_inc_0               (), //
   .dac31_dg_type_0              (), //
   .dac31_dg_init_0              (), //
   .dac31_dg_control_0           (), //
   .dac31_dg_pulse_control_0     (), //
   .dac31_dg_i_value_0           (), //
   .dac31_dg_q_value_0           (), //
   .dac31_dg_mult_control_0      (), //
   .dac31_dg_i_value_0_pdef      (16'd0), //
   .dac31_dg_q_value_0_pdef      (16'd0), //
   .dac31_dg_mult_control_0_pdef (3'd0),  //

   .dac32_dg_type_0_pdef         (4'd0), //
   .dac32_dg_control_0_pdef      (8'd0), //
   .dac32_dg_inc_0_pdef          (7'd0),//
   .dac32_dg_enable_0            (), //
   .dac32_dg_inc_0               (), //
   .dac32_dg_type_0              (), //
   .dac32_dg_init_0              (), //
   .dac32_dg_control_0           (), //
   .dac32_dg_pulse_control_0     (), //
   .dac32_dg_i_value_0           (), //
   .dac32_dg_q_value_0           (), //
   .dac32_dg_mult_control_0      (), //
   .dac32_dg_i_value_0_pdef      (16'd0), //
   .dac32_dg_q_value_0_pdef      (16'd0), //
   .dac32_dg_mult_control_0_pdef (3'd0),  //

   .dac33_dg_type_0_pdef         (4'd0), //
   .dac33_dg_control_0_pdef      (8'd0), //
   .dac33_dg_inc_0_pdef          (7'd0),//
   .dac33_dg_enable_0            (), //
   .dac33_dg_inc_0               (), //
   .dac33_dg_type_0              (), //
   .dac33_dg_init_0              (), //
   .dac33_dg_control_0           (), //
   .dac33_dg_pulse_control_0     (), //
   .dac33_dg_i_value_0           (), //
   .dac33_dg_q_value_0           (), //
   .dac33_dg_mult_control_0      (), //
   .dac33_dg_i_value_0_pdef      (16'd0), //
   .dac33_dg_q_value_0_pdef      (16'd0), //
   .dac33_dg_mult_control_0_pdef (3'd0),  //

   .dac_fab_clk0           (m0_axis_clock),
   .dac_fab_resetn0        (axis_resetn_rt[0]), // Negedge reset
   .dac_fab_clk1           (s_axi_aclk     ),
   .dac_fab_resetn1        (axis_resetn_rt[1]), // Negedge reset
   .dac_fab_clk2           (s_axi_aclk     ),
   .dac_fab_resetn2        (axis_resetn_rt[2]), // Negedge reset
   .dac_fab_clk3           (s_axi_aclk     ),
   .dac_fab_resetn3        (axis_resetn_rt[3]), // Negedge reset

   .enable                 (enable          ),
   .timeout_enable         (timeout_enable  ),
   .timeout_value          (timeout_value   ),

   .timeout_enable_in      (timeout_enable  ),
   .timeout_value_in       (timeout_value   ), 

   .s_axi_aclk             (s_axi_aclk      ),
   .s_axi_aresetn          (s_axi_aresetn   ),

   .s_axi_awaddr           (s_axi_awaddr    ),
   .s_axi_awvalid          (s_axi_awvalid   ),
   .s_axi_awready          (s_axi_awready   ),
   .s_axi_wdata            (s_axi_wdata     ),
   .s_axi_wvalid           (s_axi_wvalid    ),
   .s_axi_wready           (s_axi_wready    ),
   .s_axi_bresp            (s_axi_bresp     ),
   .s_axi_bvalid           (s_axi_bvalid    ),
   .s_axi_bready           (s_axi_bready    ),
   .s_axi_araddr           (s_axi_araddr    ),
   .s_axi_arvalid          (s_axi_arvalid   ),
   .s_axi_arready          (s_axi_arready   ),
   .s_axi_rdata            (s_axi_rdata     ),
   .s_axi_rresp            (s_axi_rresp     ),
   .s_axi_rvalid           (s_axi_rvalid    ),
   .s_axi_rready           (s_axi_rready    )

);

`ifdef DACEXDES_ENABLETYPE_SELECTION
  assign m00_dg_init = m00_dg_init_i[255:0];
`endif

endmodule
