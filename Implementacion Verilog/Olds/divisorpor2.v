`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:00:12 08/13/2016 
// Design Name: 
// Module Name:    divisorpor2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module divisorpor2(incont,cuenta);
 input [10:0] incont;
 output [9:0] cuenta;
 reg [9:0] cuenta;
 always @(incont)
 begin
  cuenta=incont/2;
 end

endmodule
