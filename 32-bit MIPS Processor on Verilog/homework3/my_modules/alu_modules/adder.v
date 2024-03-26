module adder(output [31:0] Result, output c_out, output zero_bit, input [31:0] a, input [31:0] b, input c_in);
	wire wC, zORRes;
	wire [31:0] bXor;
	wire [1:0] zero_bits;
	wire [31:0] C32;
	sign_extend_alu32bit sn1 (C32, c_in);
   xor_32bit xor1 (bXor, b, C32);
	carry_lookahead_adder_16bit la1 (Result[15:0], wC, zero_bits[0], a[15:0], bXor[15:0], c_in);
	carry_lookahead_adder_16bit la2 (Result[31:16], c_out, zero_bits[1], a[31:16], bXor[31:16], wC);
	
	//zero_bit
	or zOr (zORRes, zero_bits[0], zero_bits[1]);
	not zNot (zero_bit, zORRes);
endmodule