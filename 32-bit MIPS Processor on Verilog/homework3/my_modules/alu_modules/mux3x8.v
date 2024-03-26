module mux3x8 (Y, I0, I1, I2, I3, I4, I5, I6, I7, S);
	input [31:0] I0,I1,I2,I3,I4,I5,I6,I7;
	input [2:0] S;
	output [31:0] Y;
	wire [31:0] w1,w2,w3,w4,w5,w6;

	mux2x1 MUX0(w1, I0, I1, S[0]);
	mux2x1 MUX1(w2, I2, I3, S[0]);
	mux2x1 MUX2(w3, I4, I5, S[0]);
	mux2x1 MUX3(w4, I6, I7, S[0]);

	mux2x1 MUX4(w5, w1, w2, S[1]);
	mux2x1 MUX5(w6, w3, w4, S[1]);

	mux2x1 MUX6(Y, w5, w6, S[2]);
endmodule