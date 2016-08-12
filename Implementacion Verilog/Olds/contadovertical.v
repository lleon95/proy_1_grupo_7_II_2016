`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:50 08/06/2016 
// Design Name: 
// Module Name:    contadovertical 
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
module contadovertical(Clk, reset, cuenta);
	//entradas salidas
	input Clk, reset;
	//salidas
	output cuenta;
	reg [9:0] cuenta ;
	always @ (posedge Clk)
	begin
		//condicion de inicio
		if (reset) cuenta <= 10'b0;
		else
		begin
			//final de la cuenta
			if (cuenta == 525) cuenta <= 0;
			//aumento de la cuenta
			else cuenta <= cuenta +1;	
		end
	end

endmodule
