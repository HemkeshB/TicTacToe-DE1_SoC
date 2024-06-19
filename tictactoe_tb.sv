module tictactoe_tb();
	logic [6:0] HEX0, HEX1, HEX2, HEX4, HEX5;
	logic [9:0] SW;
	logic [3:0] KEY;
	logic [35:0] GPIO_1;
	logic clk;
	
	tictactoe dut(.HEX0, .HEX1, .HEX2, .HEX4, .HEX5, .KEY, .SW, .GPIO_1, .CLOCK_50(clk));
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		
		integer i;
		
		@(posedge clk); SW[9] <= 1;
		@(posedge clk); SW[9] <= 0;
		
		@(posedge clk); KEY[3] <= 1;// player 1 selects
		@(posedge clk); KEY[3] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		@(posedge clk); KEY[0] <= 1; //player 2 moves twice
		@(posedge clk); KEY[0] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[0] <= 1;
		@(posedge clk); KEY[0] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[3] <= 1;// player 2 selects
		@(posedge clk); KEY[3] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[3] <= 1;// player 1 selects
		@(posedge clk); KEY[3] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[0] <= 1; //player 2 moves once
		@(posedge clk); KEY[0] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[3] <= 1;// player 2 selects
		@(posedge clk); KEY[3] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[3] <= 1;// player 1 selects
		@(posedge clk); KEY[3] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[3] <= 1;// player 1 selects
		@(posedge clk); KEY[3] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk); KEY[0] <= 1; //player 2 moves once
		@(posedge clk); KEY[0] <= 0;
		@(posedge clk);
		@(posedge clk); KEY[0] <= 1; //player 2 moves once
		@(posedge clk); KEY[0] <= 0;
		@(posedge clk);
		@(posedge clk); KEY[3] <= 1;// player 1 selects
		@(posedge clk); KEY[3] <= 0;
		@(posedge clk);
		@(posedge clk); KEY[2] <= 1;// player switch
		@(posedge clk); KEY[2] <= 0;
		@(posedge clk);
		@(posedge clk); KEY[1] <= 1;// game reset
		@(posedge clk); KEY[1] <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
   	@(posedge clk);
		$stop;
	end
		
		
endmodule  // tugOfWar_tb
