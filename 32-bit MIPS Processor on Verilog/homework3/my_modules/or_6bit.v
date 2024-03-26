module or_6bit (output Y, input a1, input a2, input a3, input a4, input a5, input a6);
	wire r1, r2, r3, r4;
	or or1(r1, a1, a2);
	or or2(r2, a3, r1);
	or or3(r3, a4, r2);
	or or4(r4, a5, r3);
	or or5(Y, a6, r4);
endmodule