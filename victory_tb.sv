module victory_tb();
  logic clk, reset;
  logic [1:0] out0, out1, out2;
  logic [1:0] out3, out4, out5;
  logic [1:0] out6, out7, out8;
  logic [6:0] HEX0;
  logic [1:0] win;

  // Instantiate the victory module
  victory dut (
    .clk(clk),
    .reset(reset),
    .out0(out0), .out1(out1), .out2(out2),
    .out3(out3), .out4(out4), .out5(out5),
    .out6(out6), .out7(out7), .out8(out8),
    .HEX0(HEX0), .win(win)
  );

	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		
		// Rows
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b01_01_01_00_00_00_00_00_00;
		@(posedge clk);
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0; {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_00_01_01_01_00_00_00;
		@(posedge clk);
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_00_00_00_00_01_01_01;
		@(posedge clk);
		@(posedge clk);

		// Rows2
		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_10_10_00_00_00_00_00_00;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_00_10_10_10_00_00_00;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_00_00_00_00_10_10_10;
		@(posedge clk);

		// Columns for Player 1 (01)
		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b01_00_00_01_00_00_01_00_00;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_01_00_00_01_00_00_01_00;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_01_00_00_01_00_00_01;
		@(posedge clk);

		// Columns for Player 2 (10)
		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_00_00_10_00_00_10_00_00;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_10_00_00_10_00_00_10_00;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_10_00_00_10_00_00_10;
		@(posedge clk);

		// Diagonals for Player 1 (01)
		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b01_00_00_00_01_00_00_00_01;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_01_00_01_00_01_00_00;
		@(posedge clk);

		// Diagonals for Player 2 (10)
		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_00_00_00_10_00_00_00_10;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_10_00_10_00_10_00_00;
		@(posedge clk);

		// Draw conditions
		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b01_10_01_01_10_01_10_01_10;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_01_10_10_01_10_01_10_01;
		@(posedge clk);

		// In progress conditions
		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b01_10_00_01_00_10_00_01_10;
		@(posedge clk);

		@(posedge clk); reset = 1; @(posedge clk); reset = 0;
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_01_00_10_00_01_00_10_01;
		@(posedge clk);

		$stop;
	end
	
endmodule  // victory_tb