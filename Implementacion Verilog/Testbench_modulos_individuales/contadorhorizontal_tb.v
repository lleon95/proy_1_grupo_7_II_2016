`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:12:03 08/13/2016
// Design Name:   contadorhorizontal
// Module Name:   C:/Users/lleon/Desktop/Digitales/Debugger1/contadorhorizontal_tb.v
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

module contadorhorizontal_tb;

	// Inputs
	reg Clk;
	reg Reset;

	// Outputs
	wire [10:0] cntHorizontal;
	wire HSync;

	// Instantiate the Unit Under Test (UUT)
	contadorhorizontal uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.cntHorizontal(cntHorizontal)
	);
	
	generadorHsync uut1 (
		.cntHorizontal(cntHorizontal),
		.HSync(HSync)
	);
	

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Soltar el Reset
		Reset = 0;
		
		//#34000 $finish;

	end
	
	always
	begin
		// Periodo de 20 ns para poder crear el reloj de 50MHz
		#10 Clk = ~Clk;
	end
      
endmodule

