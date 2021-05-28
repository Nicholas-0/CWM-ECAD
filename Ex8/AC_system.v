
`timescale 1ns / 100ps

module AC_system(
	input clk,
	input [4:0] temperature,
	output reg heating,
	output reg cooling
	);

	always @(posedge clk) begin
		if (temperature <= 5'd18) begin
			heating = 1;
			cooling = 0;
		end
		else if (temperature > 5'd18 && temperature < 5'd22) begin
			heating = 0;
			cooling = 0;
		end
		else begin
			heating = 0;
			cooling = 1;
		end
	end
		 
endmodule
