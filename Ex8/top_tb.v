//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);

	parameter CLK_PERIOD = 6;
	
	reg clk_p;
	reg clk_n;
	reg rst_n;
	reg temperature_0;
	reg temperature_1;
	reg temperature_2;
	reg temperature_3;
	reg temperature_4;
	reg err;
	wire heating;
	wire cooling;


	//Clock generation
	initial begin
	clk = 1'b0;
	clk_p = 1'b0;
	clk_n = 1'b1;
	forever begin

		#(CLK_PERIOD/2)
		clk=~clk;
		clk_p=~clk_p;
		clk_n=~clk_n;
		
	end

	end
	
	

	// Stimulus logic
	initial begin
	err = 0;
	rst_n = 0;
	// temperature = 10
	temperature_0 = 0;
	temperature_1 = 1;
	temperature_2 = 0;
	temperature_3 = 1;
	temperature_4 = 0;
	#(CLK_PERIOD*2)

	
	// check if heating is on at low temp
	if ((heating != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end
	
	

	forever begin
	// Start low
	
	// temperature = 16
	temperature_0 = 0;
	temperature_1 = 0;
	temperature_2 = 0;
	temperature_3 = 0;
	temperature_4 = 1;
	#(CLK_PERIOD*2)

	
	// Check if only heating is on
	if ((heating != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end
	
	// edge case temp = 18
	temperature_0 = 0;
	temperature_1 = 1;
	temperature_2 = 0;
	temperature_3 = 0;
	temperature_4 = 1;
	#(CLK_PERIOD*2)

	
	// Check if only heating is on
	if ((heating != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end

	// temp = 20
	temperature_0 = 0;
	temperature_1 = 0;
	temperature_2 = 1;
	temperature_3 = 0;
	temperature_4 = 1;
	#(CLK_PERIOD*2)

	if (heating != 0 && cooling != 0) begin
		$display("***TEST FAILED***One of them is on");
		err = 1;
	end

	//temp 22
	temperature_0 = 0;
	temperature_1 = 1;
	temperature_2 = 1;
	temperature_3 = 0;
	temperature_4 = 1;
	#(CLK_PERIOD*2)

	if ((cooling != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Cooling not on at high temp/Both on");
		err = 1;
	end

	// temp 26
	temperature_0 = 0;
	temperature_1 = 1;
	temperature_2 = 0;
	temperature_3 = 1;
	temperature_4 = 1;
	#(CLK_PERIOD*2)


	if ((cooling != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Cooling not on at high temp/Both on");
		err = 1;
	end

	end
	
	end
    
	
	initial begin
	#400
	if (err==0)
		$display("***TEST PASSED***");
		$finish;
	end
	
	mysys top(
		.clk_p(clk_p),
		.clk_n(clk_n),
		.rst_n(rst_n),
		.temperature_0(temperature_0),
		.temperature_1(temperature_1),
		.temperature_2(temperature_2),
		.temperature_3(temperature_3),
		.temperature_4(temperature_4),
		.heating(heating),
		.cooling(cooling)
		);
	




endmodule
