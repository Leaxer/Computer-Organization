module comparator (output x, input [31:0] a, input [31:0] b);
	wire [31:0] AddSubResult;
	adder addsub1 (AddSubResult, C32, a, b, 1'b1);
	and and1 (x, 1'b1, AddSubResult[31]);
endmodule