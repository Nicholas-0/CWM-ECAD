//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);
	
	parameter CLK_PERIOD = 6;
	
	reg clk;
	reg [2:0] colour;
	reg enable;
	wire [23:0] rgb;
	
	// Clock generation
	initial begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	// Stimulus logic
	initial begin
	


	end

endmodule

	
