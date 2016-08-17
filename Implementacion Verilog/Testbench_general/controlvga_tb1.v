`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:09:01 08/17/2016
// Design Name:   controlvga_principal
// Module Name:   C:/Users/lleon/Desktop/Digitales/Debugger1/controlvga_tb1.v
// Project Name:  Debugger1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlvga_principal
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlvga_tb1;

	// Inputs
	reg Clock;
	reg reset;
	reg Up;
	reg Down;
	reg TC;
	reg Lp;

	// Outputs
	wire [1:0] Azul;
	wire [2:0] Verde;
	wire [2:0] Rojo;
	wire Hsinc;
	wire Vsinc;

	// Instantiate the Unit Under Test (UUT)
	controlvga_principal uut (
		.Clock(Clock), 
		.reset(reset), 
		.Up(Up), 
		.Down(Down), 
		.TC(TC), 
		.Lp(Lp), 
		.Azul(Azul), 
		.Verde(Verde), 
		.Rojo(Rojo), 
		.Hsinc(Hsinc), 
		.Vsinc(Vsinc)
	);

	initial begin
		// Initialize Inputs
		Clock = 0;
		reset = 1;
		Up = 0;
		Down = 0;
		TC = 0;
		Lp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Iniciar
		reset = 0;
		
		/*
			Datos por defecto
		*/
		
		// Esperar 50ms con datos iniciales
		#50000000;
		
		/*
			Comenzar a variar
		*/
		
		// Cambiar tono
		TC = 1;
		Up = 1;
		// Esperar 200ns
		#200;
		// Soltar entradas
		TC = 0;
		Up = 0;
		// Esperar 50ms con datos alterados
		#50000000;
		// Cambiar tono
		Lp = 1;
		Up = 1;
		// Esperar 200ns
		#200;
		// Soltar entradas
		Lp = 0;
		Up = 0;
		// Esperar 50ms con datos alterados
		#50000000;
		// Cambiar tono
		TC = 1;
		Down = 1;
		// Esperar 200ns
		#200;
		// Soltar entradas
		TC = 0;
		Down = 0;
		// Esperar 50ms con datos alterados
		#50000000;
		// Cambiar tono
		Lp = 1;
		Down = 1;
		// Esperar 200ns
		#200;
		// Soltar entradas
		Lp = 0;
		Down = 0;
		// Esperar 50ms con datos alterados
		#50000000;
		
		
		/*
			Reset
		*/
		reset = 1;
		
		
	end
      
		
	// Generador del reloj
	always
	begin
		#10 Clock = ~Clock;
	end
		
endmodule

