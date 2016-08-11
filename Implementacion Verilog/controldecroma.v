`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:06 08/07/2016 
// Design Name: 
// Module Name:    controldecroma 
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
module controldecroma(TC,UP,down,reset,LP,ColorL,ColorP,ton);
	//entradas
	input TC,LP,UP,down,reset;
	//salidas
	output ton,ColorL,ColorP;
	reg[7:0] ton;
	reg[2:0] ColorL;
	reg[2:0] ColorP;
	always @*
	begin
		//condiciones de inicio
		if(reset)
		begin
			ton <= 8'b10100100;
			ColorL<= 3'b000;
			ColorP<= 3'b111;
		end
		else
		begin
			//si se quiere cambiar el tono de la pantalla
			if(TC)
			begin
				//aumneto de tono siempre y cuando no esta al maximo
				if(UP && ton != 8'b11111111)ton<=ton+1;
				//disminucion del siempre y cuando no se encuente en el minimo
				else if(down && ton != 0)ton<=ton-1;
			end
			//si se quiere cambiar el color de las letras o la pantalla
			else
			begin
				//cambio del color de las letras
				if(LP)
					begin
						//aumento del color de las letras simpre que no este en el maximo
						if(UP && ColorL != 3'b111) ColorL<=ColorL+1;
						//disminucion del color de las letras siempre que no este en el minimo
						else if(down && ColorL != 0) ColorL<=ColorL-1;
					end
				//cambio del color de la pantalla
				else
					begin
						//aumento del color de la pantalla simpre que no este en el maximo
						if(UP && ColorP != 3'b111)ColorP<=ColorP+1;
						//disminucion del color de la pantalla siempre que no este en el minimo
						else if(down && ColorP != 0)ColorP<=ColorP-1;
					end
			end
		end
	end
endmodule
