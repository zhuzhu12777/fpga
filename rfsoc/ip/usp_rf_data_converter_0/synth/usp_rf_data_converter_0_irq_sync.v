//----------------------------------------------------------------------------
// Title : Interrupt Synchronizers
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
//
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

`timescale 1ns / 1ps
//***********************************Entity Declaration************************
(* DowngradeIPIdentifiedWarnings="yes" *)
module usp_rf_data_converter_0_irq_sync (
  input   [1:0]  dac00_irq,
  output  [1:0]  dac00_irq_sync,
  
  input   [1:0]  dac01_irq,
  output  [1:0]  dac01_irq_sync,
  
  input   [1:0]  dac02_irq,
  output  [1:0]  dac02_irq_sync,
  
  input   [1:0]  dac03_irq,
  output  [1:0]  dac03_irq_sync,
  
  input   [1:0]  dac10_irq,
  output  [1:0]  dac10_irq_sync,
  
  input   [1:0]  dac11_irq,
  output  [1:0]  dac11_irq_sync,
  
  input   [1:0]  dac12_irq,
  output  [1:0]  dac12_irq_sync,
  
  input   [1:0]  dac13_irq,
  output  [1:0]  dac13_irq_sync,
  
  input   [1:0]  dac20_irq,
  output  [1:0]  dac20_irq_sync,
  
  input   [1:0]  dac21_irq,
  output  [1:0]  dac21_irq_sync,
  
  input   [1:0]  dac22_irq,
  output  [1:0]  dac22_irq_sync,
  
  input   [1:0]  dac23_irq,
  output  [1:0]  dac23_irq_sync,
  
  input   [1:0]  dac30_irq,
  output  [1:0]  dac30_irq_sync,
  
  input   [1:0]  dac31_irq,
  output  [1:0]  dac31_irq_sync,
  
  input   [1:0]  dac32_irq,
  output  [1:0]  dac32_irq_sync,
  
  input   [1:0]  dac33_irq,
  output  [1:0]  dac33_irq_sync,
  
  input   [6:0]  adc00_irq,
  output  [6:0]  adc00_irq_sync,

  input   [6:0]  adc01_irq,
  output  [6:0]  adc01_irq_sync,

  input   [6:0]  adc02_irq,
  output  [6:0]  adc02_irq_sync,

  input   [6:0]  adc03_irq,
  output  [6:0]  adc03_irq_sync,

  input   [6:0]  adc10_irq,
  output  [6:0]  adc10_irq_sync,

  input   [6:0]  adc11_irq,
  output  [6:0]  adc11_irq_sync,

  input   [6:0]  adc12_irq,
  output  [6:0]  adc12_irq_sync,

  input   [6:0]  adc13_irq,
  output  [6:0]  adc13_irq_sync,

  input   [6:0]  adc20_irq,
  output  [6:0]  adc20_irq_sync,

  input   [6:0]  adc21_irq,
  output  [6:0]  adc21_irq_sync,

  input   [6:0]  adc22_irq,
  output  [6:0]  adc22_irq_sync,

  input   [6:0]  adc23_irq,
  output  [6:0]  adc23_irq_sync,

  input   [6:0]  adc30_irq,
  output  [6:0]  adc30_irq_sync,

  input   [6:0]  adc31_irq,
  output  [6:0]  adc31_irq_sync,

  input   [6:0]  adc32_irq,
  output  [6:0]  adc32_irq_sync,

  input   [6:0]  adc33_irq,
  output  [6:0]  adc33_irq_sync,

  input    dest_clk
);  
  // DAC IRQ synchronizers
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac00_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac00_irq[0]),
  .dest_out (dac00_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac00_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac00_irq[1]),
  .dest_out (dac00_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac01_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac01_irq[0]),
  .dest_out (dac01_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac01_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac01_irq[1]),
  .dest_out (dac01_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac02_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac02_irq[0]),
  .dest_out (dac02_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac02_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac02_irq[1]),
  .dest_out (dac02_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac03_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac03_irq[0]),
  .dest_out (dac03_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac03_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac03_irq[1]),
  .dest_out (dac03_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac10_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac10_irq[0]),
  .dest_out (dac10_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac10_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac10_irq[1]),
  .dest_out (dac10_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac11_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac11_irq[0]),
  .dest_out (dac11_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac11_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac11_irq[1]),
  .dest_out (dac11_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac12_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac12_irq[0]),
  .dest_out (dac12_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac12_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac12_irq[1]),
  .dest_out (dac12_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac13_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac13_irq[0]),
  .dest_out (dac13_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac13_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac13_irq[1]),
  .dest_out (dac13_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac20_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac20_irq[0]),
  .dest_out (dac20_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac20_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac20_irq[1]),
  .dest_out (dac20_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac21_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac21_irq[0]),
  .dest_out (dac21_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac21_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac21_irq[1]),
  .dest_out (dac21_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac22_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac22_irq[0]),
  .dest_out (dac22_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac22_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac22_irq[1]),
  .dest_out (dac22_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac23_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac23_irq[0]),
  .dest_out (dac23_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac23_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac23_irq[1]),
  .dest_out (dac23_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac30_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac30_irq[0]),
  .dest_out (dac30_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac30_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac30_irq[1]),
  .dest_out (dac30_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac31_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac31_irq[0]),
  .dest_out (dac31_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac31_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac31_irq[1]),
  .dest_out (dac31_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac32_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac32_irq[0]),
  .dest_out (dac32_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac32_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac32_irq[1]),
  .dest_out (dac32_irq_sync[1])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_dac33_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac33_irq[0]),
  .dest_out (dac33_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_dac33_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (dac33_irq[1]),
  .dest_out (dac33_irq_sync[1])
  );

  // ADC IRQ synchronizers
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc00_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc00_irq[0]),
  .dest_out (adc00_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc00_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc00_irq[1]),
  .dest_out (adc00_irq_sync[1])
  );
  assign adc00_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc00_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc00_irq[3]),
  .dest_out (adc00_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc00_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc00_irq[4]),
  .dest_out (adc00_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc00_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc00_irq[5]),
  .dest_out (adc00_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc00_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc00_irq[6]),
  .dest_out (adc00_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc01_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc01_irq[0]),
  .dest_out (adc01_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc01_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc01_irq[1]),
  .dest_out (adc01_irq_sync[1])
  );
  assign adc01_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc01_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc01_irq[3]),
  .dest_out (adc01_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc01_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc01_irq[4]),
  .dest_out (adc01_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc01_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc01_irq[5]),
  .dest_out (adc01_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc01_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc01_irq[6]),
  .dest_out (adc01_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc02_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc02_irq[0]),
  .dest_out (adc02_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc02_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc02_irq[1]),
  .dest_out (adc02_irq_sync[1])
  );
  assign adc02_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc02_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc02_irq[3]),
  .dest_out (adc02_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc02_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc02_irq[4]),
  .dest_out (adc02_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc02_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc02_irq[5]),
  .dest_out (adc02_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc02_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc02_irq[6]),
  .dest_out (adc02_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc03_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc03_irq[0]),
  .dest_out (adc03_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc03_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc03_irq[1]),
  .dest_out (adc03_irq_sync[1])
  );
  assign adc03_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc03_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc03_irq[3]),
  .dest_out (adc03_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc03_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc03_irq[4]),
  .dest_out (adc03_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc03_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc03_irq[5]),
  .dest_out (adc03_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc03_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc03_irq[6]),
  .dest_out (adc03_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc10_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc10_irq[0]),
  .dest_out (adc10_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc10_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc10_irq[1]),
  .dest_out (adc10_irq_sync[1])
  );
  assign adc10_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc10_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc10_irq[3]),
  .dest_out (adc10_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc10_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc10_irq[4]),
  .dest_out (adc10_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc10_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc10_irq[5]),
  .dest_out (adc10_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc10_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc10_irq[6]),
  .dest_out (adc10_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc11_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc11_irq[0]),
  .dest_out (adc11_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc11_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc11_irq[1]),
  .dest_out (adc11_irq_sync[1])
  );
  assign adc11_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc11_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc11_irq[3]),
  .dest_out (adc11_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc11_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc11_irq[4]),
  .dest_out (adc11_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc11_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc11_irq[5]),
  .dest_out (adc11_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc11_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc11_irq[6]),
  .dest_out (adc11_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc12_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc12_irq[0]),
  .dest_out (adc12_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc12_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc12_irq[1]),
  .dest_out (adc12_irq_sync[1])
  );
  assign adc12_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc12_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc12_irq[3]),
  .dest_out (adc12_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc12_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc12_irq[4]),
  .dest_out (adc12_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc12_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc12_irq[5]),
  .dest_out (adc12_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc12_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc12_irq[6]),
  .dest_out (adc12_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc13_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc13_irq[0]),
  .dest_out (adc13_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc13_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc13_irq[1]),
  .dest_out (adc13_irq_sync[1])
  );
  assign adc13_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc13_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc13_irq[3]),
  .dest_out (adc13_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc13_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc13_irq[4]),
  .dest_out (adc13_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc13_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc13_irq[5]),
  .dest_out (adc13_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc13_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc13_irq[6]),
  .dest_out (adc13_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc20_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc20_irq[0]),
  .dest_out (adc20_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc20_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc20_irq[1]),
  .dest_out (adc20_irq_sync[1])
  );
  assign adc20_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc20_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc20_irq[3]),
  .dest_out (adc20_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc20_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc20_irq[4]),
  .dest_out (adc20_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc20_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc20_irq[5]),
  .dest_out (adc20_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc20_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc20_irq[6]),
  .dest_out (adc20_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc21_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc21_irq[0]),
  .dest_out (adc21_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc21_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc21_irq[1]),
  .dest_out (adc21_irq_sync[1])
  );
  assign adc21_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc21_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc21_irq[3]),
  .dest_out (adc21_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc21_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc21_irq[4]),
  .dest_out (adc21_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc21_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc21_irq[5]),
  .dest_out (adc21_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc21_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc21_irq[6]),
  .dest_out (adc21_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc22_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc22_irq[0]),
  .dest_out (adc22_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc22_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc22_irq[1]),
  .dest_out (adc22_irq_sync[1])
  );
  assign adc22_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc22_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc22_irq[3]),
  .dest_out (adc22_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc22_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc22_irq[4]),
  .dest_out (adc22_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc22_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc22_irq[5]),
  .dest_out (adc22_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc22_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc22_irq[6]),
  .dest_out (adc22_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc23_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc23_irq[0]),
  .dest_out (adc23_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc23_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc23_irq[1]),
  .dest_out (adc23_irq_sync[1])
  );
  assign adc23_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc23_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc23_irq[3]),
  .dest_out (adc23_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc23_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc23_irq[4]),
  .dest_out (adc23_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc23_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc23_irq[5]),
  .dest_out (adc23_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc23_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc23_irq[6]),
  .dest_out (adc23_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc30_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc30_irq[0]),
  .dest_out (adc30_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc30_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc30_irq[1]),
  .dest_out (adc30_irq_sync[1])
  );
  assign adc30_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc30_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc30_irq[3]),
  .dest_out (adc30_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc30_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc30_irq[4]),
  .dest_out (adc30_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc30_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc30_irq[5]),
  .dest_out (adc30_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc30_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc30_irq[6]),
  .dest_out (adc30_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc31_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc31_irq[0]),
  .dest_out (adc31_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc31_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc31_irq[1]),
  .dest_out (adc31_irq_sync[1])
  );
  assign adc31_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc31_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc31_irq[3]),
  .dest_out (adc31_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc31_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc31_irq[4]),
  .dest_out (adc31_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc31_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc31_irq[5]),
  .dest_out (adc31_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc31_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc31_irq[6]),
  .dest_out (adc31_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc32_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc32_irq[0]),
  .dest_out (adc32_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc32_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc32_irq[1]),
  .dest_out (adc32_irq_sync[1])
  );
  assign adc32_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc32_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc32_irq[3]),
  .dest_out (adc32_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc32_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc32_irq[4]),
  .dest_out (adc32_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc32_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc32_irq[5]),
  .dest_out (adc32_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc32_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc32_irq[6]),
  .dest_out (adc32_irq_sync[6])
  );
  
  
  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc33_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc33_irq[0]),
  .dest_out (adc33_irq_sync[0])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc33_over_range  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc33_irq[1]),
  .dest_out (adc33_irq_sync[1])
  );
  assign adc33_irq_sync[2] = 1'b0;

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc33_data_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc33_irq[3]),
  .dest_out (adc33_irq_sync[3])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc33_fifo_irq  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc33_irq[4]),
  .dest_out (adc33_irq_sync[4])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5), 
  .SRC_INPUT_REG (0)  
                      
  ) sync_adc33_cm_over_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc33_irq[5]),
  .dest_out (adc33_irq_sync[5])
  );

  xpm_cdc_single #(
  .DEST_SYNC_FF  (5),
  .SRC_INPUT_REG (0)

  ) sync_adc33_cm_under_vol  (
  .dest_clk (dest_clk),
  .src_clk  (1'd0),
  .src_in   (adc33_irq[6]),
  .dest_out (adc33_irq_sync[6])
  );
  
  

endmodule
