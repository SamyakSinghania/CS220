`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:32 03/04/2024 
// Design Name: 
// Module Name:    get_mini 
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
module get_mini(clk,nums1,nums2,nums3,nums4,mini
    );
	 input clk;
	 input [2:0] nums1,nums2,nums3,nums4;
	 output [3:0] mini;
	 reg[3:0] mini=0;
	 
	 always@(posedge clk)	begin
		if(nums1<=nums2 && nums1<=nums3 && nums1<=nums4)	mini<=0;
		if(nums2<=nums1 && nums2<=nums3 && nums2<=nums4)	mini<=4'b01;
		if(nums3<=nums2 && nums3<=nums1 && nums3<=nums4)	mini<=4'b10;
		if(nums4<=nums2 && nums4<=nums3 && nums4<=nums1)	mini<=4'b11;
		
	 end

endmodule
