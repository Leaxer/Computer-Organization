module mux2x1 (output [31:0] F, input [31:0] D0, input [31:0] D1, input S);
	wire [31:0] wAnd1;
	wire [31:0] wAnd2;
	wire [31:0] sNot;
	wire [31:0] S32;
	sign_extend_alu32bit sn1 (S32, S);
	
	not_32bit g0(sNot, S32);
	and_32bit g1(wAnd1, D0, sNot);
	and_32bit g2(wAnd2, D1, S32);
	or_32bit g3(F, wAnd1, wAnd2);
endmodule