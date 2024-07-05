`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:25 03/04/2024
// Design Name: 
// Module Name:    fms_top 
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
module fsm_top(clk,ROT_A,ROT_B,bits,state);

    input clk,ROT_A,ROT_B;
	input [1:0] bits;
    output state;
    reg[3:0] state;
    wire[3:0] state2;
    reg prev_rotation_event;
    wire rotation_event;
	reg [3:0] z;
    reg [32:0] counter;
    initial begin
	prev_rotation_event=1;
    state=0;
	z=0;
    counter=0;
    end
    
    fsm_mid fsm(clk,state,z,state2);
    
	always@(posedge clk)
    begin
        counter<=counter+1;
        if(prev_rotation_event==0 && rotation_event==1)  begin
			z<=bits;
            state<=state2;
            counter<=0;
        end
        else if(counter==100000000) begin
            state<=state2;
            counter<=0;        
        end
		prev_rotation_event<=rotation_event;
    end

	detect_rotation det(clk,ROT_A,ROT_B,rotation_event);

endmodule
