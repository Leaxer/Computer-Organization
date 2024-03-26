module alu_control (
	output [2:0] alu_ctr,
	input [5:0] function_code,
	input [2:0] ALUop);
	
	wire [2:0] alu_ctrRes;
	wire n0, n1, n2;
	not not1 (n0, ALUop[0]);
	not not2 (n1, ALUop[1]);
	not not3 (n2, ALUop[2]);
	
	wire nf0, nf1, nf2, nf3, nf4, nf5;
	not not4 (nf0, function_code[0]);
	not not5 (nf1, function_code[1]);
	not not6 (nf2, function_code[2]);
	not not7 (nf3, function_code[3]);
	not not8 (nf4, function_code[4]);
	not not9 (nf5, function_code[5]);
	
	// C2 p2p1' + p2p1p0' + p2p1p0f1 ------------> not(p2' + p2p1p0f1')
	wire res1, res2, additonalRes;
	and_3bit and1 (res1, ALUop[2], ALUop[1], ALUop[0]);
	and additionalAnd (additonalRes, nf1, res1);
	or or1(res2, n2, additonalRes);
	not(alu_ctr[2], res2);
	
	// C1 p2p1p0' + p2p1p0f2'f0 ------------------ p2p1(p0' + p0f2'f0)
	wire res3, res4;
	and_3bit and2 (res3, ALUop[0], nf2, function_code[0]);
	or or2 (res4, n0, res3);
	and_3bit and3 (alu_ctr[1], ALUop[2], ALUop[1], res4);
	
	// C0 p2'p0 + p2p1'p0 +  (   p2p1p0f2'f0' + p2p1p0f2f1'f0		 p2p1p0(f2'f0' + f2f1'f0)
	wire res5, res6, res7, res8, res9, res10, res11;
	and and4 (res5, n2, ALUop[0]);
	and_3bit and5 (res6, ALUop[2], n1, ALUop[0]);
	
	and and6 (res7, nf2, nf0);
	and_3bit and7 (res8, function_code[2], nf1, function_code[0]);
	or or3 (res9, res7, res8);
	and_3bit and8 (res10, ALUop[2], ALUop[1], ALUop[0]);
	and and9 (res11, res9, res10);
	
	or or4 (res12, res5, res6);
	or or5 (alu_ctr[0], res11, res12);
endmodule