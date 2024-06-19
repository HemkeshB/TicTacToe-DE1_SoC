module counter3(
	input logic clk, reset,
	
	input logic win,
	output logic [2:0] count
	);
	
	always_ff @(posedge clk) begin
		if (reset)
			count <= 3'b0;
		else if (win)
			count <= count + 3'b001;
	end
	
endmodule  //counter3