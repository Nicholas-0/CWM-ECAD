
`timescale 1ns / 100ps

module doorbell(
    //Todo: define inputs here
	input a,
	input b,
	input sel,
	output out
    );
    
    //Todo: define registers and wires here
	reg [23:0] out;
	wire [23:0] a;
	wire [23:0]b;
	wire sel;

	always @(*) begin
		// out gets b when sel is 1
		if (sel) out = b;
		// otherwise out gets a
		else out = a;
	end                
      
endmodule
