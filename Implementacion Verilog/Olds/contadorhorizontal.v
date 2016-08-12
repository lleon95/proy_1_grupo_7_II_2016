`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:11 08/06/2016 
// Design Name: 
// Module Name:    contadorhorizontal 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module contadorhorizontal(Clk, reset, cuenta);
	//entradas
	input Clk, reset;
	//salida
	output cuenta;
	reg [9:0] cuenta;
	always @ (posedge Clk)
	begin
		// Condición de reset
		if (reset)
		begin
			cuenta <= 10'd0;
		end
		else
		// Contar de forma ascendente
		begin
			//final de la cuenta
			if (cuenta == 800) cuenta <= 0;
			//aumento de la cuenta
			else cuenta <= cuenta + 1;
		end
	end

endmodule

