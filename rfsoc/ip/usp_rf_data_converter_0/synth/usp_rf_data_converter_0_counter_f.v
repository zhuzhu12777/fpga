//-----------------------------------------------------------------------------
// Filename:        usp_rf_data_converter_0_counter_f.v
//
// Description:     Implements a parameterizable N-bit usp_rf_data_converter_0_counter_f
//                      Up/Down Counter
//                      Count Enable
//                      Parallel Load
//                      Synchronous Reset
//                      The structural implementation has incremental cost
//                      of one LUT per bit.
//                      Precedence of operations when simultaneous:
//                        reset, load, count
//
//                  A default inferred-RTL implementation is provided and
//                  is used if the user explicitly specifies C_FAMILY=nofamily
//                  or ommits C_FAMILY (allowing it to default to nofamily).
//                  The default implementation is also used
//                  if needed primitives are not available in FPGAs of the
//                  type given by C_FAMILY.
//
//-----------------------------------------------------------------------------
// Structure:   This section shows the hierarchical structure of axi_lite_ipif.
//
//              --axi_lite_ipif.v
//                    --slave_attachment.v
//                       --address_decoder.v
//                       --pselect_f.v
//                    --counter_f.v
//-----------------------------------------------------------------------------
// Naming Conventions:
//      active low signals:                     "*_n"
//      clock signals:                          "clk", "clk_div#", "clk_#x"
//      reset signals:                          "rst", "rst_n"
//      generics:                               "C_*"
//      user defined types:                     "*_TYPE"
//      state machine next state:               "*_ns"
//      state machine current state:            "*_cs"
//      combinatorial signals:                  "*_com"
//      pipelined or register delay signals:    "*_d#"
//      counter signals:                        "*cnt*"
//      clock enable signals:                   "*_ce"
//      internal version of output port         "*_i"
//      device pins:                            "*_pin"
//      ports:                                  - Names begin with Uppercase
//      processes:                              "*_PROCESS"
//      component instantiations:               "<ENTITY_>I_<#|FUNC>
//-----------------------------------------------------------------------------
//---------------------------------------------------------------------------
// Entity section
//---------------------------------------------------------------------------
`timescale 1 ps/1 ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module usp_rf_data_converter_0_counter_f ( Clk, Rst, Load_In, Count_Enable, Count_Load, Count_Down,
Count_Out, Carry_Out);

parameter C_NUM_BITS  = 9;
parameter C_FAMILY  = "nofamily";
input Clk; 
input Rst; 
input[C_NUM_BITS - 1:0] Load_In; 
input Count_Enable; 
input Count_Load; 
input Count_Down; 
output[C_NUM_BITS - 1:0] Count_Out; 
wire[C_NUM_BITS - 1:0] Count_Out;
output Carry_Out; 
wire Carry_Out;

reg[C_NUM_BITS:0] icount_out; 
wire[C_NUM_BITS:0] icount_out_x; 
wire[C_NUM_BITS:0] load_in_x; 

//-------------------------------------------------------------------
// Begin architecture
//-------------------------------------------------------------------
//-------------------------------------------------------------------
// Generate Inferred code
//-------------------------------------------------------------------
assign load_in_x = {1'b0, Load_In};
// Mask out carry position to retain legacy self-clear on next enable.
//        icount_out_x <= ('0' & icount_out(C_NUM_BITS-1 downto 0)); -- Echeck WA
assign icount_out_x = {1'b0, icount_out[C_NUM_BITS - 1:0]};

//---------------------------------------------------------------
// Process to generate counter with - synchronous reset, load,
// counter enable, count down / up features.
//---------------------------------------------------------------
always @(posedge Clk)
begin : CNTR_PROC
   if (Rst == 1'b1)
   begin
      icount_out <= {C_NUM_BITS-(0)+1{1'b0}} ; 
   end
   else if (Count_Load == 1'b1)
   begin
      icount_out <= load_in_x ; 
   end
   else if (Count_Down == 1'b1 & Count_Enable == 1'b1)
   begin
      icount_out <= icount_out_x - 1 ; 
   end
   else if (Count_Enable == 1'b1)
   begin
      icount_out <= icount_out_x + 1 ; 
   end  
end 
assign Carry_Out = icount_out[C_NUM_BITS] ;
assign Count_Out = icount_out[C_NUM_BITS - 1:0];
endmodule
