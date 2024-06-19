module counter3_tb();

  logic clk, reset;
  
  logic win;
  logic [2:0] count;
  
  counter3 dut(.clk, .reset, .win, .count);
  
  parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		
		repeat (8) begin
			@(posedge clk); win <= 1;
			@(posedge clk); win <= 0;
		end
		
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		
		repeat (4) begin
			@(posedge clk); win <= 1;
			@(posedge clk); win <= 0;
		end
		
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		
		repeat (10) begin
			@(posedge clk); win <= 1;
			@(posedge clk); win <= 0;
		end
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		@(posedge clk);
		@(posedge clk);
		$stop;
	end
	
  endmodule  // center3_tb