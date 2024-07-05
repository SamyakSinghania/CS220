`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:25 03/04/2024 
// Design Name: 
// Module Name:    fsm_mid 
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
module fsm_mid(clk,state,z,state2);

    input clk;
    input [3:0] state;
	input [1:0] z;
    output [3:0] state2;
    reg [3:0] state2;
    reg [3:0] dispatch_rom1[3:0],dispatch_rom2[3:0];
    reg [2:0] microcode_rom[12:0];
    initial begin

        dispatch_rom1[0]<=4'b0100;
        dispatch_rom1[1]<=4'b0101;
        dispatch_rom1[2]<=4'b0110;
        dispatch_rom1[3]<=4'b0110;

        dispatch_rom2[0]<=4'b1011;
        dispatch_rom2[1]<=4'b1100;
        dispatch_rom2[2]<=4'b1100;
        dispatch_rom2[3]<=4'b1100;

        // 0 for increment;
        microcode_rom[0]<=0;
        microcode_rom[1]<=0;
        microcode_rom[2]<=0;
        // 1 for dispatch rom 1;
        microcode_rom[3]<=3'b001;
        // 2 for state 7;
        microcode_rom[4]<=3'b010;
        microcode_rom[5]<=3'b010;
        microcode_rom[6]<=0;
        microcode_rom[7]<=0;
        microcode_rom[8]<=0;
        microcode_rom[9]<=0;
        // 3 for dispatch rom 2;
        microcode_rom[10]<=3'b011;
        // 4 for state 0;
        microcode_rom[11]<=3'b100;
        microcode_rom[12]<=3'b100;

    end
    
	always@(posedge clk)    begin
        if(microcode_rom[state]==0) state2<=state+1;
        else if(microcode_rom[state]==3'b001)   state2<=dispatch_rom1[z];
        else if(microcode_rom[state]==3'b010)   state2<=7;
        else if(microcode_rom[state]==3'b011)   state2<=dispatch_rom2[z];
        else if(microcode_rom[state]==3'b100)   state2<=0;
    end

endmodule