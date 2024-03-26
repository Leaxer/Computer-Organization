module or_5bit (output [4:0] Y, input [4:0] A, input [4:0] B);
	or or1(Y[0], A[0], B[0]);
	or or2(Y[1], A[1], B[1]);
	or or3(Y[2], A[2], B[2]);
	or or4(Y[3], A[3], B[3]);
	or or5(Y[4], A[4], B[4]);
endmodule