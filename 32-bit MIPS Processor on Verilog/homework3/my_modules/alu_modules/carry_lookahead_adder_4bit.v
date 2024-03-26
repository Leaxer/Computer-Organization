module carry_lookahead_adder_4bit (output [3:0] sum, output g_out, output p_out, output zero_bit, input [3:0] a, input [3:0] b, input c_in);
	wire [3:0] p, g;
	wire [3:0] c;

	and g0(g[0], a[0], b[0]);
	and g1(g[1], a[1], b[1]);
	and g2(g[2], a[2], b[2]);
	and g3(g[3], a[3], b[3]);

	or p0(p[0], a[0], b[0]);
	or p1(p[1], a[1], b[1]);
	or p2(p[2], a[2], b[2]);
	or p3(p[3], a[3], b[3]);
	
	carry_lookahead_logic la1 (c, p, g, c_in);
	
	full_adder1bit fa1(sum[0], a[0], b[0], c_in);
	full_adder1bit fa2(sum[1], a[1], b[1], c[0]);
	full_adder1bit fa3(sum[2], a[2], b[2], c[1]);
	full_adder1bit fa4(sum[3], a[3], b[3], c[2]);

	//p_out
	and_3bit and1 (result1, p[0], p[1], p[2]);
	and and2(p_out, p[3], result1);
	
	//g_out
	and_3bit and6 (result6, p[3], p[2], p[1]);
	and and3(result2, g[0], result6);
	and_3bit and4 (result3, p[3], p[2], g[1]);
	and and5 (result4, p[3], g[2]);
	
	or_3bit or1 (result5, result2, result3, result4);
	or or2(g_out, g[3], result5);
	
	//zero_bit
	wire zRes;
	or_3bit zeroOr1(zRes, sum[3], sum[2], sum[1]);
	or zeroOr2(zero_bit, sum[0], zRes);
endmodule