module memory_block_testbench();
	 wire [31:0] read_data;
  reg [17:0] address;
  reg [31:0] write_data;
  reg memRead;
  reg memWrite;
	
	

	localparam period = 10;
	
	memory_block UUT(read_data, address, write_data, memRead, memWrite);
	
	initial
		begin
			#period;
			address = 18'b000000000000001110;
			write_data = 32'd27;
			memRead = 1'b0;
			memWrite = 1'b1;
			$display ("Memory Write address-%18b, memRead-%b, memWrite-%b, write-data-%b, read_data-%b\n", address, memRead, memWrite, write_data, read_data);
			#period
			address = 18'b000000000000001110;
			write_data = 32'd27;
			memRead = 1'b1;
			memWrite = 1'b0;
			$display ("Memory Write address-%18b, memRead-%b, memWrite-%b, write-data-%b, read_data-%b\n", address, memRead, memWrite, write_data, read_data);
			end

endmodule