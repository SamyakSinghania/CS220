`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:41 01/29/2024 
// Design Name: 
// Module Name:    five_four_adder 
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
module five_four_adder(PB1, PB2, PB3, PB4, PB5, Y, sum, carry);
	input PB1,PB2,PB3,PB4,PB5;
	input [3:0] Y;
	output [5:0] sum;
	output carry;
	wire[5:0] sum;
	wire carry;

	reg[3:0] x1,x2,x3,x4;
	reg[5:0] x5;
	
	
	wire[4:0] o1, o2;
	wire[5:0] o3 ;

	always @(posedge PB1) begin
        x1 <= Y;
    end
    always @(posedge PB2) begin
       x2 <= Y;
    end
    always @(posedge PB3) begin
        x3 <= Y;
    end
    always @(posedge PB4) begin
        x4 <= Y;
    end
  	always @(posedge PB5) begin
        x5[3:0] <= Y;
		  x5[4] <= 0;
		  x5[5] <= 0;
    end

    four_adder FA1(x1, x2, 1'b0, o1[3:0], o1[4]);
    four_adder FA2(x3, x4, 1'b0, o2[3:0], o2[4]);
    five_adder FA3(o1[4:0], o2[4:0], 1'b0, o3[4:0], o3[5]);
    six_adder FA4(o3[5:0], x5, 1'b0, sum[5:0], carry);


endmodule
