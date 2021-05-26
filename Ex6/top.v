//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps



module RGB_light(
	input clk,
	input [2:0] colour,
	input enable,
	output reg [23:0] rgb
	);

mybram your_instance_name (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea set to 0
  .addra(addra),  // input wire [3 : 0] addra your colour
  .dina(dina),    // input wire [15 : 0] dina set to 0
  .douta(douta)  // output wire [15 : 0] douta
);
	assign clka = clk;
	assign ena = enable;
	assign wea = 0;
	assign dina = 0;

	
	always @(posedge clka) begin
		if ena begin
			addra = colour;
			rgb = douta;

	end

endmodule

