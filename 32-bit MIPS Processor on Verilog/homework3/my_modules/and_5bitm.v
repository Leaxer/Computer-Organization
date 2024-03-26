module and_5bitm (output [4:0] Y, input [4:0] A, input [4:0] B);
	and and1(Y[0], A[0], B[0]);
	and and2(Y[1], A[1], B[1]);
	and and3(Y[2], A[2], B[2]);
	and and4(Y[3], A[3], B[3]);
	and and5(Y[4], A[4], B[4]);
endmodule