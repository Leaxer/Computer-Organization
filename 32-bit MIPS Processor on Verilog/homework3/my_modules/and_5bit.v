module and_5bit (output Y, input a1, input a2, input a3, input a4, input a5);
	wire r1, r2, r3;
	and and1(r1, a1, a2);
	and and2(r2, a3, r1);
	and and3(r3, a4, r2);
	and and4(Y, a5, r3);
endmodule