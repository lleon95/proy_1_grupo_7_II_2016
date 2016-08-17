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
	always @(posedge Clk)
	begin
		//condiciones de inicio
		if(reset)
		begin
			blank <=0;
			letra <=0; 
		end
		//posiciones de blank (espacios donde no se pinta)
		else 
		begin
			if(Posx >= 687 || Posx <= 47 || Posy >= 512 || Posy <= 32)	blank <=1;
			else blank <=0;
			//posicion de las letras
			//primera colomuna
			if((Posx >=208 && Posx <=224) && ((Posy >= 138 && Posy <= 196) ||(Posy >= 244 && Posy <= 302)||(Posy >= 350 && Posy >= 408))
			||((Posx >=224 && Posx <=256) && ((Posy >= 287 && Posy <= 302)||(Posy >= 393 && Posy <= 408))) 
			||((Posy >=153 && Posy <=181) && ((Posx >= 224 && Posx <= 240))) 
			||((Posx >=240 && Posx <=256) && ((Posy >= 138 && Posy <= 168)||(Posy >= 178 && Posy <= 196)))
			//L de leon
			||((Posx >=336 && Posx <=400) && (Posy >= 287 && Posy <= 302)) 
			||((Posx >=336 && Posx <=352) && (Posy >= 350 && Posy <= 408)) 
			//M's
			||(((Posx >=320 && Posx <=336)||(Posx >=432 && Posx <=448)) && ((Posy >= 138 && Posy <= 196)||(Posy >= 244 && Posy <= 302))) 
			||(((Posx >=336 && Posx <=366)||(Posx >=396 && Posx <=432)) && ((Posy >= 153 && Posy <= 168)||(Posy >= 258 && Posy <= 272))) 
			||((Posx >=352 && Posx <=416) && ((Posy >= 168 && Posy <= 182)||(Posy >= 272 && Posy <= 286))) 
			||((Posx >=368 && Posx <=400) && ((Posy >= 182 && Posy <= 196)||(Posy >= 286 && Posy <= 302))) 
			//V's
			||(((Posx >=462 && Posx <=512)||(Posx >=560 && Posx <=576)) && ((Posy >= 138 && Posy <= 166)||(Posy >= 350 && Posy <= 378))) 
			||(((Posx >=512 && Posx <=528)||(Posx >=544 && Posx <=560)) && ((Posy >= 153 && Posy <= 196)||(Posy >= 392 && Posy <= 408))) 
			||((Posx >=512 && Posx <=560) && ((Posy >= 182 && Posy <= 196)||(Posy >= 394 && Posy <= 408))) 
			//G de gatica
			||(((Posy >=244 && Posy <=258)||(Posy >=288 && Posy <=302)) && ((Posx >= 496 && Posx <= 576)))
			||((Posx >=496 && Posx <=512) && (Posy >= 244 && Posy <= 302)) 
			||((Posx >=528 && Posx <=575) && (Posy >= 265 && Posy <= 272)) 
			||((Posx >=560 && Posx <=575) && (Posy >= 265 && Posy <= 302)) 
			//puntos
			||(((Posx >=288 && Posx <=304) || (Posx >=464 && Posx <=480)) && ((Posy >= 182 && Posy <= 196)||(Posy >= 287 && Posy <= 302)||(Posy >= 393 && Posy >= 408)))) letra <=1;
			//pintado de pantalla
			else letra<=0;
		end
	end
endmodule
