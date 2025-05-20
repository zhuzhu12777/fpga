-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Thu May 15 19:56:15 2025
-- Host        : slfan running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top GTY_Raw_6CHN -prefix
--               GTY_Raw_6CHN_ GTY_Raw_6CHN_stub.vhdl
-- Design      : GTY_Raw_6CHN
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu47dr-ffve1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GTY_Raw_6CHN is
  Port ( 
    gtwiz_userclk_tx_reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 191 downto 0 );
    gtwiz_userdata_rx_out : out STD_LOGIC_VECTOR ( 191 downto 0 );
    drpclk_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    gtrefclk0_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    gtyrxn_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    gtyrxp_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rxusrclk_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    txusrclk_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    gtytxn_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    gtytxp_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );

end GTY_Raw_6CHN;

architecture stub of GTY_Raw_6CHN is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "gtwiz_userclk_tx_reset_in[0:0],gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[191:0],gtwiz_userdata_rx_out[191:0],drpclk_in[5:0],gtrefclk0_in[5:0],gtyrxn_in[5:0],gtyrxp_in[5:0],rxusrclk_in[5:0],rxusrclk2_in[5:0],txusrclk_in[5:0],txusrclk2_in[5:0],gtpowergood_out[5:0],gtytxn_out[5:0],gtytxp_out[5:0],rxoutclk_out[5:0],rxpmaresetdone_out[5:0],txoutclk_out[5:0],txpmaresetdone_out[5:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "GTY_Raw_6CHN_gtwizard_top,Vivado 2022.2";
begin
end;
