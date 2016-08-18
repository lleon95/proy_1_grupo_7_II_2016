`timescale 1ns / 1ps

/*
	LOGBOOK:
	11-Ago-2016: Fue ampliado el rango de operacion a 40 bits, con tome de 840000
	13-Ago-2016: Eran 20 bits en lugar de 40
*/

module contadorvertical(Clk, Reset, cntVertical, vflag);
	//entradas salidas
	input Clk, Reset, vflag;
	//salidas
	output [9:0] cntVertical;
	reg [9:0] cntVertical;
	always @ (posedge Clk)
	begin
		//condicion de inicio
		if (Reset) cntVertical <= 0;
		else
		begin
			// Check flag
			if(vflag)
			begin
				//final de la cuenta
				if (cntVertical == 520) cntVertical <= 0;
				//aumento de la cuenta
				else cntVertical <= cntVertical +1;	
			end
		end
	end

endmodule
