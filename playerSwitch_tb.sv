// Testbench for centerLight
module playerSwitch_tb ();
	logic clk, reset;
	logic select;
	logic curPlayer;
	
	playerSwitch dut(.clk, .reset, .select, .curPlayer);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		@(posedge clk); select <= 1;
		@(posedge clk); select <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); select <= 1;
		@(posedge clk); select <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); select <= 1;
		@(posedge clk); select <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		@(posedge clk);
		
		$stop;
	end
endmodule  // playerSwitch_tb
