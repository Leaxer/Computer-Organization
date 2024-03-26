module not_5bit (output [4:0] out, input [4:0] in);
	not not0(out[0], in[0]);
	not not1(out[1], in[1]);
	not not2(out[2], in[2]);
	not not3(out[3], in[3]);
	not not4(out[4], in[4]);
endmodule