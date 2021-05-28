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
	reg [4:0] temperature;
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
	clk_p = 0;
	clk_n = 0;
	rst_n = 1;
	temperature = 5'd10;
	#(CLK_PERIOD*2)

	
	// check if heating is on at low temp
	if ((heating != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end
	
	

	forever begin
	// Start low

	temperature = 5'd16;
	#(CLK_PERIOD*2)

	
	// Check if only heating is on
	if ((heating != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end
	
	// edge case temp = 18
	temperature = 5'd18;
	#(CLK_PERIOD*2)

	
	// Check if only heating is on
	if ((heating != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Heating not on at low temp/Both on");
		err = 1;
	end

	// temp = 20
	temperature = 5'd20;
	#(CLK_PERIOD*2)

	if (heating != 0 && cooling != 0) begin
		$display("***TEST FAILED***One of them is on");
		err = 1;
	end

	//temp 22
	temperature = 5'd22;
	#(CLK_PERIOD*2)

	if ((cooling != 1) || (heating == 1 && cooling == 1)) begin
		$display("***TEST FAILED***Cooling not on at high temp/Both on");
		err = 1;
	end

	// temp 26
	temperature = 5'd26;
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
	
	AC_system top(
		.clk(clk),
		.temperature(temperature),
		.heating(heating),
		.cooling(cooling)
		);
	




endmodule
