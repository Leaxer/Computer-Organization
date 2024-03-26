module detect_overflow (output result, input A, input B, input c_out);
	wire notA,notB,notC, res1, res2;
	not not1 (notA, A);
	not not2 (notB, B);
	not not3 (notC, c_out);
	
	and_3bit and1 (res1, A, B, notC);
	and_3bit and2 (res2, notA, notB, c_out);
	or or1 (result, res1, res2);
endmodule