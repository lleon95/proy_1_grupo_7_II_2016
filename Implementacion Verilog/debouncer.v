`timescale 1ns / 1ps
/*
	LOGBOOK
	16-8-2016: Creacion del debouncer
*/
module debouncer(signalInput, signalOutput, Clk, Reset);
	
	input signalInput, Clk, Reset;
	output signalOutput;
	
	reg [2:0] counter;
	
	always @ (posedge Clk)
		if (Reset == 1)
         counter <= 3'b000;
      else
         counter <= {counter[1:0], signalInput}; 
			
	assign signalOutput = counter[0] & counter[1] & !counter[2];
	
endmodule

/*

	reg [2:0] counter;

   always @ (posedge <clock>)
      if (reset == 1)
         counter <= 3'b000;
      else
         counter <= {counter[1:0], <input>};

   assign <output> = counter[0] & counter[1] & !counter[2];

*/
