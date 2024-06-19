module userInput (
  input logic clk, reset,
  
  input logic in,

  // output only when edge detected
  output logic out
  );

  // YOUR CODE GOES HERE
  enum logic [1:0] {S_on = 2'b1, S_off = 2'b00, S_held = 2'b10} ps, ns;
  always @(*)
    case (ps)
      S_off:  if (in) ns = S_on;
					else ns = ps;
      S_on:   if (~in) ns = S_off;
					else if (in) ns = S_held;
					else ns = ps;
		S_held: if (~in) ns = S_off;
					else ns = ps;
      default: ns = ps;
	 endcase
	
	always @(*)
		case (ps)
			S_on: out = 1;
			default: out = 0;
		endcase
	
	always @(posedge clk)
		if (reset)
			ps <= S_off;
		else
			ps <= ns;
		
endmodule  // userInput