`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:29 02/12/2024 
// Design Name: 
// Module Name:    rotary_shaft_encoder_top 
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
module rotary_shift_encoder_top(clk,ROT_A,ROT_B,led0, led1, led2, led3, led4, led5, led6, led7);
    input clk,ROT_A,ROT_B;
    output led0, led1, led2, led3, led4, led5, led6, led7;
    wire led0, led1, led2, led3, led4, led5, led6, led7;
    wire rotation_direction,rotation_event;
    rotary_shaft_encoder uut1(clk,ROT_A,ROT_B,rotation_event,rotation_direction);
    rotary_shaft_encoder_2 uut2(clk,rotation_event,rotation_direction,led0, led1, led2, led3, led4, led5, led6, led7);
endmodule
