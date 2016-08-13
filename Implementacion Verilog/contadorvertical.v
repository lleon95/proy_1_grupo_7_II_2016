`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Fue ampliado el rango de operacion a 40 bits, con tome de 840000
	13-Ago-2016: Eran 20 bits en lugar de 40
*/

module contadorvertical(Clk, Reset, cntVertical);
	//entradas salidas
	input Clk, Reset;
	//salidas
	output cntVertical;
	reg [19:0] cntVertical;
	always @ (posedge Clk)
	begin
		//condicion de inicio
		if (Reset) cntVertical <= 10'b0;
		else
		begin
			//final de la cuenta
			if (cntVertical == 840000) cntVertical <= 0;
			//aumento de la cuenta
			else cntVertical <= cntVertical +1;	
		end
	end

endmodule
