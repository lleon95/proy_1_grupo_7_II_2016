`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:02:02 08/13/2016
// Design Name:   divisorpor2
// Module Name:   C:/.Xilinx/divisorpor2/divisorpor2_tb.v
// Project Name:  divisorpor2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divisorpor2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divisorpor2_tb;

	// Inputs
	reg [10:0] incont;

	// Outputs
	wire [9:0] cuenta;

	// Instantiate the Unit Under Test (UUT)
	divisorpor2 uut (
		.incont(incont), 
		.cuenta(cuenta)
	);

	initial begin
		#1 incont = 4;
		#10 incont=8;

		
	end
      
endmodule

