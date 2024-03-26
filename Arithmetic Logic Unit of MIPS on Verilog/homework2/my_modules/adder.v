module adder(output [31:0] Result, output c_out, input [31:0] a, input [31:0] b, input c_in);
	wire wC;
	wire [31:0] bXor;
	
	wire [31:0] C32;
	sign_extend sn1 (C32, c_in);
   xor_32bit xor1 (bXor, b, C32);
	carry_lookahead_adder_16bit la1 (Result[15:0], wC, a[15:0], bXor[15:0], c_in);
	carry_lookahead_adder_16bit la2 (Result[31:16], c_out, a[31:16], bXor[31:16], wC);
endmodule