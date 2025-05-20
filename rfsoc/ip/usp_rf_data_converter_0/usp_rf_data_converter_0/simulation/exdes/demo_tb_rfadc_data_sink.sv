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

import demo_tb_rfdac_utils_pkg::*;

(* DowngradeIPIdentifiedWarnings="yes" *)
module demo_tb_rfadc_data_sink #(
  parameter  p_connections       = 8,
  parameter  p_connection_width  = 16
) (

   // AXI-Lite Interface
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR"  *) input  wire [17:0]  s_axi_awaddr   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input  wire         s_axi_awvalid  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output wire         s_axi_awready  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA"   *) input  wire [31:0]  s_axi_wdata    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID"  *) input  wire         s_axi_wvalid   , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY"  *) output wire         s_axi_wready   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB"   *) input  wire  [3:0]  s_axi_wstrb    , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP"   *) output wire  [1:0]  s_axi_bresp    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID"  *) output wire         s_axi_bvalid   , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY"  *) input  wire         s_axi_bready   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR"  *) input  wire [17:0]  s_axi_araddr   , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input  wire         s_axi_arvalid  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output wire         s_axi_arready  , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA"   *) output wire [31:0]  s_axi_rdata    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP"   *) output wire  [1:0]  s_axi_rresp    , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID"  *) output wire         s_axi_rvalid   , // 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY"  *) input  wire         s_axi_rready   ,  // 

   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00 TDATA" *)       input  wire [(p_connections*16)-1:0]  s00_tdata , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00 TVALID" *)      input  wire         s00_tvalid, //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00 TREADY" *)      output wire         s00_tready, //

   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s02 TDATA" *)       input  wire [(p_connections*16)-1:0]  s02_tdata , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s02 TVALID" *)      input  wire         s02_tvalid, //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s02 TREADY" *)      output wire         s02_tready, //

   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s10 TDATA" *)       input  wire [(p_connections*16)-1:0]  s10_tdata , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s10 TVALID" *)      input  wire         s10_tvalid, //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s10 TREADY" *)      output wire         s10_tready, //

   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s12 TDATA" *)       input  wire [(p_connections*16)-1:0]  s12_tdata , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s12 TVALID" *)      input  wire         s12_tvalid, //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s12 TREADY" *)      output wire         s12_tready, //

   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s20 TDATA" *)       input  wire [(p_connections*16)-1:0]  s20_tdata , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s20 TVALID" *)      input  wire         s20_tvalid, //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s20 TREADY" *)      output wire         s20_tready, //

   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s22 TDATA" *)       input  wire [(p_connections*16)-1:0]  s22_tdata , //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s22 TVALID" *)      input  wire         s22_tvalid, //
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s22 TREADY" *)      output wire         s22_tready, //

   (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s0_axis_clock CLK" *)
   (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s00:s02" *)
                                                                               input  wire         s0_axis_clock, //
   (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s1_axis_clock CLK" *)
   (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s10:s12" *)
                                                                               input  wire         s1_axis_clock, //
   (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s2_axis_clock CLK" *)
   (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s20:s22" *)
                                                                               input  wire         s2_axis_clock, //

   // Checker status for ADC path
   output reg            error_flag=0,
   output reg            done_flag=0,

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
localparam  p_useable_width     = 16;
localparam  p_useable_offset    = 0;
localparam  p_data_inc_val_init = 1;
localparam  p_change_width      = 12;
localparam  p_data_type_width   = 4;
localparam  p_increment_w       = 12;

// ----------------------------------------------------------------------------
// Variable declarations
// ----------------------------------------------------------------------------
wire        enable;
wire        timeout_enable;
wire [11:0] timeout_value;
reg  [1:0]  done_delay = 2'd3;
wire [15:0] done_axi_reg;
wire [15:0] error_axi_reg;

wire [5:0] error_bus;
wire [5:0] error_bus_rt;
wire [5:0] done_bus;
wire [5:0] done_bus_rt;
wire [3:0] axis_resetn_rt;
wire                                    [7:0] s00_ds_enable        ; //
wire                      [p_increment_w-1:0] s00_ds_inc           ; //
wire                  [p_data_type_width-1:0] s00_ds_type          ; //
wire                     [p_change_width-1:0] s00_ds_change_count  ; //
wire                                    [1:0] s00_ds_control       ; //
wire                                    [7:0] s00_ds_ctrl          ;
wire                                   [31:0] s00_ds_fft_exec_cnt  ;
wire                                   [31:0] s00_ds_fft_max_level ;
wire                                    [7:0] s00_ds_status        ;
wire                                   [31:0] s00_ds_tone          ;
wire                                    [7:0] s02_ds_enable        ; //
wire                      [p_increment_w-1:0] s02_ds_inc           ; //
wire                  [p_data_type_width-1:0] s02_ds_type          ; //
wire                     [p_change_width-1:0] s02_ds_change_count  ; //
wire                                    [1:0] s02_ds_control       ; //
wire                                    [7:0] s02_ds_ctrl          ;
wire                                   [31:0] s02_ds_fft_exec_cnt  ;
wire                                   [31:0] s02_ds_fft_max_level ;
wire                                    [7:0] s02_ds_status        ;
wire                                   [31:0] s02_ds_tone          ;
wire                                    [7:0] s10_ds_enable        ; //
wire                      [p_increment_w-1:0] s10_ds_inc           ; //
wire                  [p_data_type_width-1:0] s10_ds_type          ; //
wire                     [p_change_width-1:0] s10_ds_change_count  ; //
wire                                    [1:0] s10_ds_control       ; //
wire                                    [7:0] s10_ds_ctrl          ;
wire                                   [31:0] s10_ds_fft_exec_cnt  ;
wire                                   [31:0] s10_ds_fft_max_level ;
wire                                    [7:0] s10_ds_status        ;
wire                                   [31:0] s10_ds_tone          ;
wire                                    [7:0] s12_ds_enable        ; //
wire                      [p_increment_w-1:0] s12_ds_inc           ; //
wire                  [p_data_type_width-1:0] s12_ds_type          ; //
wire                     [p_change_width-1:0] s12_ds_change_count  ; //
wire                                    [1:0] s12_ds_control       ; //
wire                                    [7:0] s12_ds_ctrl          ;
wire                                   [31:0] s12_ds_fft_exec_cnt  ;
wire                                   [31:0] s12_ds_fft_max_level ;
wire                                    [7:0] s12_ds_status        ;
wire                                   [31:0] s12_ds_tone          ;
wire                                    [7:0] s20_ds_enable        ; //
wire                      [p_increment_w-1:0] s20_ds_inc           ; //
wire                  [p_data_type_width-1:0] s20_ds_type          ; //
wire                     [p_change_width-1:0] s20_ds_change_count  ; //
wire                                    [1:0] s20_ds_control       ; //
wire                                    [7:0] s20_ds_ctrl          ;
wire                                   [31:0] s20_ds_fft_exec_cnt  ;
wire                                   [31:0] s20_ds_fft_max_level ;
wire                                    [7:0] s20_ds_status        ;
wire                                   [31:0] s20_ds_tone          ;
wire                                    [7:0] s22_ds_enable        ; //
wire                      [p_increment_w-1:0] s22_ds_inc           ; //
wire                  [p_data_type_width-1:0] s22_ds_type          ; //
wire                     [p_change_width-1:0] s22_ds_change_count  ; //
wire                                    [1:0] s22_ds_control       ; //
wire                                    [7:0] s22_ds_ctrl          ;
wire                                   [31:0] s22_ds_fft_exec_cnt  ;
wire                                   [31:0] s22_ds_fft_max_level ;
wire                                    [7:0] s22_ds_status        ;
wire                                   [31:0] s22_ds_tone          ;

// ----------------------------------------------------------------------------
// Setup Tile Configuration Structs for tile 0
// ----------------------------------------------------------------------------

tile_cfg_t tile_cfg_0;

assign tile_cfg_0.adc_dac_n = 1'b1;                                      // ADC Tile Configuration
assign tile_cfg_0.multiband = 3'd0;   // Multiband setting


wire [31:0] tone_freq_00;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_00  = 32'd1464000;
assign tile_cfg_0.slice_cfg_setups[0].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_0.slice_cfg_setups[0].enable       = s00_ds_enable[0]; 
assign tile_cfg_0.slice_cfg_setups[0].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_0.slice_cfg_setups[0].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_0.slice_cfg_setups[0].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_0.slice_cfg_setups[0].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_0.slice_cfg_setups[0].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_0.slice_cfg_setups[0].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_0.slice_cfg_setups[0].neg_quad     = 1'b0;         // 
assign tile_cfg_0.slice_cfg_setups[0].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_0.slice_cfg_setups[0].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_0.slice_cfg_setups[0].tone_freq    = s00_ds_tone;        // freq  of tone generated by generator
assign tile_cfg_0.slice_cfg_setups[0].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_01;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_01  = 32'd1464000;
assign tile_cfg_0.slice_cfg_setups[1].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_0.slice_cfg_setups[1].enable       = 1'b0; 
assign tile_cfg_0.slice_cfg_setups[1].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_0.slice_cfg_setups[1].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_0.slice_cfg_setups[1].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_0.slice_cfg_setups[1].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_0.slice_cfg_setups[1].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_0.slice_cfg_setups[1].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_0.slice_cfg_setups[1].neg_quad     = 1'b0;         // 
assign tile_cfg_0.slice_cfg_setups[1].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_0.slice_cfg_setups[1].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_0.slice_cfg_setups[1].tone_freq    = 32'd0;
assign tile_cfg_0.slice_cfg_setups[1].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_02;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_02  = 32'd5856000;
assign tile_cfg_0.slice_cfg_setups[2].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_0.slice_cfg_setups[2].enable       = s02_ds_enable[0]; 
assign tile_cfg_0.slice_cfg_setups[2].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_0.slice_cfg_setups[2].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_0.slice_cfg_setups[2].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_0.slice_cfg_setups[2].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_0.slice_cfg_setups[2].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_0.slice_cfg_setups[2].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_0.slice_cfg_setups[2].neg_quad     = 1'b0;         // 
assign tile_cfg_0.slice_cfg_setups[2].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_0.slice_cfg_setups[2].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_0.slice_cfg_setups[2].tone_freq    = s02_ds_tone;        // freq  of tone generated by generator
assign tile_cfg_0.slice_cfg_setups[2].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_03;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_03  = 32'd1464000;
assign tile_cfg_0.slice_cfg_setups[3].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_0.slice_cfg_setups[3].enable       = 1'b0; 
assign tile_cfg_0.slice_cfg_setups[3].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_0.slice_cfg_setups[3].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_0.slice_cfg_setups[3].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_0.slice_cfg_setups[3].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_0.slice_cfg_setups[3].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_0.slice_cfg_setups[3].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_0.slice_cfg_setups[3].neg_quad     = 1'b0;         // 
assign tile_cfg_0.slice_cfg_setups[3].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_0.slice_cfg_setups[3].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_0.slice_cfg_setups[3].tone_freq    = 32'd0;
assign tile_cfg_0.slice_cfg_setups[3].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

// ----------------------------------------------------------------------------
// Setup Tile Configuration Structs for tile 1
// ----------------------------------------------------------------------------

tile_cfg_t tile_cfg_1;

assign tile_cfg_1.adc_dac_n = 1'b1;                                      // ADC Tile Configuration
assign tile_cfg_1.multiband = 3'd0;   // Multiband setting


wire [31:0] tone_freq_10;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_10  = 32'd1464000;
assign tile_cfg_1.slice_cfg_setups[0].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_1.slice_cfg_setups[0].enable       = s10_ds_enable[0]; 
assign tile_cfg_1.slice_cfg_setups[0].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_1.slice_cfg_setups[0].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_1.slice_cfg_setups[0].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_1.slice_cfg_setups[0].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_1.slice_cfg_setups[0].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_1.slice_cfg_setups[0].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_1.slice_cfg_setups[0].neg_quad     = 1'b0;         // 
assign tile_cfg_1.slice_cfg_setups[0].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_1.slice_cfg_setups[0].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_1.slice_cfg_setups[0].tone_freq    = s10_ds_tone;        // freq  of tone generated by generator
assign tile_cfg_1.slice_cfg_setups[0].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_11;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_11  = 32'd1464000;
assign tile_cfg_1.slice_cfg_setups[1].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_1.slice_cfg_setups[1].enable       = 1'b0; 
assign tile_cfg_1.slice_cfg_setups[1].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_1.slice_cfg_setups[1].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_1.slice_cfg_setups[1].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_1.slice_cfg_setups[1].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_1.slice_cfg_setups[1].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_1.slice_cfg_setups[1].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_1.slice_cfg_setups[1].neg_quad     = 1'b0;         // 
assign tile_cfg_1.slice_cfg_setups[1].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_1.slice_cfg_setups[1].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_1.slice_cfg_setups[1].tone_freq    = 32'd0;
assign tile_cfg_1.slice_cfg_setups[1].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_12;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_12  = 32'd5856000;
assign tile_cfg_1.slice_cfg_setups[2].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_1.slice_cfg_setups[2].enable       = s12_ds_enable[0]; 
assign tile_cfg_1.slice_cfg_setups[2].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_1.slice_cfg_setups[2].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_1.slice_cfg_setups[2].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_1.slice_cfg_setups[2].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_1.slice_cfg_setups[2].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_1.slice_cfg_setups[2].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_1.slice_cfg_setups[2].neg_quad     = 1'b0;         // 
assign tile_cfg_1.slice_cfg_setups[2].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_1.slice_cfg_setups[2].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_1.slice_cfg_setups[2].tone_freq    = s12_ds_tone;        // freq  of tone generated by generator
assign tile_cfg_1.slice_cfg_setups[2].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_13;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_13  = 32'd1464000;
assign tile_cfg_1.slice_cfg_setups[3].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_1.slice_cfg_setups[3].enable       = 1'b0; 
assign tile_cfg_1.slice_cfg_setups[3].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_1.slice_cfg_setups[3].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_1.slice_cfg_setups[3].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_1.slice_cfg_setups[3].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_1.slice_cfg_setups[3].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_1.slice_cfg_setups[3].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_1.slice_cfg_setups[3].neg_quad     = 1'b0;         // 
assign tile_cfg_1.slice_cfg_setups[3].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_1.slice_cfg_setups[3].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_1.slice_cfg_setups[3].tone_freq    = 32'd0;
assign tile_cfg_1.slice_cfg_setups[3].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

// ----------------------------------------------------------------------------
// Setup Tile Configuration Structs for tile 2
// ----------------------------------------------------------------------------

tile_cfg_t tile_cfg_2;

assign tile_cfg_2.adc_dac_n = 1'b1;                                      // ADC Tile Configuration
assign tile_cfg_2.multiband = 3'd0;   // Multiband setting


wire [31:0] tone_freq_20;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_20  = 32'd1464000;
assign tile_cfg_2.slice_cfg_setups[0].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_2.slice_cfg_setups[0].enable       = s20_ds_enable[0]; 
assign tile_cfg_2.slice_cfg_setups[0].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_2.slice_cfg_setups[0].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_2.slice_cfg_setups[0].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_2.slice_cfg_setups[0].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_2.slice_cfg_setups[0].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_2.slice_cfg_setups[0].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_2.slice_cfg_setups[0].neg_quad     = 1'b0;         // 
assign tile_cfg_2.slice_cfg_setups[0].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_2.slice_cfg_setups[0].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_2.slice_cfg_setups[0].tone_freq    = s20_ds_tone;        // freq  of tone generated by generator
assign tile_cfg_2.slice_cfg_setups[0].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_21;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_21  = 32'd1464000;
assign tile_cfg_2.slice_cfg_setups[1].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_2.slice_cfg_setups[1].enable       = 1'b0; 
assign tile_cfg_2.slice_cfg_setups[1].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_2.slice_cfg_setups[1].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_2.slice_cfg_setups[1].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_2.slice_cfg_setups[1].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_2.slice_cfg_setups[1].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_2.slice_cfg_setups[1].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_2.slice_cfg_setups[1].neg_quad     = 1'b0;         // 
assign tile_cfg_2.slice_cfg_setups[1].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_2.slice_cfg_setups[1].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_2.slice_cfg_setups[1].tone_freq    = 32'd0;
assign tile_cfg_2.slice_cfg_setups[1].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_22;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_22  = 32'd5856000;
assign tile_cfg_2.slice_cfg_setups[2].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_2.slice_cfg_setups[2].enable       = s22_ds_enable[0]; 
assign tile_cfg_2.slice_cfg_setups[2].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_2.slice_cfg_setups[2].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_2.slice_cfg_setups[2].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_2.slice_cfg_setups[2].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_2.slice_cfg_setups[2].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_2.slice_cfg_setups[2].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_2.slice_cfg_setups[2].neg_quad     = 1'b0;         // 
assign tile_cfg_2.slice_cfg_setups[2].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_2.slice_cfg_setups[2].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_2.slice_cfg_setups[2].tone_freq    = s22_ds_tone;        // freq  of tone generated by generator
assign tile_cfg_2.slice_cfg_setups[2].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_23;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 187.500
   // adc dg clock freq (Hz)  = 187500000
   // Slice settings
   // Data Width = 8
   // Decimation = 1
   // Mixer Mode = 2
   // Mixer Type = 1
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1464
assign tone_freq_23  = 32'd1464000;
assign tile_cfg_2.slice_cfg_setups[3].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_2.slice_cfg_setups[3].enable       = 1'b0; 
assign tile_cfg_2.slice_cfg_setups[3].decim        = 16'd1;        // decimation (for adc), or interpolation for dac
assign tile_cfg_2.slice_cfg_setups[3].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_2.slice_cfg_setups[3].mixer_type   = 2'd1;         // bypassed/coarse/fine
assign tile_cfg_2.slice_cfg_setups[3].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_2.slice_cfg_setups[3].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_2.slice_cfg_setups[3].fs           = 34'd1500000000;        // sample freq
assign tile_cfg_2.slice_cfg_setups[3].neg_quad     = 1'b0;         // 
assign tile_cfg_2.slice_cfg_setups[3].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_2.slice_cfg_setups[3].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_2.slice_cfg_setups[3].tone_freq    = 32'd0;
assign tile_cfg_2.slice_cfg_setups[3].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

// ----------------------------------------------------------------------------
// Setup Tile Configuration Structs for tile 3
// ----------------------------------------------------------------------------

tile_cfg_t tile_cfg_3;

assign tile_cfg_3.adc_dac_n = 1'b1;                                      // ADC Tile Configuration
assign tile_cfg_3.multiband = 3'd0;   // Multiband setting


wire [31:0] tone_freq_30;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 0.0
   // adc dg clock freq (Hz)  = 0
   // Slice settings
   // Data Width = 8
   // Decimation = 0
   // Mixer Mode = 2
   // Mixer Type = 3
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1953
assign tone_freq_30  = 32'd1953000;
assign tile_cfg_3.slice_cfg_setups[0].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_3.slice_cfg_setups[0].enable       = 1'b0; 
assign tile_cfg_3.slice_cfg_setups[0].decim        = 16'd0;        // decimation (for adc), or interpolation for dac
assign tile_cfg_3.slice_cfg_setups[0].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_3.slice_cfg_setups[0].mixer_type   = 2'd3;         // bypassed/coarse/fine
assign tile_cfg_3.slice_cfg_setups[0].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_3.slice_cfg_setups[0].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_3.slice_cfg_setups[0].fs           = 34'd2000000000;        // sample freq
assign tile_cfg_3.slice_cfg_setups[0].neg_quad     = 1'b0;         // 
assign tile_cfg_3.slice_cfg_setups[0].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_3.slice_cfg_setups[0].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_3.slice_cfg_setups[0].tone_freq    = 32'd0;
assign tile_cfg_3.slice_cfg_setups[0].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_31;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 0.0
   // adc dg clock freq (Hz)  = 0
   // Slice settings
   // Data Width = 8
   // Decimation = 0
   // Mixer Mode = 2
   // Mixer Type = 3
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1953
assign tone_freq_31  = 32'd1953000;
assign tile_cfg_3.slice_cfg_setups[1].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_3.slice_cfg_setups[1].enable       = 1'b0; 
assign tile_cfg_3.slice_cfg_setups[1].decim        = 16'd0;        // decimation (for adc), or interpolation for dac
assign tile_cfg_3.slice_cfg_setups[1].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_3.slice_cfg_setups[1].mixer_type   = 2'd3;         // bypassed/coarse/fine
assign tile_cfg_3.slice_cfg_setups[1].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_3.slice_cfg_setups[1].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_3.slice_cfg_setups[1].fs           = 34'd2000000000;        // sample freq
assign tile_cfg_3.slice_cfg_setups[1].neg_quad     = 1'b0;         // 
assign tile_cfg_3.slice_cfg_setups[1].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_3.slice_cfg_setups[1].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_3.slice_cfg_setups[1].tone_freq    = 32'd0;
assign tile_cfg_3.slice_cfg_setups[1].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_32;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 0.0
   // adc dg clock freq (Hz)  = 0
   // Slice settings
   // Data Width = 8
   // Decimation = 0
   // Mixer Mode = 2
   // Mixer Type = 3
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1953
assign tone_freq_32  = 32'd1953000;
assign tile_cfg_3.slice_cfg_setups[2].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_3.slice_cfg_setups[2].enable       = 1'b0; 
assign tile_cfg_3.slice_cfg_setups[2].decim        = 16'd0;        // decimation (for adc), or interpolation for dac
assign tile_cfg_3.slice_cfg_setups[2].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_3.slice_cfg_setups[2].mixer_type   = 2'd3;         // bypassed/coarse/fine
assign tile_cfg_3.slice_cfg_setups[2].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_3.slice_cfg_setups[2].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_3.slice_cfg_setups[2].fs           = 34'd2000000000;        // sample freq
assign tile_cfg_3.slice_cfg_setups[2].neg_quad     = 1'b0;         // 
assign tile_cfg_3.slice_cfg_setups[2].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_3.slice_cfg_setups[2].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_3.slice_cfg_setups[2].tone_freq    = 32'd0;
assign tile_cfg_3.slice_cfg_setups[2].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

wire [31:0] tone_freq_33;

   // ADC Tone generator frequency calculation
   // Tile settings
   // adc dg clock freq (MHz) = 0.0
   // adc dg clock freq (Hz)  = 0
   // Slice settings
   // Data Width = 8
   // Decimation = 0
   // Mixer Mode = 2
   // Mixer Type = 3
   // NCO Frequency = 0.0
   // 1024 elements per LUT so divide by 1024 as LUT contains one sine wave cycle


// real tone (MHz) = 1953
assign tone_freq_33  = 32'd1953000;
assign tile_cfg_3.slice_cfg_setups[3].adc_dac_n    = 1'b1;         // ADC Slice Configuration
assign tile_cfg_3.slice_cfg_setups[3].enable       = 1'b0; 
assign tile_cfg_3.slice_cfg_setups[3].decim        = 16'd0;        // decimation (for adc), or interpolation for dac
assign tile_cfg_3.slice_cfg_setups[3].mixer        = 2'd2;         // mixer_mode is (r2c=0 / c2c=1 / r2r=2)
assign tile_cfg_3.slice_cfg_setups[3].mixer_type   = 2'd3;         // bypassed/coarse/fine
assign tile_cfg_3.slice_cfg_setups[3].mixer_freq   = 33'd0; // mixer freq
assign tile_cfg_3.slice_cfg_setups[3].mixer_phase  = 9'd180; // mixer phase
assign tile_cfg_3.slice_cfg_setups[3].fs           = 34'd2000000000;        // sample freq
assign tile_cfg_3.slice_cfg_setups[3].neg_quad     = 1'b0;         // 
assign tile_cfg_3.slice_cfg_setups[3].nyquist_zone = 1'b0;         // 0 = zone_1, 1 = zone_2
assign tile_cfg_3.slice_cfg_setups[3].is_4g        = 1'b1;         // 4g part used
assign tile_cfg_3.slice_cfg_setups[3].tone_freq    = 32'd0;
assign tile_cfg_3.slice_cfg_setups[3].tone_level   = 16'b0;        // level of tone generated by generator (for future use)

// ----------------------------------------------------------------------------
// Data generator tile 0
// ----------------------------------------------------------------------------

ds_slice #(

   .p_cons             (p_connections      ),
   .p_con_w            (p_connection_width ),
   .p_useable_w        (p_useable_width    ),
   .p_increment_w      (p_increment_w      ),
   .p_data_type_w      (p_data_type_width  ),
   .p_change_w         (p_change_width     ),
   .p_slice_number     ( 0 )

) ds_slice_00 (

   .tile_cfg            (tile_cfg_0),
   .clk                 (s0_axis_clock),
   .ds_enable           (s00_ds_enable[p_connections-1:0]),
   
   .ds_inc              (s00_ds_inc           ),
   .ds_type             (s00_ds_type          ),
   .ds_in               (s00_tdata            ),
   .ds_change_count     (s00_ds_change_count  ),
   .ds_ctrl             (s00_ds_ctrl          ),
   .ds_fft_exec_cnt     (s00_ds_fft_exec_cnt  ),
   .ds_fft_max_level    (s00_ds_fft_max_level ),
   .ds_status           (s00_ds_status        ),
   .ds_done             (done_bus[0]          ),
   .ds_error            (error_bus[0]         )
);

assign s00_tready = s00_ds_enable;

// ----------------------------------------------------------------------------
// Data generator tile 0
// ----------------------------------------------------------------------------

ds_slice #(

   .p_cons             (p_connections      ),
   .p_con_w            (p_connection_width ),
   .p_useable_w        (p_useable_width    ),
   .p_increment_w      (p_increment_w      ),
   .p_data_type_w      (p_data_type_width  ),
   .p_change_w         (p_change_width     ),
   .p_slice_number     ( 2 )

) ds_slice_02 (

   .tile_cfg            (tile_cfg_0),
   .clk                 (s0_axis_clock),
   .ds_enable           (s02_ds_enable[p_connections-1:0]),
   
   .ds_inc              (s02_ds_inc           ),
   .ds_type             (s02_ds_type          ),
   .ds_in               (s02_tdata            ),
   .ds_change_count     (s02_ds_change_count  ),
   .ds_ctrl             (s02_ds_ctrl          ),
   .ds_fft_exec_cnt     (s02_ds_fft_exec_cnt  ),
   .ds_fft_max_level    (s02_ds_fft_max_level ),
   .ds_status           (s02_ds_status        ),
   .ds_done             (done_bus[1]          ),
   .ds_error            (error_bus[1]         )
);

assign s02_tready = s02_ds_enable;

// ----------------------------------------------------------------------------
// Data generator tile 1
// ----------------------------------------------------------------------------

ds_slice #(

   .p_cons             (p_connections      ),
   .p_con_w            (p_connection_width ),
   .p_useable_w        (p_useable_width    ),
   .p_increment_w      (p_increment_w      ),
   .p_data_type_w      (p_data_type_width  ),
   .p_change_w         (p_change_width     ),
   .p_slice_number     ( 0 )

) ds_slice_10 (

   .tile_cfg            (tile_cfg_1),
   .clk                 (s1_axis_clock),
   .ds_enable           (s10_ds_enable[p_connections-1:0]),
   
   .ds_inc              (s10_ds_inc           ),
   .ds_type             (s10_ds_type          ),
   .ds_in               (s10_tdata            ),
   .ds_change_count     (s10_ds_change_count  ),
   .ds_ctrl             (s10_ds_ctrl          ),
   .ds_fft_exec_cnt     (s10_ds_fft_exec_cnt  ),
   .ds_fft_max_level    (s10_ds_fft_max_level ),
   .ds_status           (s10_ds_status        ),
   .ds_done             (done_bus[2]          ),
   .ds_error            (error_bus[2]         )
);

assign s10_tready = s10_ds_enable;

// ----------------------------------------------------------------------------
// Data generator tile 1
// ----------------------------------------------------------------------------

ds_slice #(

   .p_cons             (p_connections      ),
   .p_con_w            (p_connection_width ),
   .p_useable_w        (p_useable_width    ),
   .p_increment_w      (p_increment_w      ),
   .p_data_type_w      (p_data_type_width  ),
   .p_change_w         (p_change_width     ),
   .p_slice_number     ( 2 )

) ds_slice_12 (

   .tile_cfg            (tile_cfg_1),
   .clk                 (s1_axis_clock),
   .ds_enable           (s12_ds_enable[p_connections-1:0]),
   
   .ds_inc              (s12_ds_inc           ),
   .ds_type             (s12_ds_type          ),
   .ds_in               (s12_tdata            ),
   .ds_change_count     (s12_ds_change_count  ),
   .ds_ctrl             (s12_ds_ctrl          ),
   .ds_fft_exec_cnt     (s12_ds_fft_exec_cnt  ),
   .ds_fft_max_level    (s12_ds_fft_max_level ),
   .ds_status           (s12_ds_status        ),
   .ds_done             (done_bus[3]          ),
   .ds_error            (error_bus[3]         )
);

assign s12_tready = s12_ds_enable;

// ----------------------------------------------------------------------------
// Data generator tile 2
// ----------------------------------------------------------------------------

ds_slice #(

   .p_cons             (p_connections      ),
   .p_con_w            (p_connection_width ),
   .p_useable_w        (p_useable_width    ),
   .p_increment_w      (p_increment_w      ),
   .p_data_type_w      (p_data_type_width  ),
   .p_change_w         (p_change_width     ),
   .p_slice_number     ( 0 )

) ds_slice_20 (

   .tile_cfg            (tile_cfg_2),
   .clk                 (s2_axis_clock),
   .ds_enable           (s20_ds_enable[p_connections-1:0]),
   
   .ds_inc              (s20_ds_inc           ),
   .ds_type             (s20_ds_type          ),
   .ds_in               (s20_tdata            ),
   .ds_change_count     (s20_ds_change_count  ),
   .ds_ctrl             (s20_ds_ctrl          ),
   .ds_fft_exec_cnt     (s20_ds_fft_exec_cnt  ),
   .ds_fft_max_level    (s20_ds_fft_max_level ),
   .ds_status           (s20_ds_status        ),
   .ds_done             (done_bus[4]          ),
   .ds_error            (error_bus[4]         )
);

assign s20_tready = s20_ds_enable;

// ----------------------------------------------------------------------------
// Data generator tile 2
// ----------------------------------------------------------------------------

ds_slice #(

   .p_cons             (p_connections      ),
   .p_con_w            (p_connection_width ),
   .p_useable_w        (p_useable_width    ),
   .p_increment_w      (p_increment_w      ),
   .p_data_type_w      (p_data_type_width  ),
   .p_change_w         (p_change_width     ),
   .p_slice_number     ( 2 )

) ds_slice_22 (

   .tile_cfg            (tile_cfg_2),
   .clk                 (s2_axis_clock),
   .ds_enable           (s22_ds_enable[p_connections-1:0]),
   
   .ds_inc              (s22_ds_inc           ),
   .ds_type             (s22_ds_type          ),
   .ds_in               (s22_tdata            ),
   .ds_change_count     (s22_ds_change_count  ),
   .ds_ctrl             (s22_ds_ctrl          ),
   .ds_fft_exec_cnt     (s22_ds_fft_exec_cnt  ),
   .ds_fft_max_level    (s22_ds_fft_max_level ),
   .ds_status           (s22_ds_status        ),
   .ds_done             (done_bus[5]          ),
   .ds_error            (error_bus[5]         )
);

assign s22_tready = s22_ds_enable;

//-----------------------------------------------------------------------------
// Retime the error flags onto the AXI clock
//-----------------------------------------------------------------------------
assign error_bus_rt[0] = error_bus[0];
assign error_bus_rt[1] = error_bus[1];
assign error_bus_rt[2] = error_bus[2];
assign error_bus_rt[3] = error_bus[3];
assign error_bus_rt[4] = error_bus[4];
assign error_bus_rt[5] = error_bus[5];

always @(posedge s_axi_aclk)
   error_flag <= |error_bus_rt;

//-----------------------------------------------------------------------------
// Retime the done flags onto the AXI clock. Make output posedge sticky
//-----------------------------------------------------------------------------
assign done_bus_rt[0] = done_bus[0];
assign done_bus_rt[1] = done_bus[1];
assign done_bus_rt[2] = done_bus[2];
assign done_bus_rt[3] = done_bus[3];
assign done_bus_rt[4] = done_bus[4];
assign done_bus_rt[5] = done_bus[5];

always @(posedge s_axi_aclk) begin
   done_delay <= {done_delay[0],&done_bus_rt};
   if (~enable)
      done_flag <= 1'd0; 
   else 
      if (~done_delay[1] & done_delay[0])
         done_flag <= 1'd1; 
end

//-----------------------------------------------------------------------------
// Retime the AXIS resets for each tile
//-----------------------------------------------------------------------------
assign axis_resetn_rt[0] = s_axi_aresetn;
assign axis_resetn_rt[1] = s_axi_aresetn;
assign axis_resetn_rt[2] = s_axi_aresetn;
assign axis_resetn_rt[3] = s_axi_aresetn;

//-----------------------------------------------------------------------------
// Create a Tile/Slice ordered bus for the AXI interface
//-----------------------------------------------------------------------------
assign done_axi_reg [ 0] = done_bus_rt [0];
assign error_axi_reg[ 0] = error_bus_rt[0];
assign done_axi_reg [ 1] = 1'd1;
assign error_axi_reg[ 1] = 1'd0;
assign done_axi_reg [ 2] = done_bus_rt [1];
assign error_axi_reg[ 2] = error_bus_rt[1];
assign done_axi_reg [ 3] = 1'd1;
assign error_axi_reg[ 3] = 1'd0;
assign done_axi_reg [ 4] = done_bus_rt [2];
assign error_axi_reg[ 4] = error_bus_rt[2];
assign done_axi_reg [ 5] = 1'd1;
assign error_axi_reg[ 5] = 1'd0;
assign done_axi_reg [ 6] = done_bus_rt [3];
assign error_axi_reg[ 6] = error_bus_rt[3];
assign done_axi_reg [ 7] = 1'd1;
assign error_axi_reg[ 7] = 1'd0;
assign done_axi_reg [ 8] = done_bus_rt [4];
assign error_axi_reg[ 8] = error_bus_rt[4];
assign done_axi_reg [ 9] = 1'd1;
assign error_axi_reg[ 9] = 1'd0;
assign done_axi_reg [10] = done_bus_rt [5];
assign error_axi_reg[10] = error_bus_rt[5];
assign done_axi_reg [11] = 1'd1;
assign error_axi_reg[11] = 1'd0;
assign done_axi_reg [12] = 1'd1;
assign error_axi_reg[12] = 1'd0;
assign done_axi_reg [13] = 1'd1;
assign error_axi_reg[13] = 1'd0;
assign done_axi_reg [14] = 1'd1;
assign error_axi_reg[14] = 1'd0;
assign done_axi_reg [15] = 1'd1;
assign error_axi_reg[15] = 1'd0;

//-----------------------------------------------------------------------------
// Control register map. Reusing the same bank as generated for the DAC
// data path control, hence the naming on the block below
//-----------------------------------------------------------------------------
rfadc_sink_demo_tb_ctrl rfadc_demo_tb_ctrl_i (
   .adc00_ds_enable_0         (s00_ds_enable      ), //
   .adc00_ds_inc_0            (s00_ds_inc         ), //
   .adc00_ds_type_0           (s00_ds_type        ), //
   .adc00_ds_control_0        (s00_ds_control     ), //
   .adc00_ds_change_count_0   (s00_ds_change_count), //
   
   .adc00_ds_ctrl_0           (s00_ds_ctrl           ),
   .adc00_ds_fft_exec_cnt_0   (s00_ds_fft_exec_cnt   ),
   .adc00_ds_fft_max_level_0  (s00_ds_fft_max_level  ),
   .adc00_ds_status_0         (s00_ds_status         ),
   .adc00_ds_tone_default_0   (tone_freq_00          ),
   .adc00_ds_tone_0           (s00_ds_tone           ),

   .adc01_ds_enable_0         (), //
   .adc01_ds_inc_0            (), //
   .adc01_ds_type_0           (), //
   .adc01_ds_control_0        (), //
   .adc01_ds_change_count_0   (), //
   .adc01_ds_ctrl_0           (),
   .adc01_ds_fft_exec_cnt_0   (32'd0),
   .adc01_ds_fft_max_level_0  (32'd0),
   .adc01_ds_status_0         (8'd0 ),
   .adc01_ds_tone_default_0   (32'd0),
   .adc01_ds_tone_0           (),

   .adc02_ds_enable_0         (s02_ds_enable      ), //
   .adc02_ds_inc_0            (s02_ds_inc         ), //
   .adc02_ds_type_0           (s02_ds_type        ), //
   .adc02_ds_control_0        (s02_ds_control     ), //
   .adc02_ds_change_count_0   (s02_ds_change_count), //
   
   .adc02_ds_ctrl_0           (s02_ds_ctrl           ),
   .adc02_ds_fft_exec_cnt_0   (s02_ds_fft_exec_cnt   ),
   .adc02_ds_fft_max_level_0  (s02_ds_fft_max_level  ),
   .adc02_ds_status_0         (s02_ds_status         ),
   .adc02_ds_tone_default_0   (tone_freq_02          ),
   .adc02_ds_tone_0           (s02_ds_tone           ),

   .adc03_ds_enable_0         (), //
   .adc03_ds_inc_0            (), //
   .adc03_ds_type_0           (), //
   .adc03_ds_control_0        (), //
   .adc03_ds_change_count_0   (), //
   .adc03_ds_ctrl_0           (),
   .adc03_ds_fft_exec_cnt_0   (32'd0),
   .adc03_ds_fft_max_level_0  (32'd0),
   .adc03_ds_status_0         (8'd0 ),
   .adc03_ds_tone_default_0   (32'd0),
   .adc03_ds_tone_0           (),

   .adc10_ds_enable_0         (s10_ds_enable      ), //
   .adc10_ds_inc_0            (s10_ds_inc         ), //
   .adc10_ds_type_0           (s10_ds_type        ), //
   .adc10_ds_control_0        (s10_ds_control     ), //
   .adc10_ds_change_count_0   (s10_ds_change_count), //
   
   .adc10_ds_ctrl_0           (s10_ds_ctrl           ),
   .adc10_ds_fft_exec_cnt_0   (s10_ds_fft_exec_cnt   ),
   .adc10_ds_fft_max_level_0  (s10_ds_fft_max_level  ),
   .adc10_ds_status_0         (s10_ds_status         ),
   .adc10_ds_tone_default_0   (tone_freq_10          ),
   .adc10_ds_tone_0           (s10_ds_tone           ),

   .adc11_ds_enable_0         (), //
   .adc11_ds_inc_0            (), //
   .adc11_ds_type_0           (), //
   .adc11_ds_control_0        (), //
   .adc11_ds_change_count_0   (), //
   .adc11_ds_ctrl_0           (),
   .adc11_ds_fft_exec_cnt_0   (32'd0),
   .adc11_ds_fft_max_level_0  (32'd0),
   .adc11_ds_status_0         (8'd0 ),
   .adc11_ds_tone_default_0   (32'd0),
   .adc11_ds_tone_0           (),

   .adc12_ds_enable_0         (s12_ds_enable      ), //
   .adc12_ds_inc_0            (s12_ds_inc         ), //
   .adc12_ds_type_0           (s12_ds_type        ), //
   .adc12_ds_control_0        (s12_ds_control     ), //
   .adc12_ds_change_count_0   (s12_ds_change_count), //
   
   .adc12_ds_ctrl_0           (s12_ds_ctrl           ),
   .adc12_ds_fft_exec_cnt_0   (s12_ds_fft_exec_cnt   ),
   .adc12_ds_fft_max_level_0  (s12_ds_fft_max_level  ),
   .adc12_ds_status_0         (s12_ds_status         ),
   .adc12_ds_tone_default_0   (tone_freq_12          ),
   .adc12_ds_tone_0           (s12_ds_tone           ),

   .adc13_ds_enable_0         (), //
   .adc13_ds_inc_0            (), //
   .adc13_ds_type_0           (), //
   .adc13_ds_control_0        (), //
   .adc13_ds_change_count_0   (), //
   .adc13_ds_ctrl_0           (),
   .adc13_ds_fft_exec_cnt_0   (32'd0),
   .adc13_ds_fft_max_level_0  (32'd0),
   .adc13_ds_status_0         (8'd0 ),
   .adc13_ds_tone_default_0   (32'd0),
   .adc13_ds_tone_0           (),

   .adc20_ds_enable_0         (s20_ds_enable      ), //
   .adc20_ds_inc_0            (s20_ds_inc         ), //
   .adc20_ds_type_0           (s20_ds_type        ), //
   .adc20_ds_control_0        (s20_ds_control     ), //
   .adc20_ds_change_count_0   (s20_ds_change_count), //
   
   .adc20_ds_ctrl_0           (s20_ds_ctrl           ),
   .adc20_ds_fft_exec_cnt_0   (s20_ds_fft_exec_cnt   ),
   .adc20_ds_fft_max_level_0  (s20_ds_fft_max_level  ),
   .adc20_ds_status_0         (s20_ds_status         ),
   .adc20_ds_tone_default_0   (tone_freq_20          ),
   .adc20_ds_tone_0           (s20_ds_tone           ),

   .adc21_ds_enable_0         (), //
   .adc21_ds_inc_0            (), //
   .adc21_ds_type_0           (), //
   .adc21_ds_control_0        (), //
   .adc21_ds_change_count_0   (), //
   .adc21_ds_ctrl_0           (),
   .adc21_ds_fft_exec_cnt_0   (32'd0),
   .adc21_ds_fft_max_level_0  (32'd0),
   .adc21_ds_status_0         (8'd0 ),
   .adc21_ds_tone_default_0   (32'd0),
   .adc21_ds_tone_0           (),

   .adc22_ds_enable_0         (s22_ds_enable      ), //
   .adc22_ds_inc_0            (s22_ds_inc         ), //
   .adc22_ds_type_0           (s22_ds_type        ), //
   .adc22_ds_control_0        (s22_ds_control     ), //
   .adc22_ds_change_count_0   (s22_ds_change_count), //
   
   .adc22_ds_ctrl_0           (s22_ds_ctrl           ),
   .adc22_ds_fft_exec_cnt_0   (s22_ds_fft_exec_cnt   ),
   .adc22_ds_fft_max_level_0  (s22_ds_fft_max_level  ),
   .adc22_ds_status_0         (s22_ds_status         ),
   .adc22_ds_tone_default_0   (tone_freq_22          ),
   .adc22_ds_tone_0           (s22_ds_tone           ),

   .adc23_ds_enable_0         (), //
   .adc23_ds_inc_0            (), //
   .adc23_ds_type_0           (), //
   .adc23_ds_control_0        (), //
   .adc23_ds_change_count_0   (), //
   .adc23_ds_ctrl_0           (),
   .adc23_ds_fft_exec_cnt_0   (32'd0),
   .adc23_ds_fft_max_level_0  (32'd0),
   .adc23_ds_status_0         (8'd0 ),
   .adc23_ds_tone_default_0   (32'd0),
   .adc23_ds_tone_0           (),

   .adc30_ds_enable_0         (), //
   .adc30_ds_inc_0            (), //
   .adc30_ds_type_0           (), //
   .adc30_ds_control_0        (), //
   .adc30_ds_change_count_0   (), //
   .adc30_ds_ctrl_0           (),
   .adc30_ds_fft_exec_cnt_0   (32'd0),
   .adc30_ds_fft_max_level_0  (32'd0),
   .adc30_ds_status_0         (8'd0 ),
   .adc30_ds_tone_default_0   (32'd0),
   .adc30_ds_tone_0           (),

   .adc31_ds_enable_0         (), //
   .adc31_ds_inc_0            (), //
   .adc31_ds_type_0           (), //
   .adc31_ds_control_0        (), //
   .adc31_ds_change_count_0   (), //
   .adc31_ds_ctrl_0           (),
   .adc31_ds_fft_exec_cnt_0   (32'd0),
   .adc31_ds_fft_max_level_0  (32'd0),
   .adc31_ds_status_0         (8'd0 ),
   .adc31_ds_tone_default_0   (32'd0),
   .adc31_ds_tone_0           (),

   .adc32_ds_enable_0         (), //
   .adc32_ds_inc_0            (), //
   .adc32_ds_type_0           (), //
   .adc32_ds_control_0        (), //
   .adc32_ds_change_count_0   (), //
   .adc32_ds_ctrl_0           (),
   .adc32_ds_fft_exec_cnt_0   (32'd0),
   .adc32_ds_fft_max_level_0  (32'd0),
   .adc32_ds_status_0         (8'd0 ),
   .adc32_ds_tone_default_0   (32'd0),
   .adc32_ds_tone_0           (),

   .adc33_ds_enable_0         (), //
   .adc33_ds_inc_0            (), //
   .adc33_ds_type_0           (), //
   .adc33_ds_control_0        (), //
   .adc33_ds_change_count_0   (), //
   .adc33_ds_ctrl_0           (),
   .adc33_ds_fft_exec_cnt_0   (32'd0),
   .adc33_ds_fft_max_level_0  (32'd0),
   .adc33_ds_status_0         (8'd0 ),
   .adc33_ds_tone_default_0   (32'd0),
   .adc33_ds_tone_0           (),


   .adc_fab_clk0           (s0_axis_clock),
   .adc_fab_resetn0        (axis_resetn_rt[0] ), // Negedge reset
   .adc_fab_clk1           (s1_axis_clock),
   .adc_fab_resetn1        (axis_resetn_rt[1] ), // Negedge reset
   .adc_fab_clk2           (s2_axis_clock),
   .adc_fab_resetn2        (axis_resetn_rt[2] ), // Negedge reset
   .adc_fab_clk3           (s_axi_aclk     ),
   .adc_fab_resetn3        (axis_resetn_rt[3] ), // Negedge reset

   .enable                 (enable          ),
   .timeout_enable         (timeout_enable  ),
   .timeout_value          (timeout_value   ),
   .error                  (error_flag      ),

   .timeout_enable_in      (timeout_enable  ),
   .timeout_value_in       (timeout_value   ), 

   .done_axi_reg           (done_axi_reg    ), 
   .error_axi_reg          (error_axi_reg   ),

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

endmodule
