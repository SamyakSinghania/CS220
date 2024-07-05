`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:40 01/22/2024 
// Design Name: 
// Module Name:    two_bit 
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
module two_bit(a,b,cin,sum,cout);
input a;
input b;
input cin;
output sum;
wire sum;
output cout;
wire cout;
assign sum = a^b^cin;
assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

