module comparator (output x, input [31:0] a, input [31:0] b);
	wire [31:0] AddSubResult;
	wire zero_bit;
	adder addsub1 (AddSubResult, C32, zero_bit, a, b, 1'b1);
	and and1 (x, 1'b1, AddSubResult[31]);
endmodule