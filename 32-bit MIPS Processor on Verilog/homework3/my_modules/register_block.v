module register_block (
  output [31:0] read_data1,
  output [31:0] read_data2,
  input [31:0] write_data,
  input [4:0] read_reg1,
  input [4:0] read_reg2,
  input [4:0] write_reg,
  input regWrite);
	
	reg [31:0] registers [31:0];
	initial begin
			$readmemb("registers.mem", registers);
	end
	assign read_data1 = registers[read_reg1];
	assign read_data2 = registers[read_reg2];
	/*always @(read_reg1 | read_reg2) 
	begin
			read_data1 <= registers[read_reg1];
			read_data2 <= registers[read_reg2];
			$display("%b-%b-%0t\n", read_data1, read_data2,$time);
	end*/
	always @(write_data | regWrite | write_reg)
	begin
		if (regWrite) begin
			registers[write_reg] = write_data;
			$writememb("registers.mem", registers);
		end
	end

endmodule