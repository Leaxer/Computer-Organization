module or_3bit (output Y, input a1, input a2, input a3);
	wire r1;
	or or1(r1, a1, a2);
	or or2(Y, a3, r1);
endmodule