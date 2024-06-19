// Top-level module that defines the I/Os for the DE-1 SoC board
module tictactoe (HEX0, HEX1, HEX2, HEX4, HEX5, KEY, SW, GPIO_1, CLOCK_50);
    output logic [6:0]  HEX0, HEX1, HEX2, HEX4, HEX5;
    input  logic [3:0]  KEY;
    input  logic [9:0]  SW;
    output logic [35:0] GPIO_1;
    input logic CLOCK_50;
	 
	 
	 /* Set up system base clock to 1526 Hz (50 MHz / 2**(14+1))
	    ===========================================================*/
	 logic [31:0] clk;
	 logic SYSTEM_CLOCK;
	 
	 clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));
	 
	 assign SYSTEM_CLOCK = CLOCK_50; // 1526 Hz clock signal	 
	 
	 /* If you notice flickering, set SYSTEM_CLOCK faster.
	    However, this may reduce the brightness of the LED board. */
	
	 
	 /* Set up LED board driver
	    ================================================================== */
	 logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
    logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	 logic RST;                   // reset - toggle this on startup
	 
	 assign RST = SW[9];
	 
	 /* Standard LED Driver instantiation - set once and 'forget it'. 
	    See LEDDriver.sv for more info. Do not modify unless you know what you are doing! */
	 LEDDriver Driver (.CLK(SYSTEM_CLOCK), .RST, .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);
	 
	 
	 /* LED board test submodule - paints the board with a static pattern.
	    Replace with your own code driving RedPixels and GrnPixels.
		 
	 	 SW9      : Reset
		 =================================================================== */
	logic key0_s, key1_s, key2_s, key3_s;
	logic key0_ss, key1_ss, key2_ss, key3_ss; 
	logic next, select, skip_s, game_reset;
	logic curPlayer; 
	logic [1:0] win;
	logic [1:0] out0, out1, out2, out3, out4, out5, out6, out7, out8;
	logic [3:0] curBox;
	
	
	// input cleaning
	
	synch ff01(.clk(SYSTEM_CLOCK), .reset(RST), .in(~KEY[0]), .out(key0_s));
	synch ff02(.clk(SYSTEM_CLOCK), .reset(RST), .in(key0_s), .out(key0_ss));
	synch ff11(.clk(SYSTEM_CLOCK), .reset(RST), .in(~KEY[1]), .out(key1_s));
	synch ff12(.clk(SYSTEM_CLOCK), .reset(RST), .in(key1_s), .out(key1_ss));
	synch ff21(.clk(SYSTEM_CLOCK), .reset(RST), .in(~KEY[2]), .out(key2_s));
	synch ff22(.clk(SYSTEM_CLOCK), .reset(RST), .in(key2_s), .out(key2_ss));
	synch ff31(.clk(SYSTEM_CLOCK), .reset(RST), .in(~KEY[3]), .out(key3_s));
	synch ff32(.clk(SYSTEM_CLOCK), .reset(RST), .in(key3_s), .out(key3_ss));

	userInput s(.clk(SYSTEM_CLOCK), .reset(RST), .in(key3_ss), .out(select));
	userInput n(.clk(SYSTEM_CLOCK), .reset(RST), .in(key0_ss), .out(next));
	userInput skip(.clk(SYSTEM_CLOCK), .reset(RST), .in(key2_ss), .out(skip_s));
	userInput clear(.clk(SYSTEM_CLOCK), .reset(RST), .in(key1_ss), .out(clear_s));
	
	assign game_reset = (SW[0] && win != 2'b0) || clear_s;
	
	// Current player
	playerSwitch pS(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select || skip_s), .curPlayer);
	
	// Which box we are on
	boxSelector bS(.clk(SYSTEM_CLOCK), .reset(RST || game_reset || select || win[1] || win[0]), .out0, .out1, .out2, .out3, .out4, .out5, .out6, .out7, .out8, .next, .GrnPixels, .curBox);	
	
	// 3x3 grid status
	box b0(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 0), .curPlayer(curPlayer), .boxVal(out0));
   box b1(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 1), .curPlayer(curPlayer), .boxVal(out1));
   box b2(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 2), .curPlayer(curPlayer), .boxVal(out2));
   box b3(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 3), .curPlayer(curPlayer), .boxVal(out3)); 
   box b4(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 4), .curPlayer(curPlayer), .boxVal(out4));
   box b5(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 5), .curPlayer(curPlayer), .boxVal(out5));
   box b6(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 6), .curPlayer(curPlayer), .boxVal(out6));
   box b7(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 7), .curPlayer(curPlayer), .boxVal(out7));
   box b8(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .select(select && curBox == 8), .curPlayer(curPlayer), .boxVal(out8));
	
	// Red led for X and O
	gamePieces gp(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .out0, .out1, .out2, .out3, .out4, .out5, .out6, .out7, .out8, .RedPixels);
	
	// Winner is display once game is finished
	victory v(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .out0, .out1, .out2, .out3, .out4, .out5, .out6, .out7, .out8, .HEX0(HEX4), .win);
	// Current player is displayed
	displayPlayer dp(.clk(SYSTEM_CLOCK), .reset(RST || game_reset), .win(win[1] || win[0]), .curPlayer, .HEX(HEX5));
	
	// Scores for eah players win or draw
	
	playerScores ones(.clk(SYSTEM_CLOCK), .reset(RST), .victor(win[0]), .HEX(HEX1));

	playerScores twos(.clk(SYSTEM_CLOCK), .reset(RST), .victor(win[1]), .HEX(HEX2));
	
	playerScores draws(.clk(SYSTEM_CLOCK), .reset(RST), .victor(win[1] && win[0]), .HEX(HEX0));
	
	
	 
endmodule