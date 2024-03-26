module alu_control_testbench();
	reg [5:0] function_code;
	reg [2:0] ALUop;
	wire [2:0] alu_ctr;
	
	

	localparam period = 10;
	
	alu_control UUT(alu_ctr, function_code, ALUop);
	
	initial
		begin
			#period;
			ALUop = 3'b000;
			function_code = 6'b110101;
			#1 $display ("andi function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b001;
			function_code = 6'b010110;
			#1 $display ("ori function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b100;
			function_code = 6'b010110;
			#1 $display ("slti function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b101;
			function_code = 6'b010110;
			#1 $display ("addi, lb, sb, lw, sw function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b110;
			function_code = 6'b101010;
			#1 $display ("subi, beq, bne function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b111;
			function_code = 6'b000010;
			#1 $display ("add function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b111;
			function_code = 6'b000011;
			#1 $display ("sub function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b111;
			function_code = 6'b000100;
			#1 $display ("and function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b111;
			function_code = 6'b000101;
			#1 $display ("or function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			ALUop = 3'b111;
			function_code = 6'b000111;
			#1 $display ("slt function_code-%6b, ALUop-%3b, alu_ctr-%3b\n", function_code, ALUop, alu_ctr);
			#period;
			end

endmodule