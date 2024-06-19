module displayPlayer (
 input logic clk, reset,
 input logic win,
 input logic curPlayer,
 output logic [6:0] HEX
 );
 
 logic [2:0] player;
 // Logic to set the player number based on curPlayer
    always @(posedge clk) begin
        if (reset || win) 
            player <= 4'b000;
        else 
            player <= (curPlayer == 0) ? 4'b001 : 4'b010;
    end

    // Instantiate the 7-segment display module
    seg7 display(.bcd(player), .leds(HEX));

endmodule // displayPlayer