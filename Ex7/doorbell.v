
`timescale 1ns / 100ps

module doorbell(
    //Todo: define inputs here
	input [23:0] a,
	input [23:0] b,
	input sel,
	output [23:0] out
    );
    
    //Todo: define registers and wires here
	reg out;
	wire a;
	wire b;
	wire sel;

	always @(*) begin
		// out gets b when sel is 1
		if (sel) #(5) out = b;
		// otherwise out gets a
		else #(5) out = a;
	end                
      
endmodule
