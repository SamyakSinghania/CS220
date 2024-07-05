`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:02 03/04/2024 
// Design Name: 
// Module Name:    adder 
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
module adder(x1,y1,bits,x2,y2);
	 input [4:0] x1,y1,bits;
    output x2,y2;
    wire [4:0] x2,y2;
    wire [4:0] carryx,carryy;
    wire operation;
    assign operation=~(bits[2]^bits[3]);
    // when the bits are same, eg. in west and south, we do subtract operation;
    // when the bits are diff, we do addition operation;
    wire [4:0] jmpx,jmpy;
    assign jmpx={0,0,0,bits[1]&(~bits[2]),bits[0]&(~bits[2])};
    assign jmpy={0,0,0,bits[1]&bits[2],bits[0]&bits[2]};
    fulladdsub uut1(x1[0],jmpx[0],operation,operation,x2[0],carryx[0]);
    fulladdsub uut2(x1[1],jmpx[1],carryx[0],operation,x2[1],carryx[1]);
    fulladdsub uut3(x1[2],jmpx[2],carryx[1],operation,x2[2],carryx[2]);
    fulladdsub uut4(x1[3],jmpx[3],carryx[2],operation,x2[3],carryx[3]);
    fulladdsub uut5(x1[4],jmpx[4],carryx[3],operation,x2[4],carryx[4]);

    fulladdsub uut6(y1[0],jmpy[0],operation,operation,y2[0],carryy[0]);
    fulladdsub uut7(y1[1],jmpy[1],carryy[0],operation,y2[1],carryy[1]);
    fulladdsub uut8(y1[2],jmpy[2],carryy[1],operation,y2[2],carryy[2]);
    fulladdsub uut9(y1[3],jmpy[3],carryy[2],operation,y2[3],carryy[3]);
    fulladdsub uut10(y1[4],jmpy[4],carryy[3],operation,y2[4],carryy[4]); 

endmodule
