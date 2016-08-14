`timescale 1ns / 1ps

/*
	LOGBOOK:
	14-Ago-2016: Se implementa el divisor
*/

module divisor1600(cntVertical, posVertical);
	//entradas
	input [19:0] cntVertical;
	//salidas
	output [10:0] posVertical;
	reg [10:0] posVertical;
	always @ *
		posVertical = cntVertical / 1600;
	

endmodule
