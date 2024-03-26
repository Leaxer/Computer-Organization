module mux2x1_5bit (output [4:0] F, input [4:0] D0, input [4:0] D1, input S);
	wire [4:0] wAnd1;
	wire [4:0] wAnd2;
	wire [4:0] sNot;
	wire [4:0] S5;

	and and1(S5[0], 1'b1, S);
	and and2(S5[1], 1'b1, S);
	and and3(S5[2], 1'b1, S);
	and and4(S5[3], 1'b1, S);
	and and5(S5[4], 1'b1, S);
	
	not_5bit g0(sNot, S5);
	and_5bitm g1(wAnd1, D0, sNot);
	and_5bitm g2(wAnd2, D1, S5);
	or_5bit g3(F, wAnd1, wAnd2);
endmodule