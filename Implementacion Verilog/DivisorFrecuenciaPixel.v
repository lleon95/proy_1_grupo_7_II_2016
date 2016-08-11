`timescale 1ns / 1ps

module DivisorFrecuenciaPixel(
	input SysClk,
	input Reset,
	output reg PixelClk
    );
	
	always @(posedge SysClk or posedge Reset)
	begin
		// Resetear el divisor y poner a 0
		if(Reset) PixelClk <= 0;
		// Comenzar division de frecuencia
		else
		begin
			// Cambiar de estado
			PixelClk <= ~PixelClk;
		end
	end

endmodule
