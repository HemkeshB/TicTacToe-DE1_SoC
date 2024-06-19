module playerScores (
 input logic clk, reset,
 input logic victor,
 output logic [6:0] HEX
 );

 logic [2:0] score;
 logic out;
 
 enum logic [1:0] {S_on = 2'b1, S_off = 2'b00, S_held = 2'b10} ps, ns;
  always @(*)
    case (ps)
      S_off:  if (victor) ns = S_on;
					else ns = ps;
      S_on:   if (~victor) ns = S_off;
					else if (victor) ns = S_held;
					else ns = ps;
		S_held: if (~victor) ns = S_off;
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
 
 counter3 p(.clk, .reset, .win(out), .count(score));
 
 seg7 display(.bcd(score), .leds(HEX));
 
endmodule // playerScores