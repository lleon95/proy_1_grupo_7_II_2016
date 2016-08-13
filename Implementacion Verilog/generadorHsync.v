`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Modificar el rango de datos, que ahora es de 1600
*/

module generadorHsync(cntHorizontal,HSync);
	// Entradas
	input [10:0] cntHorizontal;
	// Salidas
	output HSync;
	reg HSync;
	always @*
	begin
		// Para flanco positivo del HSync
		if(cntHorizontal > 0 && cntHorizontal <= 1408) HSync = 1'b1;
		// Para flanco negativo del HSync
		else HSync = 1'b0;
	end
endmodule
