//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );


    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg rst;
	reg change;
	reg on_off;
	reg err;
	reg prev_counter_out;
	wire counter_out;

//Todo: Clock generation
	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

//Todo: User logic
	rst = 1;
	change = 0;
	on_off = 1;
	#(CLK_PERIOD*10)
	if (counter_out != 0) begin
		$display("***TEST FAILED! rst=%d, counter_out=%d", rst, counter_out);
		err = 1;
	end
	#(CLK_PERIOD*10)
	rst = 0;
	prev_counter_out = counter_out;
	#(CLK_PERIOD*10)
	change = 1;
	forever begin
		#(CLK_PERIOD*10)
		if (counter_out == prev_counter_out) begin
			%display("***TEST FAILED!");
			err = 1;
		end
		

	

		
    
//Todo: Finish test, check for success

//Todo: Instantiate counter module
	monitor top (
		.rst(rst),
		.change(change),
		.on_off(on_off),
		.clk(clk),
		.counter_out(counter_out)
		);
 
endmodule 
