`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Fue ampliado el rango de operacion a 11 bits, con tope de 1600
*/

module contadorhorizontal(Clk, Reset, cntHorizontal, vflag);
	//entradas
	input Clk, Reset;
	//salida
	output [10:0] cntHorizontal;
	output vflag;
	reg [10:0] cntHorizontal;
	reg vflag;
	always @ (posedge Clk)
	begin
		// Condición de reset
		if (Reset)
		begin
			cntHorizontal <= 11'd0;
			vflag <= 1'b0;
		end
		else
		// Contar de forma ascendente
		begin
			//final de la cuenta
			if (cntHorizontal == 1599) 
			begin
			// Reset counter
				cntHorizontal <= 0;
			// Set flag to one
				vflag <= 1'b1;
			end
			//aumento de la cuenta
			else 
			begin
			// Increment counter
				cntHorizontal <= cntHorizontal + 1;
			// Set flag to zero
				vflag <= 1'b0;
			end
		end
	end

endmodule

