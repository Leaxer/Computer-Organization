module full_adder_32bit (output [31:0] sum, output c_out, input [31:0] a, input [31:0] b, input c_in);
	wire [2:0] wC_out;
	full_adder8bit fa1(sum[7:0], wC_out[0], a[7:0], b[7:0], c_in);
	full_adder8bit fa2(sum[15:8], wC_out[1], a[15:8], b[15:8], wC_out[0]);
	full_adder8bit fa3(sum[23:16], wC_out[2], a[23:16], b[23:16], wC_out[1]);
	full_adder8bit fa4(sum[31:24], c_out, a[31:24], b[31:24], wC_out[2]);
endmodule