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
	reg[7:0] prev_counter_out;
	wire[7:0] counter_out;

//Todo: Clock generation
	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

//Todo: User logic
	initial begin
	rst = 1;
	change = 0;
	err = 0;
	on_off = 1;
	#(CLK_PERIOD)
		
	forever begin
	// Check that rst works
	if ((rst==1) && ~(counter_out == 0)) begin
		$display("***TEST FAILED! Rst is 1 but counter_out is not 0");
		err = 1;
	end

	#(CLK_PERIOD*2)
	rst = 0;
	#(CLK_PERIOD*2)
	prev_counter_out = counter_out;
	#(CLK_PERIOD)
	
	// Check that change works
	if ((change == 0) && ~(counter_out==prev_counter_out)) begin
		$display("***TEST FAILED! Change is 0 but counter_out isn't constant");
		err = 1;
	end

	change = 1;
	#(CLK_PERIOD*2)
	
	
	// prevent counter_out being negative
	if (counter_out < 0) on_off = 1;
	#(CLK_PERIOD*2)
	#(CLK_PERIOD*2)

	prev_counter_out = counter_out;
	#(CLK_PERIOD)
	

	if ((change==1) && (counter_out == prev_counter_out)) begin
		$display("***TEST FAILED! Change is 1 but counter_out is constant");
		err = 1;
	end

	on_off = 0;
	#(CLK_PERIOD*2)
	prev_counter_out = counter_out;
	#(CLK_PERIOD*2)
	
	// Check that on_off == 0 is working
	if ((change==1) && (on_off == 0) && (counter_out > prev_counter_out))
		begin
		$display("***TEST FAILED! On_off is 0 but counter_out is increasing");
		err = 1;
	end
	
	// Check that on_off == 1 is working
	if ((change==1) && (on_off == 1) && (counter_out < prev_counter_out)) begin
		$display("***TEST FAILED! On_off is 1 but counter_out is decreasing");
		err = 1;
	end

	
	end

	end
	
		

	

		
    
//Todo: Finish test, check for success
	initial begin
	#500
	if (err==0) begin
		$display("***TEST PASSED***");
		$finish;
		
	end
		
	end

//Todo: Instantiate counter module
	monitor top (
		.rst(rst),
		.change(change),
		.on_off(on_off),
		.clk(clk),
		.counter_out(counter_out)
		);
 
endmodule 
