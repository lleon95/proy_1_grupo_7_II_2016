`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:53 08/06/2016 
// Design Name: 
// Module Name:    memoria 
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
module memoria(Posx,Posy,blank,letra,Clk,reset);
	//entradas
	input Clk,reset;
	input [9:0] Posx;
	input [9:0] Posy;
	//salidas
	output blank, letra;
	reg blank, letra;
	always @(negedge Clk)
	begin
		//condiciones de inicio
		if(reset)
		begin
			blank <=0;
			letra <=0; 
		end
		//posiciones de blank (espacios donde no se pinta)
		else if(Posx >= 640 || Posx <= 48 || Posy >= 480 || Posy <= 33)	blank <=1;
		//posiciones de las letras
		else if(Posx ==400 && Posy == 260) letra <=1;
		else
		//si no se encuentra en las posiciones de las letras o del blank
		begin
			blank <=0;
			letra <=0;
		end
	end
endmodule
