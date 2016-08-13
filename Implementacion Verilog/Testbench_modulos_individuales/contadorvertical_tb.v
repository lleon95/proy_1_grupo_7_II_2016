`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:33 08/13/2016
// Design Name:   contadorvertical
// Module Name:   C:/Users/lleon/Desktop/Digitales/Debugger1/contadorvertical.v
// Project Name:  Debugger1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: contadorvertical
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module contadorvertical_tb;

	// Inputs
	reg Clk;
	reg Reset;

	// Outputs
	wire [19:0] cntVertical;
	wire VSync;

	// Instantiate the Unit Under Test (UUT)
	contadorvertical uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.cntVertical(cntVertical)
	);
	
	generadorVsync uut1(
		.cntVertical(cntVertical),
		.VSync(VSync)
		);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here	
		Reset = 0;

	end
	
	// Reloj de 50MHz
	always #10 Clk = ~Clk;
      
endmodule

