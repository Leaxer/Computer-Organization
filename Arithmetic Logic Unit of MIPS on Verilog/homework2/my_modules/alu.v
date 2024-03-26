module alu(output [31:0] Result, input [31:0] A, input [31:0] B, input [2:0] ALUop, input CLK, input reset);
  wire [31:0] AddSubResult;
  wire [31:0] AndResult;
  wire [31:0] OrResult;
  wire [31:0] XorResult;
  wire [31:0] NorResult;
  wire [31:0] stResult;
  wire [31:0] modResult;
  wire C32;
  and_32bit and1 (AndResult, A, B);
  or_32bit or1 (OrResult, A, B);
  xor_32bit xor1 (XorResult, A, B);
  nor_32bit nor1 (NorResult, A, B);
  adder add1 (AddSubResult, C32, A, B, ALUop[1]);
  slt slt1 (stResult, A, B);
  mod mod1 (A, B, reset, CLK, modResult);
  mux3x8 mux (Result, AndResult, OrResult, XorResult, NorResult, stResult, AddSubResult, AddSubResult, modResult, ALUop);
  
endmodule