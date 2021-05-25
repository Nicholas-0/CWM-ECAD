//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module AC_system(
	input clk,
	input[4:0] temperature,
	output heating,
	output cooling
	);

	always @(posedge clk) begin
		if (temperature <= 18) begin
			heating = 1;
			cooling = 0;
		end
		else if (18 < temperature < 22) begin
			heating = 0;
			cooling = 0;
		end
		else if (temperature >= 22) begin
			heating = 0;
			cooling = 1;
		end
		 
endmodule


		
