module slt (output [31:0] result, input [31:0] A, input [31:0] B);
	wire [31:0] AddSubResult;
	reg [31:0] zero = 32'b00000000000000000000000000000000; //??
	reg [31:0] one = 32'b00000000000000000000000000000001; //??
	wire V, C32, x_res, notB;
	
	adder add1 (AddSubResult, C32, A, B, 1'b1);
	not not1 (notB, B[31]);
	detect_overflow vf1 (V, A[31], notB, AddSubResult[31]);
	// Change depending on overflow
	xor xor1 (x_res, V, AddSubResult[31]);
	
	mux2x1 mux1 (result, zero, one, x_res);
endmodule