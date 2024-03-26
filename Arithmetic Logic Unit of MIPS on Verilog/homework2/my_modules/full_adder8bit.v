module full_adder8bit (output [7:0] sum, output c_out, input [7:0] a, input [7:0] b, input c_in);
	/*wire [6:0] wC_out;
	full_adder1bit fa1(sum[0], wC_out[0], a[0], b[0], c_in);
	full_adder1bit fa2(sum[1], wC_out[1], a[1], b[1], wC_out[0]);
	full_adder1bit fa3(sum[2], wC_out[2], a[2], b[2], wC_out[1]);
	full_adder1bit fa4(sum[3], wC_out[3], a[3], b[3], wC_out[2]);
	full_adder1bit fa5(sum[4], wC_out[4], a[4], b[4], wC_out[3]);
	full_adder1bit fa6(sum[5], wC_out[5], a[5], b[5], wC_out[4]);
	full_adder1bit fa7(sum[6], wC_out[6], a[6], b[6], wC_out[5]);
	full_adder1bit fa8(sum[7], c_out, a[7], b[7], wC_out[6]);*/
endmodule