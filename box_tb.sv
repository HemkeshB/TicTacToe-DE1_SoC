module box_tb();
  logic clk, reset;
  logic select;
  logic [3:0] curBox;
  logic curPlayer;
  
  logic [1:0] out0;

  // Instantiate the victory module
  box dut (
    .clk(clk),
    .reset(reset),
	 .select(select && curBox == 0),
	 .curPlayer,
    .boxVal(out0)
  );

	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		integer i;
		@(posedge clk); reset = 1;
		@(posedge clk); reset = 0;
		
		// Select but wrong box, no output
		@(posedge clk); {select, curBox, curPlayer} = 6'b1_0100_1;
		@(posedge clk);
		
		// Select but wrong box, no output (repeat)
		@(posedge clk); {select, curBox, curPlayer} = 6'b1_1000_1;
		@(posedge clk);
		
		// no Select and right box, no output
		@(posedge clk); {select, curBox, curPlayer} = 6'b0_0000_0;
		@(posedge clk);
		
		// Select and wrong right box, not output
		@(posedge clk); {select, curBox, curPlayer} = 6'b1_0001_0;
		@(posedge clk);
		
		// Select and right box, output should be 2
		@(posedge clk); {select, curBox, curPlayer} = 6'b1_0000_1;
		@(posedge clk);{select, curBox, curPlayer} = 6'b0_0000_1;
		
		
		@(posedge clk); reset = 1;
		@(posedge clk); reset = 0;
		
		// Select and right box, output should be 1
		@(posedge clk); {select, curBox, curPlayer} = 6'b1_0000_0;
		@(posedge clk);{select, curBox, curPlayer} = 6'b0_0000_1;
		
		@(posedge clk); reset = 1;
		@(posedge clk); reset = 0;
		@(posedge clk);
		$stop;
	end
	
endmodule  // boxSelector_tb