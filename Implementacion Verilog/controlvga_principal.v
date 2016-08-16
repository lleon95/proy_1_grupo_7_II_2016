`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:03:09 08/16/2016 
// Design Name: 
// Module Name:    controlvga_principal 
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
module controlvga_principal(Clock,reset,Up,Down,TC,Lp,Azul,Verde,Rojo,Hsinc,Vsinc);
 input Clock,reset,Up,Down,TC,Lp;
 output Azul,Verde,Rojo,Hsinc,Vsinc;
 wire [1:0] Azul;
 wire [2:0] Rojo;
 wire [2:0] Verde;
 wire Hsinc;
 wire Vsinc;
 wire [10:0] cntHorizontal;
 wire [19:0] cntVetical;
 wire [9:0] posHorizontal;
 wire [9:0] posVertical;
 wire blank;
 wire letra;
 wire [7:0] ton;
 wire [2:0] ColorL;
 wire [2:0] ColorP;
 contadorhorizontal contH(.Clk(Clock), .Reset(reset), .cntHorizontal(cntHorizontal));
 contadorvertical contV(.Clk(Clock), .Reset(reset), .cntVertical(cntVetical));
 generadorHsync genH(.cntHorizontal(cntHorizontal),.HSync(Hsinc));
 generadorVsync genV(.cntVertical(cntVertical),.VSync(Vsinc));
 divisorpor2 divisor2(.incont(cntHorizontal),.cuenta(posHorizontal));
 divisor1600 divisor_1600(.cntVertical(cntVertical), .posVertical(posVertical));
 memoria mem(.Posx(posHorizontal),.Posy(posVertical),.blank(blank),.letra(letra),.Clk(Clock),.reset(reset));
 controldecroma croma(.TC(TC),.UP(Up),.down(Down),.reset(reset),.LP(Lp),.ColorL(ColorL),.ColorP(ColorP),.ton(ton));
 controldesalida crtlout(.clk(Clock),.ColorP(ColorP),.ColorL(ColorL),.ton(ton),.azul(Azul),.rojo(Rojo),.verde(Verde),.letra(letra),.blank(blank));
 
 


endmodule
