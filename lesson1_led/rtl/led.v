
`timescale 1ns/1ps
module led(
    input               CLK,
    input               RSTB,
    output reg [3:0]    LED
);

reg [31:0]   cnt; // 32-bit counter
always @(posedge CLK or negedge RSTB) begin
    if (!RSTB) begin
        cnt <= 32'b0;
        LED <= 4'b0001;
    end else begin
        if (cnt == 32'd25_000_000) begin // Assuming a 25MHz clock, this will toggle every second
            cnt <= 32'b0; // Reset the counter
            LED <= {LED[2:0], LED[3]};
        end
        else
            cnt <= cnt + 1'b1;
    end
end

endmodule
