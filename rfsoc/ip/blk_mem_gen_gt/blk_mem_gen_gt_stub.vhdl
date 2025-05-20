-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Wed May  7 22:21:25 2025
-- Host        : slfan running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top blk_mem_gen_gt -prefix
--               blk_mem_gen_gt_ blk_mem_gen_gt_stub.vhdl
-- Design      : blk_mem_gen_gt
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu47dr-ffve1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_gen_gt is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end blk_mem_gen_gt;

architecture stub of blk_mem_gen_gt is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[7:0],dina[31:0],clkb,addrb[7:0],doutb[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_5,Vivado 2022.2";
begin
end;
