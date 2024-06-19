module boxSelector (
  input logic clk, reset,
  
  input logic [1:0] out0, out1, out2, 
                  out3, out4, out5, // How the outputs are relative to the board
                  out6, out7, out8,

  // button for next box is pressed
  input logic next,
  // 16x16 output but green pixels if 1 then it is a green pixel
  output logic [15:0][15:0] GrnPixels,
  
  output logic [3:0] curBox
);

  // State definitions
enum logic [3:0] {
    zero  = 4'b0000,
    one   = 4'b0001,
    two   = 4'b0010,
    three = 4'b0011,
    four  = 4'b0100,
    five  = 4'b0101,
    six   = 4'b0110,
    seven = 4'b0111,
    eight = 4'b1000,
	 nulls = 4'b1001
  } ps, ns;


  // State transition logic with output checks
 always @(*) begin
    case (ps)
      zero: ns = (next || (out0 != 2'b00)) ? one : zero;
      one: ns = (next || (out1 != 2'b00)) ? two : one;
      two: ns = (next || (out2 != 2'b00)) ? three : two;
      three: ns = (next || (out3 != 2'b00)) ? four : three;
      four: ns = (next || (out4 != 2'b00)) ? five : four;
      five: ns = (next || (out5 != 2'b00)) ? six : five;
      six: ns = (next || (out6 != 2'b00)) ? seven : six;
      seven: ns = (next || (out7 != 2'b00)) ? eight : seven;
      eight: begin
				 if (next || (out8 != 2'b00)) begin
					  ns = nulls;
				 end
				 else begin
					  ns = eight;
				 end
			 end
      nulls: ns = ((out0 != 0 && out1 !=0 && out2 != 0 &&
							 out3 != 0 && out4 !=0 && out5 != 0 &&
							 out6 != 0 && out7 !=0 && out8 != 0)) ? nulls : zero;
					
		default: begin
        if (out0 == 2'b00) ns = zero;
        else if (out1 == 2'b00) ns = one;
        else if (out2 == 2'b00) ns = two;
        else if (out3 == 2'b00) ns = three;
        else if (out4 == 2'b00) ns = four;
        else if (out5 == 2'b00) ns = five;
        else if (out6 == 2'b00) ns = six;
        else if (out7 == 2'b00) ns = seven;
        else if (out8 == 2'b00) ns = eight;
        else ns = nulls; // All slots are taken
      end
    endcase
 end

	 
	always @(*)
		case (ps)
			zero: begin
					if (out0 == 2'b00) begin
					GrnPixels[02] = 16'b0011010000100000;
					GrnPixels[03] = 16'b0011010000100000;
					GrnPixels[07] = 16'b0000010000100000;
					GrnPixels[08] = 16'b0000010000100000;
					GrnPixels[12] = 16'b0000010000100000;
					GrnPixels[13] = 16'b0000010000100000;
					end
					curBox = ps;
				end
				
			one: begin
					if (out1 == 2'b00) begin
					GrnPixels[02] = 16'b0000010110100000;
					GrnPixels[03] = 16'b0000010110100000;
					GrnPixels[07] = 16'b0000010000100000;
					GrnPixels[08] = 16'b0000010000100000;
					GrnPixels[12] = 16'b0000010000100000;
					GrnPixels[13] = 16'b0000010000100000;
					end
					curBox = ps;
				end
			two: begin
					if (out2 == 2'b00) begin
					GrnPixels[02] = 16'b0000010000101100;
					GrnPixels[03] = 16'b0000010000101100;
					GrnPixels[07] = 16'b0000010000100000;
					GrnPixels[08] = 16'b0000010000100000;
					GrnPixels[12] = 16'b0000010000100000;
					GrnPixels[13] = 16'b0000010000100000;
					end
					curBox = ps;
				end
			three: begin
					if (out3 == 2'b00) begin
					GrnPixels[02] = 16'b0000010000100000;
					GrnPixels[03] = 16'b0000010000100000;
					GrnPixels[07] = 16'b0011010000100000;
					GrnPixels[08] = 16'b0011010000100000;
					GrnPixels[12] = 16'b0000010000100000;
					GrnPixels[13] = 16'b0000010000100000;
					end
					curBox = ps;
				end
			four: begin
					if (out4 == 2'b00) begin
					GrnPixels[02] = 16'b0000010000100000;
					GrnPixels[03] = 16'b0000010000100000;
					GrnPixels[07] = 16'b0000010110100000;
					GrnPixels[08] = 16'b0000010110100000;
					GrnPixels[12] = 16'b0000010000100000;
					GrnPixels[13] = 16'b0000010000100000;
					end
					curBox = ps;
				end
			five: begin
					if (out5 == 2'b00) begin
					GrnPixels[02] = 16'b0000010000100000;
					GrnPixels[03] = 16'b0000010000100000;
					GrnPixels[07] = 16'b0000010000101100;
					GrnPixels[08] = 16'b0000010000101100;
					GrnPixels[12] = 16'b0000010000100000;
					GrnPixels[13] = 16'b0000010000100000;
					end
					curBox = ps;
				end
			six: begin
					if (out6 == 2'b00) begin
					GrnPixels[02] = 16'b0000010000100000;
					GrnPixels[03] = 16'b0000010000100000;
					GrnPixels[07] = 16'b0000010000100000;
					GrnPixels[08] = 16'b0000010000100000;
					GrnPixels[12] = 16'b0011010000100000;
					GrnPixels[13] = 16'b0011010000100000;
					end
					curBox = ps;
				end
			seven: begin
					if (out7 == 2'b00) begin
					GrnPixels[02] = 16'b0000010000100000;
					GrnPixels[03] = 16'b0000010000100000;
					GrnPixels[07] = 16'b0000010000100000;
					GrnPixels[08] = 16'b0000010000100000;
					GrnPixels[12] = 16'b0000010110100000;
					GrnPixels[13] = 16'b0000010110100000;
					end
					curBox = ps;
				end
			eight: begin
					if (out8 == 2'b00) begin
					GrnPixels[02] = 16'b0000010000100000;
					GrnPixels[03] = 16'b0000010000100000;
					GrnPixels[07] = 16'b0000010000100000;
					GrnPixels[08] = 16'b0000010000100000;
					GrnPixels[12] = 16'b0000010000101100;
					GrnPixels[13] = 16'b0000010000101100;
					end
					curBox = ps;
				end
			nulls: begin
				GrnPixels[00] = 16'b0000010000100000;
				GrnPixels[01] = 16'b0000010000100000;
				GrnPixels[02] = 16'b0000010000100000;
				GrnPixels[03] = 16'b0000010000100000;
				GrnPixels[04] = 16'b0000010000100000;
				GrnPixels[05] = 16'b1111111111111111;
				GrnPixels[06] = 16'b0000010000100000;
				GrnPixels[07] = 16'b0000010000100000;
				GrnPixels[08] = 16'b0000010000100000;
				GrnPixels[09] = 16'b0000010000100000;
				GrnPixels[10] = 16'b1111111111111111;
				GrnPixels[11] = 16'b0000010000100000;
				GrnPixels[12] = 16'b0000010000100000;
				GrnPixels[13] = 16'b0000010000100000;
				GrnPixels[14] = 16'b0000010000100000;
				GrnPixels[15] = 16'b0000010000100000;
				curBox = ps;
				end
			default: ns = ps;
		endcase
	
	always @(posedge clk)
		if (reset) begin
			ps <= nulls;
			end
		else
			begin
			ps <= ns;
			end
		
endmodule  // boxSelector
