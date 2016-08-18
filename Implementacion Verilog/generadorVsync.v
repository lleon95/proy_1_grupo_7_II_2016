`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Fue modificado para adaptarlo a 840 000 ticks
	13-Ago-2016: Eran 20 bits en lugar de 40
*/

module generadorVsync(cntVertical,VSync);
	//entradas
	input [9:0] cntVertical;
	//salida
	output VSync;
	reg VSync;
	always @(cntVertical)
	begin
		// Flanco Positivo del VSync
		if(cntVertical > 0 && cntVertical < 520) VSync = 1'b1;
		// Flanco Negativo del VSync
		else VSync = 1'b0;
	end
endmodule
