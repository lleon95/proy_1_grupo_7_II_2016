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
module controldecroma(TC,UP,down,reset,LP,ColorL,ColorP,ton,Clk);
	//entradas
	input TC,LP,UP,down,reset,Clk;
	//salidas
	output ton,ColorL,ColorP;
	reg[7:0] ton;
	reg[2:0] ColorL;
	reg[2:0] ColorP;
	always @(posedge Clk)
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
			if(TC == 1)
			begin
				//aumneto de tono siempre y cuando no esta al maximo
				if(UP)
					begin
						case (ton)
							8'b01001111: ton<=8'b01010001;
							8'b01010111: ton<=8'b01011001;
							8'b01011111: ton<=8'b01100001;
							8'b01100111: ton<=8'b01101001;
							8'b01101111: ton<=8'b01110001;
							8'b01110111: ton<=8'b01111001;
							8'b01111111: ton<=8'b10001001;
							8'b10001111: ton<=8'b10010001;
							8'b10010111: ton<=8'b10011001;
							8'b10011111: ton<=8'b10100001;
							8'b10100111: ton<=8'b10101001;
							8'b10101111: ton<=8'b10110001;
							8'b10110111: ton<=8'b10111001;
							8'b10111111: ton<=8'b11001001;
							8'b11001111: ton<=8'b11010001;
							8'b11010111: ton<=8'b11011001;
							8'b11011111: ton<=8'b11100001;
							8'b11100111: ton<=8'b11101001;
							8'b11101111: ton<=8'b11110001;
							8'b11110111: ton<=8'b11111001;
							8'b11111111: ton<=8'b11111111;
							default ton=ton+1;
						endcase
					end
				//disminucion del siempre y cuando no se encuente en el minimo
				else if(down)
					begin
						case (ton)
							8'b01001001: ton<=8'b01001001;
							8'b01010001: ton<=8'b01001111;
							8'b01011001: ton<=8'b01010111;
							8'b01100001: ton<=8'b01011111;
							8'b01101001: ton<=8'b01100111;
							8'b01110001: ton<=8'b01101111;
							8'b01111001: ton<=8'b01110111;
							8'b10001001: ton<=8'b01111111;
							8'b10010001: ton<=8'b10001111;
							8'b10011001: ton<=8'b10010111;
							8'b10100001: ton<=8'b10011111;
							8'b10101001: ton<=8'b10100111;
							8'b10110001: ton<=8'b10101111;
							8'b10111001: ton<=8'b10110111;
							8'b11001001: ton<=8'b10111111;
							8'b11010001: ton<=8'b11001111;
							8'b11011001: ton<=8'b11010111;
							8'b11100001: ton<=8'b11011111;
							8'b11101001: ton<=8'b11100111;
							8'b11110001: ton<=8'b11101111;
							8'b11111001: ton<=8'b11110111;
							default ton=ton-1;
						endcase
					end
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
