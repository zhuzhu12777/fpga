// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed May  7 22:21:25 2025
// Host        : slfan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_gt -prefix
//               blk_mem_gen_gt_ blk_mem_gen_gt_sim_netlist.v
// Design      : blk_mem_gen_gt
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu47dr-ffve1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_gt,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_gt
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.375111 mW" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_gt.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_gt_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21408)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
