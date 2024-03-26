module memory_block (
  output reg [31:0] read_data,
  input byteOperations,
  input [17:0] address,
  input [31:0] write_data,
  input memRead,
  input memWrite);
  
  
  reg [7:0] data_memory [1023:0]; // 2^18..
  wire [7:0] memRes;
  initial begin
	$readmemb("memory.mem", data_memory);
  end
	//deneme
	assign memRes = data_memory[address];
	//
  always@(*)
	begin
		//$readmemb("memory.mem", data_memory);
		if(memRead) begin
			if(byteOperations) begin
				read_data <= {{24{1'b0}}, memRes};
			end else begin
				read_data <= {data_memory[address + 3], data_memory[address + 2], data_memory[address + 1], data_memory[address]};
			end
		end
		if (memWrite) begin
			if(byteOperations) begin
				data_memory[address] <= write_data[7:0];
				$writememb("memory.mem", data_memory);
			end else begin
				data_memory[address + 3] <= write_data[31:24];
				data_memory[address + 2] <= write_data[23:16];
				data_memory[address + 1] <= write_data[15:8];
				data_memory[address] <= write_data[7:0];
				$writememb("memory.mem", data_memory);
			end
		end
	end
endmodule