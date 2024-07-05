`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:43 03/18/2024 
// Design Name: 
// Module Name:    decoder 
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
module decoder(clk,pb1,led);
input clk,pb1;
output [7:0] led;
reg[7:0] led;
reg[3:0] row_counter;
reg[7:0] memory[7:0];
reg[7:0] decoder_output;
reg[7:0] bit_sum;
reg[7:0] bit_mod;
initial	begin
//3, 4, 7, 2, 3, 5, 0, 2
	memory[0]=3;
	memory[1]=4;
	memory[2]=7;
	memory[3]=2;
	memory[4]=3;
	memory[5]=5;
	memory[6]=0;
	memory[7]=2;

	row_counter=0;
	decoder_output=0;
	bit_sum=0;
	bit_mod=0;
	led=0;
end

always@(posedge clk)	begin

		if(row_counter<8)	row_counter <= row_counter + 1;

		if(row_counter<8 && memory[row_counter]==0)	decoder_output <= decoder_output ^ 8'b10000000;
		else if(row_counter<8 && memory[row_counter]==1)		decoder_output <= decoder_output ^ 8'b01000000;
		else if(row_counter<8 && memory[row_counter]==2)		decoder_output <= decoder_output ^ 8'b00100000;
		else if(row_counter<8 && memory[row_counter]==3)		decoder_output <= decoder_output ^ 8'b00010000;
		else if(row_counter<8 && memory[row_counter]==4)		decoder_output <= decoder_output ^ 8'b00001000;
		else if(row_counter<8 && memory[row_counter]==5)		decoder_output <= decoder_output ^ 8'b00000100;
		else if(row_counter<8 && memory[row_counter]==6)		decoder_output <= decoder_output ^ 8'b00000010;
		else if(row_counter<8 && memory[row_counter]==7)		decoder_output <= decoder_output ^ 8'b00000001;

		if(pb1==1)	begin
			led[0] <= bit_mod[0];
			led[7:1] <= 0;
		end
		else begin
			led <= decoder_output;
			bit_sum <= (4'b0000 + decoder_output[0]+decoder_output[1]+decoder_output[2]+decoder_output[3]+decoder_output[4]+decoder_output[5]+decoder_output[6]+decoder_output[7]);
			bit_mod <= bit_sum%2;
		end
		
end

endmodule
