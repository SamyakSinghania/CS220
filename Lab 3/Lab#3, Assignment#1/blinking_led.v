`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:31 01/29/2024 
// Design Name: 
// Module Name:    blinking_led 
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


module blinking_led(clk,led0);
	 `define OFF_TIME 25000000
	 `define ON_TIME (`OFF_TIME*2)
	 
	 input clk;
	 output led0;
	 
	 reg led0;
	 reg[31:0]counter;
	 initial begin
		 counter<= 32'b0;
		 led0<=0;
	 end
	 
	always@(posedge clk) begin
	counter<= counter + 1'b1;
	if((counter == `OFF_TIME)) begin
		led0<= 0;
	end
	else if((counter == `ON_TIME)) begin
		led0<= 1;
		counter<= 32'b0;
	end
	
	end
	


endmodule
