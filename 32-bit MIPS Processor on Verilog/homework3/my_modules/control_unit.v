module control_unit (
	output regDst,
	output branch,
	output memRead,
	output memWrite,
	output [2:0] ALUop,
	output ALUsrc,
	output regWrite,
	output jump,
	output byteOperations,
	input [5:0] opcode);
	
	wire r_type, addi, subi, andi, ori, lw, sw, lb, sb, beq, bne, jal, move, slti, jmp;
	wire branchRes;
	wire n0, n1, n2, n3, n4, n5;
	not(n0,opcode[0]);
	not(n1,opcode[1]);
	not(n2,opcode[2]);
	not(n3,opcode[3]);
	not(n4,opcode[4]);
	not(n5,opcode[5]);
	
	//R_TYPE 000000
	and_6bit and1 (r_type, n5, n4, n3, n2, n1, n0);
	//Addi 000010
	and_6bit and2 (addi, n5, n4, n3, n2, opcode[1], n0);
	//Subi 000011
	and_6bit and3 (subi, n5, n4, n3, n2, opcode[1], opcode[0]);
	//Andi 000100
	and_6bit and4 (andi, n5, n4, n3, opcode[2], n1, n0);
	//Ori 000101
	and_6bit and5 (ori, n5, n4, n3, opcode[2], n1, opcode[0]);
	//Lw 001000
	and_6bit and6 (lw, n5, n4, opcode[3], n2, n1, n0);
	//Sw 010000
	and_6bit and7 (sw, n5, opcode[4], n3, n2, n1, n0);
	//Lb 001001
	and_6bit and8 (lb, n5, n4, opcode[3], n2, n1, opcode[0]);
	//Sb 010001
	and_6bit and9 (sb, n5, opcode[4], n3, n2, n1, opcode[0]);
	//Beq 100011
	and_6bit and10 (beq, opcode[5], n4, n3, n2, opcode[1], opcode[0]);
	//Bne 100111
	and_6bit and11 (bne, opcode[5], n4, n3, opcode[2], opcode[1], opcode[0]);
	//Jump 111000
	and_6bit and12 (jmp, opcode[5], opcode[4], opcode[3], n2, n1, n0);
	//Jal 111001
	and_6bit and13 (jal, opcode[5], opcode[4], opcode[3], n2, n1, opcode[0]);
	//Move 100000
	and_6bit and14 (move, opcode[5], n4, n3, n2, n1, n0);
	//Slti 000111
	and_6bit and15 (slti, n5, n4, n3, opcode[2], opcode[1], opcode[0]);
	
	
	//regDst
	or orDst(regDst, r_type, bne);
	
	//branch
	or orBrn(branch, beq, bne);
	
	//memRead
	or orMR(memRead, lw, lb);
	
	//memWrite
	or orMW(memWrite, sw, sb);
	
	//ALUsrc
	wire orSRCRes1, orSRCRes2, orSRCRes3;
	or_4bit orSRC1(orSRCRes1, addi, subi, andi, ori);
	or_4bit orSRC2(orSRCRes2, lw, lb, sw, sb);
	or_4bit orSRC3(ALUsrc, orSRCRes1, orSRCRes2, slti, move);
	
	//regWrite
	wire orRWRes1, orRWRes2, orRWRes3;
	or_6bit orRW1(orRWRes1, r_type, addi, subi, andi, ori, slti);
	or_4bit orRW2(orRWRes2, lw, lb, jal, move);
	or orRW3 (orRWRes3, orRWRes1, orRWRes2);
	or orRW4 (regWrite, move, orRWRes3);
	
	//ALUop2
	wire ALU2Res1, ALU2Res2;
	or_6bit orOP1(ALU2Res1, r_type, addi, subi, slti, lw, sw);
	or_4bit orOP2(ALU2Res2, lb, sb, beq, bne);
	or orOP3 (ALUop[2], ALU2Res1, ALU2Res2);
	
	//ALUop1
	or_4bit orOP4(ALUop[1], r_type, subi, beq, bne);
	
	//ALUop0
	wire ALU0Res, ALU1Res;
	or_4bit orOP5(ALU0Res, r_type, addi, ori, lw);
	or_4bit orOP6(ALU1Res, sw, lb, sb, ALU0Res);
	or orOP7(ALUop[0], move, ALU1Res);
	
	//byteOperations
	or orOP8(byteOperations, lb, sb);
	
	//Jump
	or orOP9(jump, jmp, jal);

endmodule