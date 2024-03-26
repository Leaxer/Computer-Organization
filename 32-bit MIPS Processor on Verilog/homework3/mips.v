module mips(input clock);
	reg [31:0] pc;
	reg initialized = 1;
	wire [31:0] instruction;
	wire regDst, branch;
	wire memRead, memWrite, ALUsrc, regWrite, zero, beqA, bneA, notZero, notRegDst, jump, byteOperations, beqW, bneW, beqLast, cuRegWrite;
	wire [2:0] ALUop, alu_ctr;
	wire [4:0] write_reg, wrFirst;
	wire [31:0] imm_num;
	wire [31:0] reg_read_data1, reg_read_data2, alu2_data, alu_result, mem_result, mem_mux_result, sl, 
					beqAddRes, bMuxRes, newPc, jResult, lastPcRes, write_data, jrRes, sbmxRes, lbmxRes;
	wire addC, addZ;
	reg [31:0] dl_write_data;
	reg [4:0] dl_write_reg;
	reg dl_regWrite;
	initial begin
	end
	//PC Counter
	always @(posedge clock)
	  begin
		 if(initialized) begin
		 	pc <= 32'b0;
			initialized = 0;
		 end else begin
		 pc <= lastPcRes;
		 end
		end
	program_counter_adder pcAdd (newPc, pc);
	
	// Instruction memory and control unit
	instruction_block instr_block_inst(instruction, pc);
	control_unit ctu(regDst, branch, memRead, memWrite, ALUop, ALUsrc, cuRegWrite, jump, byteOperations, instruction[31:26]);
	
	// Registers
	mux2x1_5bit write_reg_mux (wrFirst, instruction[20:16], instruction[15:11], regDst);
	mux2x1_5bit write_reg_mux2 (write_reg, wrFirst, {5'b11111}, jump);
	always @(negedge clock) begin
    dl_write_data <= write_data;
	 dl_write_reg <= write_reg;
	 dl_regWrite <= regWrite;
	end
	// write data
	mux2x1 write_reg_mux3 (write_data, mem_mux_result, newPc, jump);
	register_block regb (reg_read_data1, reg_read_data2, dl_write_data, instruction[25:21], instruction[20:16], dl_write_reg, dl_regWrite);
	   memory_block memoryb (mem_result, byteOperations, alu_result[17:0], reg_read_data2, memRead, memWrite);

   // imm extend
   sign_extend sgn (imm_num ,instruction[15:0]);
  
   // ALU
   mux2x1 alu_mux (alu2_data, reg_read_data2, imm_num, ALUsrc);
  
   alu_control alc (alu_ctr, instruction[5:0], ALUop);
   alu al (alu_result, zero, reg_read_data1, alu2_data, alu_ctr); // mod??
  
   // beq bne
	shift_left_2 sl2 (sl, imm_num);
	adder beqAdd (beqAddRes, addC, addZ, sl, newPc, 1'b0);
	not beqNot1 (notRegDst, regDst);
	not beqNot2 (notZero, zero);
	and beqAnd1 (beqW, branch, zero);
	and beqAnd2 (beqA, notRegDst, beqW);
	and beqAnd3 (bneW, branch, notZero);
	and beqAnd4 (bneA, regDst, bneW);
	or beqOr (beqLast ,bneA, beqA);
	mux2x1 beq_mux (bMuxRes, jrRes, beqAddRes, beqLast);

	
   // data memory
   mux2x1 mem_mux (mem_mux_result, alu_result, mem_result, memRead);

	
	// jump
	assign jResult = {instruction[25:0], {2{1'b0}}};
	mux2x1 jump_mux (lastPcRes, bMuxRes, {pc[31:28], jResult}, jump);
	
	// jump register --
	and jrAnd (jrCont, regDst, instruction[3:3]);
	xor overRW (regWrite, jrCont, cuRegWrite);
	mux2x1 jr_mux (jrRes, newPc, reg_read_data1, jrCont);
endmodule