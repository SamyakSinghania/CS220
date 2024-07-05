`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:45 02/05/2024 
// Design Name: 
// Module Name:    LCD_driver_top 
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
module LCD_driver_top(clk, LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0
    );
	 input clk;
	 output LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	 wire LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	 reg [127:0] line1;
	 reg [127:0] line2;
	 initial begin
			line1="WELCOME TO CSE, ";
			line2="IIT KANPUR      ";
	 end
	 LCD_driver uut(line1,line2,clk,LCD_RS,LCD_W,LCD_E,b3,b2,b1,b0);
	 
endmodule
