module and_3bit (output Y, input a1, input a2, input a3);
	wire r1;
	and and1(r1, a1, a2);
	and and2(Y, a3, r1);
endmodule