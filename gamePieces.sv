module gamePieces (
  input logic clk, reset,
  
  input logic [1:0] out0, out1, out2, 
                  out3, out4, out5, // How the outputs are relative to the board
                  out6, out7, out8,

  // 16x16 output but red pixels, if 1 then it is on
  output logic [15:0][15:0] RedPixels
);

  always_comb begin
    // Initialize all RedPixels to 0
    RedPixels = '0;
	 if (reset) begin
			RedPixels = '0;
	 end
	 else begin
		 // Update RedPixels based on out0
		 if (out0 == 1) begin
			  RedPixels[1] |= 16'b0100100000000000;
			  RedPixels[2] |= 16'b0011000000000000;
			  RedPixels[3] |= 16'b0011000000000000;
			  RedPixels[4] |= 16'b0100100000000000;
		 end else if (out0 == 2) begin
			  RedPixels[1] |= 16'b0011000000000000;
			  RedPixels[2] |= 16'b0100100000000000;
			  RedPixels[3] |= 16'b0100100000000000;
			  RedPixels[4] |= 16'b0011000000000000;
		 end

		 // Update RedPixels based on out1
		 if (out1 == 1) begin
			  RedPixels[1] |= 16'b0000001001000000;
			  RedPixels[2] |= 16'b0000000110000000;
			  RedPixels[3] |= 16'b0000000110000000;
			  RedPixels[4] |= 16'b0000001001000000;
		 end else if (out1 == 2) begin
			  RedPixels[1] |= 16'b0000000110000000;
			  RedPixels[2] |= 16'b0000001001000000;
			  RedPixels[3] |= 16'b0000001001000000;
			  RedPixels[4] |= 16'b0000000110000000;
		 end

		 // Update RedPixels based on out2
		 if (out2 == 1) begin
			  RedPixels[1] |= 16'b0000000000010010;
			  RedPixels[2] |= 16'b0000000000001100;
			  RedPixels[3] |= 16'b0000000000001100;
			  RedPixels[4] |= 16'b0000000000010010;
		 end else if (out2 == 2) begin
			  RedPixels[1] |= 16'b0000000000001100;
			  RedPixels[2] |= 16'b0000000000010010;
			  RedPixels[3] |= 16'b0000000000010010;
			  RedPixels[4] |= 16'b0000000000001100;
		 end

		 // Update RedPixels based on out3
		 if (out3 == 1) begin
			  RedPixels[6] |= 16'b0100100000000000;
			  RedPixels[7] |= 16'b0011000000000000;
			  RedPixels[8] |= 16'b0011000000000000;
			  RedPixels[9] |= 16'b0100100000000000;
		 end else if (out3 == 2) begin
			  RedPixels[6] |= 16'b0011000000000000;
			  RedPixels[7] |= 16'b0100100000000000;
			  RedPixels[8] |= 16'b0100100000000000;
			  RedPixels[9] |= 16'b0011000000000000;
		 end

		 // Update RedPixels based on out4
		 if (out4 == 1) begin
			  RedPixels[6] |= 16'b0000001001000000;
			  RedPixels[7] |= 16'b0000000110000000;
			  RedPixels[8] |= 16'b0000000110000000;
			  RedPixels[9] |= 16'b0000001001000000;
		 end else if (out4 == 2) begin
			  RedPixels[6] |= 16'b0000000110000000;
			  RedPixels[7] |= 16'b0000001001000000;
			  RedPixels[8] |= 16'b0000001001000000;
			  RedPixels[9] |= 16'b0000000110000000;
		 end

		 // Update RedPixels based on out5
		 if (out5 == 1) begin
			  RedPixels[6] |= 16'b0000000000010010;
			  RedPixels[7] |= 16'b0000000000001100;
			  RedPixels[8] |= 16'b0000000000001100;
			  RedPixels[9] |= 16'b0000000000010010;
		 end else if (out5 == 2) begin
			  RedPixels[6] |= 16'b0000000000001100;
			  RedPixels[7] |= 16'b0000000000010010;
			  RedPixels[8] |= 16'b0000000000010010;
			  RedPixels[9] |= 16'b0000000000001100;
		 end

		 // Update RedPixels based on out6
		 if (out6 == 1) begin
			  RedPixels[11] |= 16'b0100100000000000;
			  RedPixels[12] |= 16'b0011000000000000;
			  RedPixels[13] |= 16'b0011000000000000;
			  RedPixels[14] |= 16'b0100100000000000;
		 end else if (out6 == 2) begin
			  RedPixels[11] |= 16'b0011000000000000;
			  RedPixels[12] |= 16'b0100100000000000;
			  RedPixels[13] |= 16'b0100100000000000;
			  RedPixels[14] |= 16'b0011000000000000;
		 end

		 // Update RedPixels based on out7
		 if (out7 == 1) begin
			  RedPixels[11] |= 16'b0000001001000000;
			  RedPixels[12] |= 16'b0000000110000000;
			  RedPixels[13] |= 16'b0000000110000000;
			  RedPixels[14] |= 16'b0000001001000000;
		 end else if (out7 == 2) begin
			  RedPixels[11] |= 16'b0000000110000000;
			  RedPixels[12] |= 16'b0000001001000000;
			  RedPixels[13] |= 16'b0000001001000000;
			  RedPixels[14] |= 16'b0000000110000000;
		 end

		 // Update RedPixels based on out8
		 if (out8 == 1) begin
			  RedPixels[11] |= 16'b0000000000010010;
			  RedPixels[12] |= 16'b0000000000001100;
			  RedPixels[13] |= 16'b0000000000001100;
			  RedPixels[14] |= 16'b0000000000010010;
		 end else if (out8 == 2) begin
			  RedPixels[11] |= 16'b0000000000001100;
			  RedPixels[12] |= 16'b0000000000010010;
			  RedPixels[13] |= 16'b0000000000010010;
			  RedPixels[14] |= 16'b0000000000001100;
		 end
	  end
end
	
endmodule  // gamePieces