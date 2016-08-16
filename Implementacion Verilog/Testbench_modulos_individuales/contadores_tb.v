`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:18:05 08/16/2016
// Design Name:   contadorhorizontal
// Module Name:   C:/Users/lleon/Desktop/Digitales/Debugger1/contadores_tb.v
// Project Name:  Debugger1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: contadorhorizontal
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module contadores_tb;

	// Inputs
	reg Clk;
	reg Reset;

	// Outputs
	wire [10:0] cntHorizontal;
	wire [9:0] cntVertical;
	wire vflag;
	wire HSync;
	wire VSync;

	// Instantiate the Unit Under Test (UUT)
	contadorhorizontal uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.cntHorizontal(cntHorizontal), 
		.vflag(vflag)
	);
	
	contadorvertical uut0 (
		.Clk(Clk), 
		.Reset(Reset), 
		.cntVertical(cntVertical), 
		.vflag(vflag)
	);
	
	generadorHsync uut1(cntHorizontal,HSync);
	generadorVsync uut2(cntVertical,VSync);


	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Reset = 0;
		
	end
	
	always
		#10 Clk = ~Clk;
      
endmodule

