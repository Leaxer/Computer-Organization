module alu_testbench();
reg [31:0] A,B;
reg [2:0] ALUop;
wire [31:0] Y;
wire zero;
alu alu_start(Y, zero, A, B, ALUop);
	initial begin
		// A = 30 B = 20
		A = 32'b00000000000000000000000000010100;
		B = 32'b00000000000000000000000000010100;
		#5
		ALUop = 3'b100;
		
		#20
		$finish;
	end
endmodule