`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:43 08/07/2016 
// Design Name: 
// Module Name:    controlVGA 
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
module controlVGA(Clock,reset,Up,Down,TC,Lp,Azul,Verde,Rojo,Hsinc,Vsinc);
	input Clock,reset,Up,Down,TC,Lp;
	output Azul,Verde,Rojo,Hsinc,Vsinc;
	wire Clk;
	wire[1:0] Azul;
	wire[2:0] Rojo;
	wire[2:0] Verde;
	wire[9:0] cuentaH, cuentaV;
	wire blank,letra;
	wire[7:0] ton;
	wire[2:0] ColorL;
	wire[2:0] ColorP;
	DivisorFrecuenciaPixel Divisor(.SysClk(Clock),.Reset(reset), .PixelClk(Clk));
	contadorhorizontal ContH(.Clk(Clk), .reset(reset), .cuenta(cuentaH));
	generadorHsync GenH(.cuenta(cuentaH),.Hsinc(Hsinc));//cuenta,Hsinc
	contadorvertical ContV(.Clk(Hsinc), .reset(reset), .cuenta(cuentaV));//Clk, reset, cuenta
	generadorVsync GenV(.cuenta(cuentaV),.Vsinc(Vsinc));//cuenta,Hsin
	memoria Memo(.Posx(cuentaH),.Posy(cuentaV),.blank(blank),.letra(letra),.Clk(Clk),.reset(reset));//Posx,Posy,blank,letra,Clk,reset
	controldecroma ContrCrom(.TC(TC),.UP(Up),.down(Down),.reset(reset),.LP(Lp),.ColorL(ColorL),.ColorP(ColorP),.ton(ton));//Tono,UP,down,color,reset,LP,ColorL,ColorP,ton
	controldesalida ContrOut(.clk(Clk),.ColorP(ColorP),.ColorL(ColorL),.ton(ton),.azul(Azul),.rojo(Rojo),.verde(Verde),.letra(letra),.blank(blank));//clk,ColorP,ColorL,ton,azul,rojo,verde,letra,blank
endmodule
