//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/ 100ps

module LED(
	input clk,
	input rst,
	input button,
	output reg [2:0] colour
	);

	always @(posedge clk or button or posedge rst) begin
		if (rst)
			colour <= 3'b000;
		else begin
			if (colour == 3'b000 || 3'b111)
				colour <= 3'b001;
			else begin
			if (colour == 3'b001 && button)
				colour <= 3'b010;
			if (colour == 3'b010 && button)
				colour <= 3'b011;
			if (colour == 3'b011 && button)
				colour <= 3'b100;
			if (colour == 3'b100 && button)
				colour <= 3'b101;
			if (colour == 3'b101 && button)
				colour <= 3'b110;
			if (colour == 3'b110 && button)
				colour <= 3'b001;
			end
		end
	end
endmodule
