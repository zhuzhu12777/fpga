//----------------------------------------------------------------------------
// Title : ROM for tile configuration
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

`timescale 1ps/1ps

module usp_rf_data_converter_0_device_rom (
    aux_clk,
    data_index,
    data_out,
    addr_out,
    tile_out
  );

    input aux_clk;

    input [10:0] data_index;

    output [15:0] data_out;
    output [10:0] addr_out;
    output [2:0]  tile_out;

    reg [29:0] data;

    // The 30-bit data in the array follows the format below:
    // 29:27 |  26:24  |    23:16    |    15:0
    // Tile  |  Slice  | DRP Address |  DRP Data

    (* rom_style = "distributed" *) reg [29:0] data_array [0:275] = '{
       30'h07230000,  // Clock Network Control 0 (ADC0)
       30'h07240000,  // Clock Network Control 1 (ADC0)
       30'h07222000,  // Clock Distribution Control (ADC0)
       30'h07170046,  // PLL FB Div (ADC0)
       30'h070c00c1,  // PLL Output Divide (ADC0)
       30'h07100010,  // PLL Ref clock divide (ADC0)
       30'h07000080,  // PLL SDM CONFIG0 (ADC0)
       30'h07060111,  // PLL SDM seed (ADC0)
       30'h07070011,  // PLL SDM seed setup (ADC0)
       30'h070e0d07,  // PLL ChargePump setup (ADC0)
       30'h070f2080,  // PLL temprature sensor control (ADC0)
       30'h07123fff,  // PLL ChargePump setup (ADC0)
       30'h07137f84,  // PLL loop filter setup (ADC0)
       30'h07140006,  // PLL loop filter setup (ADC0)
       30'h07155800,  // PLL VCO setup (ADC0)
       30'h07160008,  // PLL VCO setup (ADC0)
       30'h070a7a21,  // PLL Coarse Frequency setup (ADC0)
       30'h070b7008,  // PLL Coarse Frequency setup (ADC0)
       30'h0711002d,  // PLL Voltage Regulator setup (ADC0)
       30'h072c0025,  // CLK_DIV (ADC0)
       30'h07280280,  // SYSREF Distribution (ADC0)
       30'h072dfffc,  // HSCOM_PWR_MASK (ADC0)
       30'h07310062,  // CLOCK_DETECT_CTRL0 (ADC0)
       30'h07320032,  // CLOCK_DETECT_CTRL1 (ADC0)
       30'h07300000,  // FIFO_START (ADC0)
       30'h00020808,  // ADC00 Data Width
       30'h00100003,  // ADC00 Decimation Config
       30'h00110001,  // ADC00 Decimation Mode
       30'h00200000,  // ADC00 Mixer Config 0
       30'h00210924,  // ADC00 Mixer Config 1
       30'h003a0020,  // ADC00 Switch Matrix Config
       30'h007101f1,  // ADC00 RX MC Config 0
       30'h00780002,  // ADC00 DSA Control
       30'h005181c3,  // ADC00 TI_DCB_CTRL0
       30'h0055d44a,  // ADC00 TI_TIME_SKEW_CTRL0
       30'h005a0001,  // ADC00 TI_TIME_SKEW_CTRL5
       30'h001d001c,  // ADC00 CAL_FREEZE_MASK
       30'h00060008,  // ADC00 FABRIC_DEBUG
       30'h01020808,  // ADC01 Data Width
       30'h01100003,  // ADC01 Decimation Config
       30'h01110001,  // ADC01 Decimation Mode
       30'h01200000,  // ADC01 Mixer Config 0
       30'h01210924,  // ADC01 Mixer Config 1
       30'h013a0024,  // ADC01 Switch Matrix Config
       30'h017101f9,  // ADC01 RX MC Config 0
       30'h01780002,  // ADC01 DSA Control
       30'h015181c7,  // ADC01 TI_DCB_CTRL0
       30'h0155d44a,  // ADC01 TI_TIME_SKEW_CTRL0
       30'h015a0001,  // ADC01 TI_TIME_SKEW_CTRL5
       30'h011d001c,  // ADC01 CAL_FREEZE_MASK
       30'h01060008,  // ADC01 FABRIC_DEBUG
       30'h02020808,  // ADC02 Data Width
       30'h02100003,  // ADC02 Decimation Config
       30'h02110001,  // ADC02 Decimation Mode
       30'h02200000,  // ADC02 Mixer Config 0
       30'h02210924,  // ADC02 Mixer Config 1
       30'h023a0028,  // ADC02 Switch Matrix Config
       30'h027101f1,  // ADC02 RX MC Config 0
       30'h02780002,  // ADC02 DSA Control
       30'h025181c3,  // ADC02 TI_DCB_CTRL0
       30'h0255d44a,  // ADC02 TI_TIME_SKEW_CTRL0
       30'h025a0001,  // ADC02 TI_TIME_SKEW_CTRL5
       30'h021d001c,  // ADC02 CAL_FREEZE_MASK
       30'h02060008,  // ADC02 FABRIC_DEBUG
       30'h03020808,  // ADC03 Data Width
       30'h03100003,  // ADC03 Decimation Config
       30'h03110001,  // ADC03 Decimation Mode
       30'h03200000,  // ADC03 Mixer Config 0
       30'h03210924,  // ADC03 Mixer Config 1
       30'h033a002c,  // ADC03 Switch Matrix Config
       30'h037101f9,  // ADC03 RX MC Config 0
       30'h03780002,  // ADC03 DSA Control
       30'h035181c7,  // ADC03 TI_DCB_CTRL0
       30'h0355d44a,  // ADC03 TI_TIME_SKEW_CTRL0
       30'h035a0001,  // ADC03 TI_TIME_SKEW_CTRL5
       30'h031d001c,  // ADC03 CAL_FREEZE_MASK
       30'h03060008,  // ADC03 FABRIC_DEBUG
       30'h0f230000,  // Clock Network Control 0 (ADC1)
       30'h0f240000,  // Clock Network Control 1 (ADC1)
       30'h0f222000,  // Clock Distribution Control (ADC1)
       30'h0f170046,  // PLL FB Div (ADC1)
       30'h0f0c00c1,  // PLL Output Divide (ADC1)
       30'h0f100010,  // PLL Ref clock divide (ADC1)
       30'h0f000080,  // PLL SDM CONFIG0 (ADC1)
       30'h0f060111,  // PLL SDM seed (ADC1)
       30'h0f070011,  // PLL SDM seed setup (ADC1)
       30'h0f0e0d07,  // PLL ChargePump setup (ADC1)
       30'h0f0f2080,  // PLL temprature sensor control (ADC1)
       30'h0f123fff,  // PLL ChargePump setup (ADC1)
       30'h0f137f84,  // PLL loop filter setup (ADC1)
       30'h0f140006,  // PLL loop filter setup (ADC1)
       30'h0f155800,  // PLL VCO setup (ADC1)
       30'h0f160008,  // PLL VCO setup (ADC1)
       30'h0f0a7a21,  // PLL Coarse Frequency setup (ADC1)
       30'h0f0b7008,  // PLL Coarse Frequency setup (ADC1)
       30'h0f11002d,  // PLL Voltage Regulator setup (ADC1)
       30'h0f2c0025,  // CLK_DIV (ADC1)
       30'h0f280600,  // SYSREF Distribution (ADC1)
       30'h0f2dfffc,  // HSCOM_PWR_MASK (ADC1)
       30'h0f310062,  // CLOCK_DETECT_CTRL0 (ADC1)
       30'h0f320032,  // CLOCK_DETECT_CTRL1 (ADC1)
       30'h0f300000,  // FIFO_START (ADC1)
       30'h08020808,  // ADC10 Data Width
       30'h08100003,  // ADC10 Decimation Config
       30'h08110001,  // ADC10 Decimation Mode
       30'h08200000,  // ADC10 Mixer Config 0
       30'h08210924,  // ADC10 Mixer Config 1
       30'h083a0020,  // ADC10 Switch Matrix Config
       30'h087101f1,  // ADC10 RX MC Config 0
       30'h08780002,  // ADC10 DSA Control
       30'h085181c3,  // ADC10 TI_DCB_CTRL0
       30'h0855d44a,  // ADC10 TI_TIME_SKEW_CTRL0
       30'h085a0001,  // ADC10 TI_TIME_SKEW_CTRL5
       30'h081d001c,  // ADC10 CAL_FREEZE_MASK
       30'h08060008,  // ADC10 FABRIC_DEBUG
       30'h09020808,  // ADC11 Data Width
       30'h09100003,  // ADC11 Decimation Config
       30'h09110001,  // ADC11 Decimation Mode
       30'h09200000,  // ADC11 Mixer Config 0
       30'h09210924,  // ADC11 Mixer Config 1
       30'h093a0024,  // ADC11 Switch Matrix Config
       30'h097101f9,  // ADC11 RX MC Config 0
       30'h09780002,  // ADC11 DSA Control
       30'h095181c7,  // ADC11 TI_DCB_CTRL0
       30'h0955d44a,  // ADC11 TI_TIME_SKEW_CTRL0
       30'h095a0001,  // ADC11 TI_TIME_SKEW_CTRL5
       30'h091d001c,  // ADC11 CAL_FREEZE_MASK
       30'h09060008,  // ADC11 FABRIC_DEBUG
       30'h0a020808,  // ADC12 Data Width
       30'h0a100003,  // ADC12 Decimation Config
       30'h0a110001,  // ADC12 Decimation Mode
       30'h0a200000,  // ADC12 Mixer Config 0
       30'h0a210924,  // ADC12 Mixer Config 1
       30'h0a3a0028,  // ADC12 Switch Matrix Config
       30'h0a7101f1,  // ADC12 RX MC Config 0
       30'h0a780002,  // ADC12 DSA Control
       30'h0a5181c3,  // ADC12 TI_DCB_CTRL0
       30'h0a55d44a,  // ADC12 TI_TIME_SKEW_CTRL0
       30'h0a5a0001,  // ADC12 TI_TIME_SKEW_CTRL5
       30'h0a1d001c,  // ADC12 CAL_FREEZE_MASK
       30'h0a060008,  // ADC12 FABRIC_DEBUG
       30'h0b020808,  // ADC13 Data Width
       30'h0b100003,  // ADC13 Decimation Config
       30'h0b110001,  // ADC13 Decimation Mode
       30'h0b200000,  // ADC13 Mixer Config 0
       30'h0b210924,  // ADC13 Mixer Config 1
       30'h0b3a002c,  // ADC13 Switch Matrix Config
       30'h0b7101f9,  // ADC13 RX MC Config 0
       30'h0b780002,  // ADC13 DSA Control
       30'h0b5181c7,  // ADC13 TI_DCB_CTRL0
       30'h0b55d44a,  // ADC13 TI_TIME_SKEW_CTRL0
       30'h0b5a0001,  // ADC13 TI_TIME_SKEW_CTRL5
       30'h0b1d001c,  // ADC13 CAL_FREEZE_MASK
       30'h0b060008,  // ADC13 FABRIC_DEBUG
       30'h17230000,  // Clock Network Control 0 (ADC2)
       30'h17240000,  // Clock Network Control 1 (ADC2)
       30'h17222000,  // Clock Distribution Control (ADC2)
       30'h17170046,  // PLL FB Div (ADC2)
       30'h170c00c1,  // PLL Output Divide (ADC2)
       30'h17100010,  // PLL Ref clock divide (ADC2)
       30'h17000080,  // PLL SDM CONFIG0 (ADC2)
       30'h17060111,  // PLL SDM seed (ADC2)
       30'h17070011,  // PLL SDM seed setup (ADC2)
       30'h170e0d07,  // PLL ChargePump setup (ADC2)
       30'h170f2080,  // PLL temprature sensor control (ADC2)
       30'h17123fff,  // PLL ChargePump setup (ADC2)
       30'h17137f84,  // PLL loop filter setup (ADC2)
       30'h17140006,  // PLL loop filter setup (ADC2)
       30'h17155800,  // PLL VCO setup (ADC2)
       30'h17160008,  // PLL VCO setup (ADC2)
       30'h170a7a21,  // PLL Coarse Frequency setup (ADC2)
       30'h170b7008,  // PLL Coarse Frequency setup (ADC2)
       30'h1711002d,  // PLL Voltage Regulator setup (ADC2)
       30'h172c0025,  // CLK_DIV (ADC2)
       30'h17288880,  // SYSREF Distribution (ADC2)
       30'h172dfffc,  // HSCOM_PWR_MASK (ADC2)
       30'h17310062,  // CLOCK_DETECT_CTRL0 (ADC2)
       30'h17320032,  // CLOCK_DETECT_CTRL1 (ADC2)
       30'h17300000,  // FIFO_START (ADC2)
       30'h10020808,  // ADC20 Data Width
       30'h10100003,  // ADC20 Decimation Config
       30'h10110001,  // ADC20 Decimation Mode
       30'h10200000,  // ADC20 Mixer Config 0
       30'h10210924,  // ADC20 Mixer Config 1
       30'h103a0020,  // ADC20 Switch Matrix Config
       30'h107101f1,  // ADC20 RX MC Config 0
       30'h10780002,  // ADC20 DSA Control
       30'h105181c3,  // ADC20 TI_DCB_CTRL0
       30'h1055d44a,  // ADC20 TI_TIME_SKEW_CTRL0
       30'h105a0001,  // ADC20 TI_TIME_SKEW_CTRL5
       30'h101d001c,  // ADC20 CAL_FREEZE_MASK
       30'h10060008,  // ADC20 FABRIC_DEBUG
       30'h11020808,  // ADC21 Data Width
       30'h11100003,  // ADC21 Decimation Config
       30'h11110001,  // ADC21 Decimation Mode
       30'h11200000,  // ADC21 Mixer Config 0
       30'h11210924,  // ADC21 Mixer Config 1
       30'h113a0024,  // ADC21 Switch Matrix Config
       30'h117101f9,  // ADC21 RX MC Config 0
       30'h11780002,  // ADC21 DSA Control
       30'h115181c7,  // ADC21 TI_DCB_CTRL0
       30'h1155d44a,  // ADC21 TI_TIME_SKEW_CTRL0
       30'h115a0001,  // ADC21 TI_TIME_SKEW_CTRL5
       30'h111d001c,  // ADC21 CAL_FREEZE_MASK
       30'h11060008,  // ADC21 FABRIC_DEBUG
       30'h12020808,  // ADC22 Data Width
       30'h12100003,  // ADC22 Decimation Config
       30'h12110001,  // ADC22 Decimation Mode
       30'h12200000,  // ADC22 Mixer Config 0
       30'h12210924,  // ADC22 Mixer Config 1
       30'h123a0028,  // ADC22 Switch Matrix Config
       30'h127101f1,  // ADC22 RX MC Config 0
       30'h12780002,  // ADC22 DSA Control
       30'h125181c3,  // ADC22 TI_DCB_CTRL0
       30'h1255d44a,  // ADC22 TI_TIME_SKEW_CTRL0
       30'h125a0001,  // ADC22 TI_TIME_SKEW_CTRL5
       30'h121d001c,  // ADC22 CAL_FREEZE_MASK
       30'h12060008,  // ADC22 FABRIC_DEBUG
       30'h13020808,  // ADC23 Data Width
       30'h13100003,  // ADC23 Decimation Config
       30'h13110001,  // ADC23 Decimation Mode
       30'h13200000,  // ADC23 Mixer Config 0
       30'h13210924,  // ADC23 Mixer Config 1
       30'h133a002c,  // ADC23 Switch Matrix Config
       30'h137101f9,  // ADC23 RX MC Config 0
       30'h13780002,  // ADC23 DSA Control
       30'h135181c7,  // ADC23 TI_DCB_CTRL0
       30'h1355d44a,  // ADC23 TI_TIME_SKEW_CTRL0
       30'h135a0001,  // ADC23 TI_TIME_SKEW_CTRL5
       30'h131d001c,  // ADC23 CAL_FREEZE_MASK
       30'h13060008,  // ADC23 FABRIC_DEBUG
       30'h1f280700,  // SYSREF Distribution (ADC3)
       30'h27230000,  // Clock Network Control 0 (DAC0)
       30'h27240000,  // Clock Network Control 1 (DAC0)
       30'h27222000,  // Clock Distribution Control (DAC0)
       30'h2717003e,  // PLL FB Div (DAC0)
       30'h270c0400,  // PLL Output Divide (DAC0)
       30'h27100010,  // PLL Ref clock divide (DAC0)
       30'h27000080,  // PLL SDM CONFIG0 (DAC0)
       30'h27060111,  // PLL SDM seed (DAC0)
       30'h27070011,  // PLL SDM seed setup (DAC0)
       30'h270e0d07,  // PLL ChargePump setup (DAC0)
       30'h270f2080,  // PLL temprature sensor control (DAC0)
       30'h27123fff,  // PLL ChargePump setup (DAC0)
       30'h27137f84,  // PLL loop filter setup (DAC0)
       30'h27140006,  // PLL loop filter setup (DAC0)
       30'h27155f03,  // PLL VCO setup (DAC0)
       30'h27160008,  // PLL VCO setup (DAC0)
       30'h270a7a21,  // PLL Coarse Frequency setup (DAC0)
       30'h270b7008,  // PLL Coarse Frequency setup (DAC0)
       30'h2711002d,  // PLL Voltage Regulator setup (DAC0)
       30'h272c0022,  // CLK_DIV (DAC0)
       30'h2728ca80,  // SYSREF Distribution (DAC0)
       30'h272dfffc,  // HSCOM_PWR_MASK (DAC0)
       30'h273103e6,  // CLOCK_DETECT_CTRL0 (DAC0)
       30'h273204e1,  // CLOCK_DETECT_CTRL1 (DAC0)
       30'h20021010,  // DAC00 Data Width
       30'h20100001,  // DAC00 Interpolation Control
       30'h20110000,  // DAC00 Interpolation Data
       30'h20200000,  // DAC00 Mixer Config 0
       30'h20210924,  // DAC00 Mixer Config 1
       30'h20300000,  // DAC00 Inv Sinc Filter
       30'h20310040,  // DAC00 Multiband Config
       30'h20600009,  // DAC00 Decoder Control
       30'h20610001,  // DAC00 Decoder Clock Enable
       30'h2071a000,  // DAC00 MC_CONFIG0
       30'h2073aa53,  // DAC00 MC_CONFIG2
       30'h20746a45,  // DAC00 MC_CONFIG3
       30'h20660001,  // DAC00 VOP_CTRL
       30'h200d0003,  // DAC00 DATAPATH
       30'h20040000,  // DAC00 FIFO_START
       30'h20070010,  // DAC00 FABRIC_DEBUG
       30'h2f282400,  // SYSREF Distribution (DAC1)
       30'h37280980,  // SYSREF Distribution (DAC2)
       30'h3f280100,  // SYSREF Distribution (DAC3)
       30'h00000000};

    //-------------------------------------------------------------------------
    // Output the tile number, address and data for the DRP writes
    // depending on the data_index input
    //-------------------------------------------------------------------------
    always @(posedge aux_clk)
    begin
      data <= data_array[data_index];
    end

    assign data_out = data[15:0];
    assign addr_out = data[26:16];
    assign tile_out = data[29:27];

endmodule
