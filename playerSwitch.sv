module playerSwitch (
  input logic clk, reset,
  input logic select,

  output logic curPlayer
  );

  enum logic [1:1] {p_1 = 1'b1, p_0 = 1'b0} ps, ns;
  always @(*) begin
    ns = ps;
    case (ps)
      p_1: if (select) ns = p_0;
		p_0: if (select) ns = p_1;
	 endcase
	end
	 
	always @(posedge clk)
		if (reset)
			ps <= p_0;
		else
			ps <= ns;
	always @(*) begin
	   curPlayer = ps;
	end
endmodule  // playerSwitch
