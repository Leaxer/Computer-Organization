module program_counter_adder (output [31:0] newPc, input [31:0] currPc);
	wire addC, addZ;
	wire [31:0] extend;
	sign_extend ext (extend, 16'd4);//??
	adder beqAdd (newPc, addC, addZ, currPc, extend, 1'b0);
endmodule