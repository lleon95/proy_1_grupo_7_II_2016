`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:40:20 08/14/2016
// Design Name:   divisor1600
// Module Name:   C:/Users/lleon/Desktop/Digitales/Debugger1/divisor1600_tb.v
// Project Name:  Debugger1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divisor1600
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divisor1600_tb;

	// Inputs
	reg [19:0] cntVertical;
	// Outputs
	wire [9:0] posVertical;

	// Instantiate the Unit Under Test (UUT)
	divisor1600 uut (
		.cntVertical(cntVertical), 
		.posVertical(posVertical)
	);

	initial begin
		// Initialize Inputs
		cntVertical = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always
	begin
	#10;
		if(cntVertical == 840000) cntVertical = 0;
		else cntVertical = cntVertical + 1;
	end
      
endmodule

