
`timescale 1ns/ 100ps

module LED(
	input clk,
	input rst,
	input button,
	output reg [2:0] colour
	);

	always @(posedge clk or posedge rst) begin
		if (rst)
			colour <= 3'b000;
		else begin
			if (colour == 3'b000 || colour == 3'b111)
				colour <= 3'b001;
			else if (colour == 3'b001 && button)
				colour <= 3'b010;
			else if (colour == 3'b010 && button)
				colour <= 3'b011;
			else if (colour == 3'b011 && button)
				colour <= 3'b100;
			else if (colour == 3'b100 && button)
				colour <= 3'b101;
			else if (colour == 3'b101 && button)
				colour <= 3'b110;
			else if (colour == 3'b110 && button)
				colour <= 3'b001;
			
		end
	end
endmodule
