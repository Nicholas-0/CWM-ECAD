//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/ 100ps

module top_tb(
	);

	parameter CLK_PERIOD = 6;
	
	reg clk;
	reg[4,0] temperature;
	reg err;
	wire heating;
	wire cooling;

	//Clock generation
	initial begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	// Stimulus logic
	initial begin
	err = 0;
	// Start low
	temperature = 16;
	#(CLK_PERIOD)
	
	// Check if only heating is on
	if ((heating != 1) or (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end
	
	// edge case temp = 18
	temperature = 18;
	#(CLK_PERIOD)
	
	// Check if only heating is on
	if ((heating != 1) or (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end

	// temp = 20
	temperature = 20;
	#(CLK_PERIOD)
	if (heating != 0 && cooling != 0) begin
		$display("***TEST FAILED***One of them is on");
		err = 1;
	end

	//temp 22
	temperature = 22;
	#(CLK_PERIOD)

	if ((cooling != 1) or (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Cooling not on at high temp/Both on");
		err = 1;
	end

	// temp 26
	temperature = 26;
	#(CLK_PERIOD)

	if ((cooling != 1) or (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Cooling not on at high temp/Both on");
		err = 1;
	end


	

	
	
