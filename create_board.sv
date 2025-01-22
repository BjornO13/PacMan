module create_board (clk, gameover, x, y, back_on);
	
	input logic clk, gameover;
	input logic [9:0] x;
	input logic [8:0] y;
	output logic back_on;
	
	logic [4:0] board_x;
	logic [4:0] board_y;
	logic [20:0] row_pixels;
	logic color;
	
	GameBoard board (board_y, clk, row_pixels);
	
	// logic for where the current pixel is
	always_comb begin
		board_x = ((x-100)/21);
		board_y = ((y-9)/21);
	end
	
	// should pixel be blue
	assign color = row_pixels[board_x];
	
	// is this pixel on the game board and what color is it
	always_comb begin
		if (color & (x > 100) & (y > 9) & ~gameover) begin
			back_on = 1;
		end
		else begin
			back_on = 0;
		end
	end
	
endmodule 