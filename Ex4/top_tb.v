//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/ 100ps

module top_tb(
	);

	parameter CLK_PERIOD = 6;
	
	reg clk;
	reg rst;
	reg button;
	reg err;
	wire [2:0] colour;

	//Clock generation
	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

	//Stimulus logic
	initial begin
	rst = 0;
	button = 0;
	err = 0;
	
		#(CLK_PERIOD*2)
		rst = 1;
		#(CLK_PERIOD)
		if (colour != 3'b000) begin
			$display("***TEST FAILED due to RESET***");
			err = 1;
		end

		rst = 0;
		forever begin
		#(CLK_PERIOD)


		if (colour != 3'b001) begin
			$display("***TEST FAILED***");
			err = 1;
		end
		
		button = 1;
		#(CLK_PERIOD)

		if (colour != 3'b010) begin
			$display("***TEST FAILED***");
			err = 1;
		end

		#(CLK_PERIOD)

		if (colour != 3'b011) begin
			$display("***TEST FAILED***");
			err = 1;
		end

		#(CLK_PERIOD)

		if (colour != 3'b100) begin
			$display("***TEST FAILED***");
			err = 1;
		end

		#(CLK_PERIOD)

		if (colour != 3'b101) begin
			$display("***TEST FAILED***");
			err = 1;
		end

		#(CLK_PERIOD)

		if (colour != 3'b110) begin
			$display("***TEST FAILED***");
			err = 1;
		end
		
		end
	end

	initial begin
	#200
	if (err==0)
		$display("***TEST PASSED***");
		$finish;
	end

	// Instantiate testing module
	LED top(
		.clk(clk),
		.rst(rst),
		.button(button),
		.colour(colour)
		);

endmodule

		
		





