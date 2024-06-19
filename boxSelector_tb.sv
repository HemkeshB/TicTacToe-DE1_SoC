module boxSelector_tb();
  logic clk, reset;
  logic next;
  logic [1:0] out0, out1, out2;
  logic [1:0] out3, out4, out5;
  logic [1:0] out6, out7, out8;
  logic [15:0][15:0] GrnPixels;
  logic [3:0] curBox;

  // Instantiate the victory module
  boxSelector dut (
    .clk(clk),
    .reset(reset),
    .out0(out0), .out1(out1), .out2(out2),
    .out3(out3), .out4(out4), .out5(out5),
    .out6(out6), .out7(out7), .out8(out8),
	 .next,
	 .GrnPixels,
    .curBox
  );

	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		integer i;
		
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b00_00_00_00_00_00_00_00_00;
		@(posedge clk); reset = 1;
		@(posedge clk); reset = 0;
		for (i = 0; i < 11; i++) begin
			@(posedge clk); next = 1;
			@(posedge clk); next = 0;
		end
		@(posedge clk);
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b01_00_01_00_00_01_00_00_00;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); next = 1;
		@(posedge clk); next = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); next = 1;
		@(posedge clk); next = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); next = 1;
		@(posedge clk); next = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); next = 1;
		@(posedge clk); next = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); next = 1;
		@(posedge clk); next = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); next = 1;
		@(posedge clk); next = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); next = 1;
		@(posedge clk); next = 0;
		
		
		
		@(posedge clk);
		
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_00_01_00_10_01_00_00_10;
		
		for (i = 0; i < 6; i++) begin
			@(posedge clk);
			@(posedge clk);
			@(posedge clk); next = 1;
			@(posedge clk); next = 0;
		end
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_10_01_10_10_01_10_00_10;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); {out0, out1, out2, out3, out4, out5, out6, out7, out8} = 18'b10_10_01_10_10_01_10_10_10;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		$stop;
	end
	
endmodule  // boxSelector_tb