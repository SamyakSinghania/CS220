`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:57 03/04/2024 
// Design Name: 
// Module Name:    lcd_top 
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
module lcd_top(clk,ROT_A,ROT_B,bits,LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0,mini);
	 input clk,ROT_A,ROT_B;
	input [2:0] bits;
	output LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	 wire LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	 output [3:0] mini;
	 wire[3:0] mini;
	reg [127:0] line1;
	 reg [127:0] line2;
    reg prev_rotation_event;
    wire rotation_event;
    reg [3:0] counter;
	 reg [2:0] nums[3:0];
    initial begin
	 prev_rotation_event=1;
    counter=0;
	 line1=128'h202C20202C20202C2020202020202020;
	 line2=128'h20202020202020202020202020202020;
    end
	
		LCD_driver uut(line1,line2,clk,LCD_RS,LCD_W,LCD_E,b3,b2,b1,b0);
		
	always@(posedge clk)
    begin
        if(prev_rotation_event==0 && rotation_event==1)  begin
		  if(counter==0)	begin
			nums[0]<=bits;
			counter<=counter+1;
		end
		  else if(counter==1)	begin
		  nums[1]<=bits;
		  counter<=counter+1;
		end
		  else if(counter==2)	begin
			nums[2]<=bits;
			counter<=counter+1;
		end
		  else if(counter==3)	begin
		  nums[3]<=bits;
		 end
		  end
		  		line1[127:124]<=4'b0011;
				line1[123:120]<={0,nums[0]};
				line1[103:100]<=4'b0011;
				line1[99:96]<={0,nums[1]};
				line1[79:76]<=4'b0011;
				line1[75:72]<={0,nums[2]};
				line1[55:52]<=4'b0011;
				line1[51:48]<={0,nums[3]};
				line2[127:124]<=4'b0011;
				line2[123:120]<=mini;
		prev_rotation_event<=rotation_event;
    end
	 
	
	detect_rotation det(clk,ROT_A,ROT_B,rotation_event);
	get_mini get(clk,nums[0],nums[1],nums[2],nums[3],mini);
endmodule
