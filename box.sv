module box (
  input logic clk, reset,
  input logic select, curPlayer,

  output logic [1:0] boxVal
  );

  enum logic [1:0] {p_1 = 2'b10, p_0 = 2'b01, p_n = 2'b0} ps, ns;
  always @(*) begin
    case (ps)
      p_n: if (select && !curPlayer) ns = p_0;
					else if (select && curPlayer) ns = p_1;
					else ns = p_n;
		p_0: ns = p_0;
		p_1: ns = p_1;
		default: ns = p_n;
	 endcase
	end
	 
	always @(posedge clk)
		if (reset)
			ps <= p_n;
		else
			ps <= ns;
	always @(*) begin
	   boxVal = ps;
	end
endmodule  // box
