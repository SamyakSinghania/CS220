`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:23 02/12/2024 
// Design Name: 
// Module Name:    rotary_shaft_encoder 
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
module rotary_shaft_encoder(clk,ROT_A,ROT_B,rotation_event,rotation_direction);

    input clk,ROT_A,ROT_B;
    output rotation_event,rotation_direction;
    reg rotation_direction,rotation_event;
    always@(posedge clk)
    begin
    if(ROT_A==1&&ROT_B==1)
    rotation_event<=1;
    else if(ROT_A==0&&ROT_B==0)
    rotation_event<=0;
    else if(ROT_A==0&&ROT_B==1)
    rotation_direction<=1;
    else if(ROT_A==1&&ROT_B==0)
    rotation_direction<=0;
    end 



endmodule
