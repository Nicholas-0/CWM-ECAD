//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);
	
	parameter CLK_PERIOD = 6;

	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg err;
	wire [23:0] light;

	// Clock generation
	initial begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	// Stimulus logic
	initial begin
	err = 0;
	rst = 1;
	button = 0;
	sel = 0;
	#(CLK_PERIOD*2)
	
	// test that sel = 0 works
	if (light != 24'hFFFFFF) begin
		$display("***TEST FAILED***Light is not {255,255,255} when sel = 0");
		err = 1;
	end
	
	// test that rst works
	sel = 1;
	rst = 1;
	#(CLK_PERIOD*2)
	if ((sel == 1) && (rst == 1) && (light != 24'b0)) begin
		$display("***TEST FAILED***Reset doesn't work");
		err = 1;
	end

	forever begin
	sel = 1;
	rst = 0;
	button = 1;
	#(CLK_PERIOD)

	if (light != 24'h0000FF) begin
			$display("***TEST FAILED***");
			err = 1;
	end
	
	#(CLK_PERIOD)
	if (light != 24'h00FF00) begin
			$display("***TEST FAILED***");
			err = 1;
	end

	#(CLK_PERIOD)
	if (light != 24'h00FFFF) begin
			$display("***TEST FAILED***");
			err = 1;
	end

	#(CLK_PERIOD)
	if (light != 24'hFF0000) begin
			$display("***TEST FAILED***");
			err = 1;
	end

	#(CLK_PERIOD)
	if (light != 24'hFF00FF) begin
			$display("***TEST FAILED***");
			err = 1;
	end

	#(CLK_PERIOD)
	if (light != 24'hFFFF00) begin
			$display("***TEST FAILED***");
			err = 1;
	end

	#(CLK_PERIOD)
	if (light != 24'hFFFFFF) begin
			$display("***TEST FAILED***");
			err = 1;
	end

	end 

	end



	initial begin
	#500
	if (err==0) begin
		$display("***TEST PASSED***");
		$finish;
	end
	
	end

	Lights_selector top(
		.clk(clk),
		.sel(sel),
		.rst(rst),
		.button(button),
		.light(light)
	);

endmodule
	
	
	
	
