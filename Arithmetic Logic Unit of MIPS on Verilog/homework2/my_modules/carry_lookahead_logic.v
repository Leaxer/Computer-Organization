module carry_lookahead_logic (output [3:0] c, input [3:0] p, input [3:0] g, input c_in);
	//c0 
	and and1(result1, p[0], c_in);
	or or1(c[0], g[0], result1);

	//c1
	and and2(result2, p[1], result1);
	and and3(result3, p[1], g[0]);
	or or2(orResult1, result2, result3);
	or or3(c[1], g[1], orResult1);
	//c2
	and and4(result4, p[2], result2);
	and and5(result5, p[2], result3);
	and and6(result6, p[2], g[1]);
	or or4(orResult2, result4, result5);
	or or5(orResult3, result6, orResult2);
	or or6(c[2], g[2], orResult3);

	//c3
	and and7(result7, p[3], result4);
	and and8(result8, p[3], result5);
	and and9(result9, p[3], result6);
	and and10(result10, p[3], g[2]);
	or or7(orResult4, result7, result8);
	or or8(orResult5, result9, orResult4);
	or or9(orResult6, result10, orResult5);
	or or10(c[3], g[3], orResult6);
endmodule