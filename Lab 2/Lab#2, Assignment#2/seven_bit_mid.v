`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:01 01/22/2024 
// Design Name: 
// Module Name:    seven_bit_mid 
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
module seven_bit_mid(pb1,pb2,pb3,pb4,y,z,carry7);
input pb1,pb2,pb3,pb4;
input [3:0] y;
output z,carry7;
wire[6:0] z;
wire carry1,carry2,carry3,carry4,carry5,carry6,carry7; 
reg[6:0]a;
reg[6:0]b;
always@(posedge pb1)
a[3:0]<=y;
always@(posedge pb2)
a[6:4]<=y[2:0];
always@(posedge pb3)
b[3:0]<=y;
always@(posedge pb4)
b[6:4]<=y[2:0];
full_adder fa0(a[0],b[0],1'b0,z[0],carry1);
full_adder fa1(a[1],b[1],carry1,z[1],carry2);
full_adder fa2(a[2],b[2],carry2,z[2],carry3);
full_adder fa3(a[3],b[3],carry3,z[3],carry4);
full_adder fa4(a[4],b[4],carry4,z[4],carry5);
full_adder fa5(a[5],b[5],carry5,z[5],carry6);
full_adder fa6(a[6],b[6],carry6,z[6],carry7);
endmodule
