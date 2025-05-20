-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Sun May  4 21:49:53 2025
-- Host        : slfan running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top axis_combiner_0 -prefix
--               axis_combiner_0_ axis_combiner_0_stub.vhdl
-- Design      : axis_combiner_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu47dr-ffve1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axis_combiner_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 191 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 191 downto 0 )
  );

end axis_combiner_0;

architecture stub of axis_combiner_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axis_tvalid[5:0],s_axis_tready[5:0],s_axis_tdata[191:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[191:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_combiner_v1_1_25_top,Vivado 2022.2";
begin
end;
