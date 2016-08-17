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
	input TC,LP,UP,down,reset, Clk;
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
			if(TC)
			begin
				//aumneto de tono siempre y cuando no esta al maximo
				if(UP && ton != 8'b11111111)
					begin
						ton <= ton +1;
						if(ton[0]==0&&ton[1]==0&&ton[2]==0)ton[0]<=1;
						else
						begin
						end
						if(ton[3]==0&&ton[4]==0&&ton[5]==0)ton[3]<=1;
						else
						begin
						end
						if(ton[6]==0&&ton[7]==0) ton[6]<=1;
						else
						begin
						end
					end
				//disminucion del siempre y cuando no se encuente en el minimo
				else if(down && ton != 8'b01001001)
				begin
					ton<= ton-1;
					if(ton[0]==0&&ton[1]==0&&ton[2]==0)
						begin
							ton[0]<=1;
							ton[1]<=1;
							ton[2]<=1;
							ton[3]<= ~ton[3];
						end
						else
						begin
						end
						if(ton[3]==0&&ton[4]==0&&ton[5]==0)
						begin
							ton[3]<=1;
							ton[4]<=1;
							ton[5]<=1;
							if(ton[6]==0&&ton[7]==1) 
							begin
								ton[6]<= ~ton[6];
								ton[7]<= ~ton[7];
							end
							else ton[6]<= ~ton[6];					
						end
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
