module userInput_tb ();

  logic clk, reset;
  
  logic in;

  // output only when edge detected
  logic out;
  
  userInput dut(.clk, .reset, .in, .out);
  
  parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
 	
	initial begin

		@(posedge clk); reset <= 1;
		@(posedge clk); reset <= 0;
		
		
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 0;
		
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 1;
		
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 0;
		
		$stop;
	end
	
endmodule  // userInput