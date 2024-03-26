module instruction_block(output reg [31:0] instruction, input [31:0] pc);
	reg [7:0] instr_mem [1023:0];//will change
	
	initial begin
	  $readmemb("instructions.mem", instr_mem);
   end
	//always takes the instruction with program counter
	always @(*) begin
		instruction = {instr_mem[pc + 3], instr_mem[pc + 2], instr_mem[pc + 1], instr_mem[pc]};
		
	end
	
endmodule