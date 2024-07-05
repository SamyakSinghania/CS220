`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:00 01/29/2024 
// Design Name: 
// Module Name:    four_adder 
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
module four_adder(x,y,cin,z,carry);
	input [3:0] x,y;
	input cin;
	output [3:0] z;
	output carry;
	wire [3:0] z;
	wire carry, carry0, carry1, carry2;
	full_adder uut1 (x[0], y[0], 1'b0, z[0], carry0);
	full_adder uut2 (x[1], y[1], carry0, z[1], carry1);
	full_adder uut3 (x[2], y[2], carry1, z[2], carry2);
	full_adder uut4 (x[3], y[3], carry2, z[3], carry);

endmodule
