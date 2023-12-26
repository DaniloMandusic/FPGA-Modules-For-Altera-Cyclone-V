module Result (
	input clk,
	input rst,
	input one,
	input two,
	input three,
	input team,
	output [6:0] home,
	output [6:0] away
);

reg [6:0] home_next, home_reg;
reg [6:0] away_next, away_reg;

assign home = home_reg;
assign away = away_reg;

always @(posedge clk, posedge rst) begin
	if (rst) begin
		home_reg <= 7'h00;
		away_reg <= 7'h00;
	end
	else begin
		home_reg <= home_next;
		away_reg <= away_next;
	end
end

always @(*) begin
	home_next = home_reg;
	away_next = away_reg;
	if (team) begin
		if (one)
			away_next = away_reg + 1'b1;
		else if (two)
			away_next = away_reg + 2'b10;
		else if (three)
			away_next = away_reg + 2'b11;
	end
	else begin
		if (one)
			home_next = home_reg + 1'b1;
		else if (two)
			home_next = home_reg + 2'b10;
		else if (three)
			home_next = home_reg + 2'b11;
	end
end

endmodule
