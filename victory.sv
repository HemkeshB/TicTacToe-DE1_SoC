module victory (
  input logic clk, reset,
  
  input logic [1:0] out0, out1, out2, 
				  out3, out4, out5, // How the outputs are relative to the board
				  out6, out7, out8,

  output logic [6:0] HEX0,
  output logic [1:0] win
  );

  // YOUR CODE GOES HERE
  enum logic [1:0] {S_playing = 2'b00, S_2 = 2'b10, S_1 = 2'b01, S_d = 2'b11} ps, ns;
  always @(*) begin
	 ns = ps;  // Default to stay in current state
	
    case (ps)
      S_playing:  begin
							if ((out0 == 1 && out1 == 1 && out2 == 1) || // Row 0
								(out3 == 1 && out4 == 1 && out5 == 1) || // Row 1
								(out6 == 1 && out7 == 1 && out8 == 1) || // Row 2
								(out0 == 1 && out3 == 1 && out6 == 1) || // Column 0
								(out1 == 1 && out4 == 1 && out7 == 1) || // Column 1
								(out2 == 1 && out5 == 1 && out8 == 1) || // Column 2
								(out0 == 1 && out4 == 1 && out8 == 1) || // Diagonal 0
								(out2 == 1 && out4 == 1 && out6 == 1))   // Diagonal 1
							begin
							 ns = S_1;
							end
						
							else if ((out0 == 2 && out1 == 2 && out2 == 2) || 
									  (out3 == 2 && out4 == 2 && out5 == 2) || 
									  (out6 == 2 && out7 == 2 && out8 == 2) || 
									  (out0 == 2 && out3 == 2 && out6 == 2) || 
									  (out1 == 2 && out4 == 2 && out7 == 2) || 
									  (out2 == 2 && out5 == 2 && out8 == 2) || 
									  (out0 == 2 && out4 == 2 && out8 == 2) || 
									  (out2 == 2 && out4 == 2 && out6 == 2)) 
									  
							begin 
							 ns = S_2;
							end
							
							
							
							else if (out0 != 0 && out1 !=0 && out2 != 0 &&
										out3 != 0 && out4 !=0 && out5 != 0 &&
										out6 != 0 && out7 !=0 && out8 != 0) 
								begin
									ns = S_d;
								end
							else 
								begin
								 ns = ps;
								 HEX0 = 7'b1111111;
								 win = 2'b00;
								end
						end
      S_1:  begin
						HEX0 = 7'b1111001;
						win = 2'b01;
						end
		S_2: begin
						HEX0 = 7'b0100100;
						win = 2'b10;
			  end
		S_d: begin
						HEX0 = 7'b0111111;
						win = 2'b11;
				end
		default: begin
						ns = ps;
						HEX0 = 7'b1111111;
					end
	 endcase
	end
	
	always @(posedge clk)
		if (reset)
			ps <= S_playing;
		else
			ps <= ns;
		
endmodule  // victory