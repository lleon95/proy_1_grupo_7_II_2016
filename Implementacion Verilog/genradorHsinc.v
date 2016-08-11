`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:18 08/07/2016 
// Design Name: 
// Module Name:    genradorHsinc 
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
module genradorHsinc(cuenta,Hsinc);
	//entradas
	input [9:0] cuenta;
	//salidas
	output Hsinc;
	reg Hsinc;
	always @*
	begin
		//flanco negativo del hsinc
		if(cuenta >=655 || cuenta <= 750) Hsinc =0;
		//falnco positivo del hsinc
		else Hsinc = 1;
	end
endmodule
