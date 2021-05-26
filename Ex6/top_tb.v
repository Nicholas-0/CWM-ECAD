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
	reg err;
	reg [23:0] current;
	wire [23:0] rgb;
	
	// Clock generation
	initial begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	// Stimulus logic
	initial begin
	err = 0;
	enable = 0;
	current = 24'b0;
	colour = 3'b000;
	#(CLK_PERIOD)
	
	if (rgb != current) begin
		$display("***TEST FAILED***When disabled rgb is not 24'b0");
		err = 1;
	end



	forever begin
		enable = 1;

		// Check each of them one by one
		colour = 3'b000;
		current = 24'b0;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end

		colour = 3'b001;
		current = 24'h0000FF;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end

		colour = 3'b010;
		current = 24'h00FF00;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end

		colour = 3'b011;
		current = 24'h00FFFF;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end

		colour = 3'b100;
		current = 24'hFF0000;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end

		colour = 3'b101;
		current = 24'hFF00FF;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end

		colour = 3'b110;
		current = 24'hFFFF00;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end

		colour = 3'b111;
		current = 24'hFFFFFF;
		#(CLK_PERIOD*2)
		
		if (rgb != current) begin
			$display("***TEST FAILED***rgb doesn't output the right value");
			err = 1;
		end
	end
	
	end

	initial begin
	#400
	if (err==0) begin
		$display("***TEST PASSED***");
		$finish;
	end
	
	end
	
	RGB_light top(
		.clk(clk),
		.colour(colour),
		.enable(enable),
		.rgb(rgb)
		);



endmodule

	
