`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Fue ampliado el rango de operacion a 11 bits, con tope de 1600
*/

module contadorhorizontal(Clk, Reset, cntHorizontal);
	//entradas
	input Clk, Reset;
	//salida
	output cntHorizontal;
	reg [10:0] cntHorizontal;
	always @ (posedge Clk)
	begin
		// Condición de reset
		if (Reset)
		begin
			cntHorizontal <= 11'd0;
		end
		else
		// Contar de forma ascendente
		begin
			//final de la cuenta
			if (cntHorizontal == 1599) cntHorizontal <= 0;
			//aumento de la cuenta
			else cntHorizontal <= cntHorizontal + 1;
		end
	end

endmodule

