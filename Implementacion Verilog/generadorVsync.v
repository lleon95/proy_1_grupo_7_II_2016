`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Fue modificado para adaptarlo a 840 000 ticks
*/

module generadorVsync(cntVertical,VSync);
	//entradas
	input [39:0] cntVertical;
	//salida
	output VSync;
	reg VSync;
	always @(cntVertical)
	begin
		// Flanco Positivo del VSync
		if(cntVertical > 0 && cntVertical <= 836800) VSync = 1'b1;
		// Flanco Negativo del VSync
		else VSync = 1'b0;
	end
endmodule
