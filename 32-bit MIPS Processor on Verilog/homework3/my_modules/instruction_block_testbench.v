module instruction_block_testbench();
  wire [31:0] instruction;
  reg [31:0] pc;
	
	

	localparam period = 10;
	
	instruction_block UUT(instruction, pc);
	
	initial
		begin
			#period;
			pc = 32'b00000000000000000000000000001110;
			$display ("instrucion-%b, pc-%b\n", instruction, pc);
			#period;
			$display ("instrucion-%b, pc-%b\n", instruction, pc);
			end

endmodule