module my_testbench();
reg [31:0] A,B;
reg [2:0] ALUop;
wire [31:0] Y;
reg reset;
reg CLK;
alu alu_start(Y, A, B, ALUop, CLK, reset);

	// ************
	initial begin

		reset = 1'b1;
		CLK = 1'b0;
		#5
		reset = 1'b0;
	end
always
	begin
		#3
		CLK = ~CLK;
	end
	// ************

	initial begin
		// A = 30 B = 20
		A = 32'b00000000000000000000000000011110;
		B = 32'b00000000000000000000000000010100;
		ALUop = 3'b000;
		#5
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		// A = 30 B = -10 (Not proper for mod)
		#5
		A = 32'b00000000000000000000000000011110;
		B = 32'b11111111111111111111111111110110;
		reset = 1'b1;
		ALUop = 3'b000;
		#5
		reset = 1'b0;
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		// A = -10 B = -20 (Not proper for mod)
		#5
		A = 32'b11111111111111111111111111110110; 
		B = 32'b11111111111111111111111111101100;
		reset = 1'b1;
		ALUop = 3'b000;
		#5
		reset = 1'b0;
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		// A = 20 B = 30 (Not proper for mod)
		#5
		A = 32'b00000000000000000000000000010100;
		B = 32'b00000000000000000000000000011110;
		reset = 1'b1;
		ALUop = 3'b000;
		#5
		reset = 1'b0;
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		// A = -10 B = 15 (Not proper for mod)
		#5
		A = 32'b11111111111111111111111111110110;
		B = 32'b00000000000000000000000000001111;
		reset = 1'b1;
		ALUop = 3'b000;
		#5
		reset = 1'b0;
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		// A = -20 B = -3 (Not proper for mod)
		#5
		A = 32'b11111111111111111111111111101100;
		B = 32'b11111111111111111111111111111101;
		reset = 1'b1;
		ALUop = 3'b000;
		#5
		reset = 1'b0;
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		// A = 35 B = 7
		#5
		A = 32'b00000000000000000000000000100011;
		B = 32'b00000000000000000000000000000111;
		reset = 1'b1;
		ALUop = 3'b000;
		#5
		reset = 1'b0;
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		// A = 10 B = 3
		#5
		A = 32'b00000000000000000000000000001010;
		B = 32'b00000000000000000000000000000011;
		reset = 1'b1;
		ALUop = 3'b000;
		#5
		reset = 1'b0;
		ALUop = 3'b001;
		#5
		ALUop = 3'b010;
		#5
		ALUop = 3'b011;
		#5
		ALUop = 3'b100;
		#5
		ALUop = 3'b101;
		#5
		ALUop = 3'b110;
		#20
		ALUop = 3'b111;
		
		
		#20
		$finish;
	end
endmodule