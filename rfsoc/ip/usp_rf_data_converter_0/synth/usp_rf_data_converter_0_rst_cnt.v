//----------------------------------------------------------------------------
// Title : Reset Counter Module
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
// File : usp_rf_data_converter_0"_reset_cnt.v
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

module usp_rf_data_converter_0_reset_count
(
  input            clk,
  input            reset,
  input            sm_reset,
  input            axi_read_req,
  output           read_ack,
  output reg [7:0] count
);

  reg     sm_reset_r;
  reg     sm_reset_pulse;

  reg     axi_read_req_r;
  reg     axi_read_req_tog;
  reg     read_ack_tog;
  reg     read_ack_tog_r;

  // Register unexpected reset
  always @(posedge clk)
    if (reset) begin
      sm_reset_r     <= 1'b0;
      sm_reset_pulse <= 1'b0;
    end
    else begin
      sm_reset_r     <= sm_reset;
      sm_reset_pulse <= sm_reset & ~sm_reset_r;
    end

  // Register read request
  always @(posedge clk)
    if (reset)
      axi_read_req_r <= 1'b0;
    else
      axi_read_req_r <= axi_read_req;

  // Flip toggle on rising edge of read request
  always @(posedge clk)
    if (reset)
      axi_read_req_tog <= 1'b0;
    else if (axi_read_req & ~axi_read_req_r)
      axi_read_req_tog <= ~axi_read_req_tog;

  // Ack immediately
  always @(posedge clk)
    if (reset)
      read_ack_tog <= 1'b0;
    else
      read_ack_tog <= axi_read_req_tog;

  // Register ack
  always @(posedge clk)
    if (reset)
      read_ack_tog_r <= 1'b0;
    else
      read_ack_tog_r <= read_ack_tog;

  // Detect rising and falling edge
  assign read_ack = (read_ack_tog_r != read_ack_tog);

  always @(posedge clk)
  begin
    if (reset) begin
      count <= 8'h00;
    end
    else if (read_ack == 1'b1) begin
      // clear on read of register
      count <= 8'h00;
    end
    else begin
      if (sm_reset_pulse == 1'b1 && count != 8'hFF) begin
        count <= count + 1;
      end
    end
  end

endmodule
