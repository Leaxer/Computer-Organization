module half_adder(output sum, c_out, input a, b);
	xor xor1 (sum, a, b);
	and and1 (c_out, a, b);
endmodule