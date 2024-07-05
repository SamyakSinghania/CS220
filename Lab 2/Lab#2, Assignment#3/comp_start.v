`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:15 01/22/2024 
// Design Name: 
// Module Name:    comp_start 
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
module comp_start(x,y,l,e,g,lo,eo,go);
input x,y,l,e,g;
output lo,eo,go;
wire lo,eo,go;

assign go=g|(e & (~l) & x & (~y) & (~g));
assign lo=l|(e & (~g) & (~x) & y & (~l));
assign eo=e&(~g)&(~l)&(((~x)&(~y)) | (x&y));

endmodule
