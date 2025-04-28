
module sync #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire rst_n,
    input wire [WIDTH-1:0] din,
    output wire [WIDTH-1:0] dout
);

reg [WIDTH-1:0] din_1d, din_2d;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        din_1d <= {WIDTH{1'b0}};
        din_2d <= {WIDTH{1'b0}};
    end else begin
        din_1d <= din;
        din_2d <= din_1d;
    end
end

assign dout = din_2d;

endmodule
