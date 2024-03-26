module mod (
	input [31:0] a, input[31:0] b,
	input reset,
	input CLK,
	output [31:0] result
);
wire wx, wwe, ws;
wire [31:0] dpResult;
mod_cu control (reset, CLK, wx, dpResult, wwe, ws, result);
mod_dp datapath (CLK, ws, wwe, a, b, wx, dpResult);

endmodule