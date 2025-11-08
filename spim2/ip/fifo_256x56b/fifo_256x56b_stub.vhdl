-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Sat Oct 18 12:38:02 2025
-- Host        : slfan running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/git_resp/xilinx/spim2/spim2.gen/sources_1/ip/fifo_256x56b/fifo_256x56b_stub.vhdl
-- Design      : fifo_256x56b
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo_256x56b is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 55 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 55 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end fifo_256x56b;

architecture stub of fifo_256x56b is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,srst,din[55:0],wr_en,rd_en,dout[55:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_7,Vivado 2022.2";
begin
end;
