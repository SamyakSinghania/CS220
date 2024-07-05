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
module comp_mid(pb1,pb2,pb3,pb4,q,lo,go,eo);
input pb1,pb2,pb3,pb4;
input [3:0] q;
output lo,eo,go;
wire lo,go,eo;
reg[7:0]a,b;
wire l0,g0,e0,l1,g1,e1,l2,g2,e2,l3,g3,e3,l4,g4,e4,l5,g5,e5,l6,g6,e6;
always@(posedge pb1)
a[3:0]<=q;
always@(posedge pb2)
a[7:4]<=q;
always@(posedge pb3)
b[3:0]<=q;
always@(posedge pb4)
b[7:4]<=q;
comp_start c1(a[7],b[7],0,1,0,l0,e0,g0);
comp_start c2(a[6],b[6],l0,e0,g0,l1,e1,g1);
comp_start c3(a[5],b[5],l1,e1,g1,l2,e2,g2);
comp_start c4(a[4],b[4],l2,e2,g2,l3,e3,g3);
comp_start c5(a[3],b[3],l3,e3,g3,l4,e4,g4);
comp_start c6(a[2],b[2],l4,e4,g4,l5,e5,g5);
comp_start c7(a[1],b[1],l5,e5,g5,l6,e6,g6);
comp_start c8(a[0],b[0],l6,e6,g6,lo,eo,go);

endmodule