module full_adder1bit (output sum, input a, b, c_in);
	xor xor1 (a_xor_b, a, b);
	xor xor2 (sum, a_xor_b, c_in);
	and and1 (a_xor_b_AND_c_in, a_xor_b, c_in);
	and and2 (a_and_b, a, b);
	or or1 (c_out, a_xor_b_AND_c_in, a_and_b);
endmodule