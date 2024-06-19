// Testbench for synch
module synch_tb();
	logic clk, reset, in;
	logic out;
	
	synch dut(.clk, .reset, .in, .out);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		
		@(posedge clk); in <= 0;
		
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 1;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 0;
		@(posedge clk); in <= 0;
		
		
		$stop;
	end
	
endmodule  // dff_3_testbench
