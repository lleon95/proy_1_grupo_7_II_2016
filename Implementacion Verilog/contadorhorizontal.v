`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Fue ampliado el rango de operacion a 11 bits, con tope de 1600
*/

module contadorhorizontal(Clk, Reset, cntHorizontal, vflag);
	//entradas
	input Clk, Reset;
	//salida
	output wire [9:0] cntHorizontal;
	output vflag;
	reg [10:0] Horizontal;
	assign cntHorizontal[9:0] = Horizontal[10:1];
	reg vflag;
	always @ (posedge Clk)
	begin
		// Condición de reset
		if (Reset)
		begin
			Horizontal <= 11'd0;
			vflag <= 1'b0;
		end
		else
		// Contar de forma ascendente
		begin
			//final de la cuenta
			if (Horizontal == 1599) 
			begin
			// Reset counter
				Horizontal <= 0;
			end
			//aumento de la cuenta
			else 
			begin
			// Increment counter
				Horizontal <= Horizontal + 1;
			end
			// Controlar bandera
			if (Horizontal == 1408) vflag <= 1'b1; // Rise flag //1320 desfase
			else vflag <= 1'b0; 
		end
	end

endmodule

