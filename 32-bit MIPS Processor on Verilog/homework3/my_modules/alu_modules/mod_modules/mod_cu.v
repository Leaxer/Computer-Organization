module mod_cu (
  input reset,
  input clk,
  input x,
  input [31:0] dpResult,
  output reg we,
  output reg s,
  output reg [31:0] result
);

// Define states
localparam IDLE = 2'b00,
			  SUBSTRACT = 2'b01,
			  FINISH = 2'b10;
  
reg [1:0] currentState;
reg [1:0] nextState;

always @(posedge clk)
  begin
    if (reset)
      currentState <= IDLE;
    else 
       currentState <= nextState;
  end
  
always @(*) 
	begin
	case (currentState)
     IDLE:	begin
					nextState = SUBSTRACT;
				end
	  SUBSTRACT:	begin
							if (x)
								nextState = FINISH;
							else
								nextState = SUBSTRACT;
						end
     FINISH:	begin
					end
   endcase
end
	
always @(*)
  begin
  case (currentState)
     IDLE:	begin
					we = 1'b1;
					s = 1'b0;
				end
     SUBSTRACT:	begin
					we = 1'b1;
					s = 1'b1;
					end
     FINISH:	begin
						we = 1'b0;
						s = 1'b0;
						result = dpResult;
					end
   endcase
	end

endmodule