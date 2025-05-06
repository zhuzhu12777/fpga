`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// axilite registers to sram to gt path

module gt_data_path(
    input                           ps_clk, ps_rstb,         // registers clock
    input                           gt_clk, gt_rstb,         // gt clock

    input               [7:0]       ram_addr,
    input              [31:0]       ram_data,
    input                           ram_we,
    // input               [2:0]       ram_idx,
    input               [7:0]       gt_cap,

    input                           gt_start,
    input                           gt_reset,

    // gt stream output
    output             [31:0]       gt_tdata_0,
    output                          gt_tvalid_0,
    input                           gt_tready_0,

    output             [31:0]       gt_tdata_1,
    output                          gt_tvalid_1,
    input                           gt_tready_1,

    output             [31:0]       gt_tdata_2,
    output                          gt_tvalid_2,
    input                           gt_tready_2,

    output             [31:0]       gt_tdata_3,
    output                          gt_tvalid_3,
    input                           gt_tready_3,

    output             [31:0]       gt_tdata_4,
    output                          gt_tvalid_4,
    input                           gt_tready_4,

    output             [31:0]       gt_tdata_5,
    output                          gt_tvalid_5,
    input                           gt_tready_5
);

wire [5:0] gt_ram_we;

assign gt_ram_we[0] = ram_we && (ram_addr == 8'h00);
assign gt_ram_we[1] = ram_we && (ram_addr == 8'h01);
assign gt_ram_we[2] = ram_we && (ram_addr == 8'h02);
assign gt_ram_we[3] = ram_we && (ram_addr == 8'h03);
assign gt_ram_we[4] = ram_we && (ram_addr == 8'h04);
assign gt_ram_we[5] = ram_we && (ram_addr == 8'h05);

gt_signle_path u_gt_signle_path_0 (
    .ps_clk     (ps_clk    ),
    .ps_rstb    (ps_rstb   ),
    .gt_clk     (gt_clk    ),
    .gt_rstb    (gt_rstb   ),
    .ram_addr   (ram_addr  ),
    .ram_data   (ram_data  ),
    .ram_we     (gt_ram_we[0]    ),
    .gt_cap     (gt_cap    ),
    .gt_start   (gt_start  ),
    .gt_reset   (gt_reset  ),
    .gt_tdata   (gt_tdata_0),
    .gt_tvalid  (gt_tvalid_0),
    .gt_tready  (gt_tready_0)
);

gt_signle_path u_gt_signle_path_1 (
    .ps_clk     (ps_clk    ),
    .ps_rstb    (ps_rstb   ),
    .gt_clk     (gt_clk    ),
    .gt_rstb    (gt_rstb   ),
    .ram_addr   (ram_addr  ),
    .ram_data   (ram_data  ),
    .ram_we     (gt_ram_we[1]    ),
    .gt_cap     (gt_cap    ),
    .gt_start   (gt_start  ),
    .gt_reset   (gt_reset  ),
    .gt_tdata   (gt_tdata_1),
    .gt_tvalid  (gt_tvalid_1),
    .gt_tready  (gt_tready_1)
);

gt_signle_path u_gt_signle_path_2 (
    .ps_clk     (ps_clk    ),
    .ps_rstb    (ps_rstb   ),
    .gt_clk     (gt_clk    ),
    .gt_rstb    (gt_rstb   ),
    .ram_addr   (ram_addr  ),
    .ram_data   (ram_data  ),
    .ram_we     (gt_ram_we[2]    ),
    .gt_cap     (gt_cap    ),
    .gt_start   (gt_start  ),
    .gt_reset   (gt_reset  ),
    .gt_tdata   (gt_tdata_2),
    .gt_tvalid  (gt_tvalid_2),
    .gt_tready  (gt_tready_2)
);

gt_signle_path u_gt_signle_path_3 (
    .ps_clk     (ps_clk    ),
    .ps_rstb    (ps_rstb   ),
    .gt_clk     (gt_clk    ),
    .gt_rstb    (gt_rstb   ),
    .ram_addr   (ram_addr  ),
    .ram_data   (ram_data  ),
    .ram_we     (gt_ram_we[3]    ),
    .gt_cap     (gt_cap    ),
    .gt_start   (gt_start  ),
    .gt_reset   (gt_reset  ),
    .gt_tdata   (gt_tdata_3),
    .gt_tvalid  (gt_tvalid_3),
    .gt_tready  (gt_tready_3)
);

gt_signle_path u_gt_signle_path_4 (
    .ps_clk     (ps_clk    ),
    .ps_rstb    (ps_rstb   ),
    .gt_clk     (gt_clk    ),
    .gt_rstb    (gt_rstb   ),
    .ram_addr   (ram_addr  ),
    .ram_data   (ram_data  ),
    .ram_we     (gt_ram_we[4]    ),
    .gt_cap     (gt_cap    ),
    .gt_start   (gt_start  ),
    .gt_reset   (gt_reset  ),
    .gt_tdata   (gt_tdata_4),
    .gt_tvalid  (gt_tvalid_4),
    .gt_tready  (gt_tready_4)
);

gt_signle_path u_gt_signle_path_5 (
    .ps_clk     (ps_clk    ),
    .ps_rstb    (ps_rstb   ),
    .gt_clk     (gt_clk    ),
    .gt_rstb    (gt_rstb   ),
    .ram_addr   (ram_addr  ),
    .ram_data   (ram_data  ),
    .ram_we     (gt_ram_we[5]    ),
    .gt_cap     (gt_cap    ),
    .gt_start   (gt_start  ),
    .gt_reset   (gt_reset  ),
    .gt_tdata   (gt_tdata_5),
    .gt_tvalid  (gt_tvalid_5),
    .gt_tready  (gt_tready_5)
);

endmodule
