`timescale 1ns / 1ps
/*
	LOGBOOK:
	16-Ago-2016: Se hicieron las correcciones por la eliminación del divisor de 1600
*/

module controlvga_principal(Clock,reset,Up,Down,TC,Lp,Azul,Verde,Rojo,Hsinc,Vsinc);
 input Clock,reset,Up,Down,TC,Lp;
 output Azul,Verde,Rojo,Hsinc,Vsinc;
 wire [1:0] Azul;
 wire [2:0] Rojo;
 wire [2:0] Verde;
 wire Hsinc;
 wire Vsinc;
 wire [9:0] cntHorizontal;
 wire [9:0] cntVertical;
// wire [9:0] posHorizontal;
// wire [9:0] posVertical;
 wire blank;
 wire letra;
 wire [7:0] ton;
 wire [2:0] ColorL;
 wire [2:0] ColorP;
 wire vflag;
 /*
	Contadores
 */
 // Conectar módulo de contador horizontal
 contadorhorizontal contH(.Clk(Clock), .Reset(reset), .cntHorizontal(cntHorizontal), .vflag(vflag));
 // Conectar módulo de contador vertical
 contadorvertical contV(.Clk(Clock), .Reset(reset), .cntVertical(cntVertical), .vflag(vflag));
 /*
	Generadores
 */
 // Generador de sincronía horizontal (HSYNC)
 generadorHsync genH(.cntHorizontal(cntHorizontal),.HSync(Hsinc));
 // Generador de sincronía vertical (VSYNC)
 generadorVsync genV(.cntVertical(cntVertical),.VSync(Vsinc));
 /* 
	Divisores binarios
 */
 // Adaptador de posición horizontal
 //divisorpor2 divisor2(.incont(cntHorizontal),.cuenta(posHorizontal));
 // --- START LLEON --- Ya no se usa.
 //divisor1600 divisor_1600(.cntVertical(cntVertical), .posVertical(posVertical));
 // --- END LLEON ---
 
 /*
	Memoria
	Nota: el contador vertical se conecta directo a memoria
 */
 memoria mem(.Posx(cntHorizontal),.Posy(cntVertical),.blank(blank),.letra(letra),.Clk(Clock),.reset(reset));
 /*
	Control de colores
 */
 controldecroma croma(.TC(TC),.UP(Up),.down(Down),.reset(reset),.LP(Lp),.ColorL(ColorL),.ColorP(ColorP),.ton(ton), .Clk(Clock));
 /*
	Control de salida
 */
 controldesalida crtlout(.clk(Clock),.ColorP(ColorP),.ColorL(ColorL),.ton(ton),.azul(Azul),.rojo(Rojo),.verde(Verde),.letra(letra),.blank(blank));
 
 


endmodule
