module mips_testbench();
  reg clock;
	
	mips UUT(clock);
	initial begin
		clock = 1'b1;
	end
	always
	begin
		#3
		clock = ~clock;
	end
	
	
	initial
		begin
		#310 $finish;
			end

endmodule