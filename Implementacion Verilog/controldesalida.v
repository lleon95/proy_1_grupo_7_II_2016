`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:25 08/07/2016 
// Design Name: 
// Module Name:    controldesalida 
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
module controldesalida(clk,ColorP,ColorL,ton,azul,rojo,verde,letra,blank);
	//entradas
	input clk,letra,blank;
	input[2:0] ColorP;
	input[2:0] ColorL;
	input[7:0] ton;
	//salidas
	output azul,rojo,verde;
	reg[1:0] azul;
	reg[2:0] rojo;
	reg[2:0] verde;
	always@(posedge clk)
	begin
		//si no es un espacio en blanco de la pantalla
		if(~blank)
			begin
				//si se debe pintar una letra
				if(letra)
				begin
					//si se quiere el color azul en la combinacion de colore
					if(ColorL[2])
						begin
							azul[1]<=ton[7];
							azul[0]<=ton[6];
						end
					//si no se desea el color azul en la combinacion de colores
					else
						begin
							azul[1]<=0;
							azul[0]<=0;
						end
					//si se quiere el color verde en la combinacion de colores
					if(ColorL[1])
						begin
							verde[2]<=ton[5];
							verde[1]<=ton[4];
							verde[0]<=ton[3];
						end
					//sino se quiere el color verde en la combinacion de colores
					else
						begin
							verde[2]<=0;
							verde[1]<=0;
							verde[0]<=0;
						end
					//si se quiere el color rojo en la combinacion de colores
					if(ColorL[0])
						begin
							rojo[2]<=ton[2];
							rojo[1]<=ton[1];
							rojo[0]<=ton[0];
						end
					//sino se quiere el color rojo en la combinacion de colores	
					else				
						begin
							rojo[2]<=0;
							rojo[1]<=0;
							rojo[0]<=0;
						end
				end
				//si se desea imprimir la pantalla
				else
				begin
					//si se quiere el color azul en la combinacion de colores	
					if(ColorP[2])
						begin
							azul[1]<=ton[7];
							azul[0]<=ton[6];
						end
					//sino se quiere el color azul en la combinacion de colores	
					else
						begin
							azul[1]<=0;
							azul[0]<=0;
						end
					//si se quiere el color verde en la combinacion de colores	
					if(ColorP[1])
					begin
						verde[2]<=ton[5];
						verde[1]<=ton[4];
						verde[0]<=ton[3];
					end
					//sino se quiere el color verde en la combinacion de colores	
					else
						begin
							verde[2]<=0;
							verde[1]<=0;
							verde[0]<=0;
						end
					//si se quiere el color rojo en la combinacion de colores	
					if(ColorP[0])
						begin
								rojo[2]<=ton[2];
								rojo[1]<=ton[1];
								rojo[0]<=ton[0];
						end
					//sino se quiere el color rojo en la combinacion de colores	
					else
						begin
							rojo[2]<=0;
							rojo[1]<=0;
							rojo[0]<=0;
						end
				end
			end
		else
		begin
			azul[1]<=0;
			azul[0]<=0;
			verde[2]<=0;
			verde[1]<=0;
			verde[0]<=0;
			rojo[2]<=0;
			rojo[1]<=0;
			rojo[0]<=0;
		end
	end
endmodule
