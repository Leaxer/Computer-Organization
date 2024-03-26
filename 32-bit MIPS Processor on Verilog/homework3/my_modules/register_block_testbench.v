module register_block_testbench();
  wire [31:0] read_data1;
  wire [31:0] read_data2;
  reg [31:0] write_data;
  reg [4:0] read_reg1;
  reg [4:0] read_reg2;
  reg [4:0] write_reg;
  reg regWrite;
	
	

	localparam period = 10;
	
	register_block UUT(read_data1, read_data2, write_data, read_reg1, read_reg2, write_reg, regWrite);
	
	initial
		begin
			#period;
			write_data = 32'd14;
			read_reg1 = 5'b00000;
			read_reg2 = 5'b00000;
			write_reg = 5'b00010;
			regWrite = 1'b1;
			end

endmodule