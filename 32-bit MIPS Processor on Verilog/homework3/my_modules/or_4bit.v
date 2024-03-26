module or_4bit (output Y, input a1, input a2, input a3, input a4);
	wire r1, r2;
	or or1(r1, a1, a2);
	or or2(r2, a3, r1);
	or or3(Y, a4, r2);
endmodule