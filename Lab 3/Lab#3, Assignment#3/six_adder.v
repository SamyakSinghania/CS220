`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:02 01/29/2024 
// Design Name: 
// Module Name:    six_adder 
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
module six_adder(x, y, cin, z, carry);
	input [5:0] x,y;
	input cin;
	output [5:0] z;
	output carry;
	wire [5:0] z;
	wire carry, carry0, carry1, carry2, carry3, carry4;
	full_adder uut0 (x[0], y[0], 1'b0, z[0], carry0);
	full_adder uut1 (x[1], y[1], carry0, z[1], carry1);
	full_adder uut2 (x[2], y[2], carry1, z[2], carry2);
	full_adder uut3 (x[3], y[3], carry2, z[3], carry3);
	full_adder uut4 (x[4], y[4], carry3, z[4], carry4);
	full_adder uut5 (x[5], y[5], carry4, z[5], carry);

endmodule
