module mux2x4 (Y, I0, I1, I2, I3, S);
	input [7:0] I0,I1,I2,I3;
	input [1:0] S;
	output [7:0] Y;
	wire [7:0] w1,w2;

	mux2x1 MUX0(w1, I0, I1, S[0]);
	mux2x1 MUX1(w2, I2, I3, S[0]);
	mux2x1 MUX2(Y, w1, w2, S[1]);
endmodule