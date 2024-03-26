module mod_dp (
	input CLK,
   input s,
   input we,
   input [31:0] a,
   input [31:0] b,
   output x,
	output reg [31:0] dpResult
);
wire [31:0] mux_out1;
wire [31:0] mux_out2;
wire tempCout;
wire [31:0] sum;
wire zero_bit;

always @(posedge CLK)
	begin
	if(we) begin
		dpResult <= sum;
		end
	end
mux2x1 mux1 (mux_out1, a, dpResult, s);
mux2x1 mux2 (mux_out2, 32'd0, b, s);


adder sub (sum, tempCout, zero_bit, mux_out1, mux_out2, 1'b1);
comparator comp(x, sum, b);

endmodule