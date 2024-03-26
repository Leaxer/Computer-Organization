module carry_lookahead_adder_16bit (output [15:0] sum, output c_out, input [15:0] a, input [15:0] b, input c_in);
	wire [3:0] p_out, g_out;
	wire [3:0] c;
	
	carry_lookahead_adder_4bit la1 (sum[3:0], g_out[0], p_out[0], a[3:0], b[3:0], c_in);
	carry_lookahead_adder_4bit la2 (sum[7:4], g_out[1], p_out[1], a[7:4], b[7:4], c[0]);
	carry_lookahead_adder_4bit la3 (sum[11:8], g_out[2], p_out[2], a[11:8], b[11:8], c[1]);
	carry_lookahead_adder_4bit la4 (sum[15:12], g_out[3], p_out[3], a[15:12], b[15:12], c[2]);

	carry_lookahead_logic log1 (c, p_out, g_out, c_in);
	
	buf b1 (c_out, c[3]);
endmodule