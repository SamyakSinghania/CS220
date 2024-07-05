`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:47 02/26/2024 
// Design Name: 
// Module Name:    sevenbit_top 
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
module sevenbit_top(clk,ROT_A,ROT_B,y,z,overflow);

    input clk,ROT_A,ROT_B;
	 input [3:0] y;
    output z,overflow;
    wire[6:0] z;
    wire overflow;
    reg[6:0] A;
    reg[6:0] B;
    reg operation;
	 wire cout[7:0];
    reg[2:0] counter;
    reg prev_rotation_event;
    wire rotation_event;
	 
    initial begin
    counter=0;
	 prev_rotation_event=1;
	 A=0;
	 B=0;
    end
	 
    
	 always@(posedge clk)
    begin
        if(prev_rotation_event==0 && rotation_event==1)  begin
            if(counter==0)  begin
                A[3:0]<=y;
                counter<=counter+1;
            end
            else if(counter==1) begin
                A[6:4]<=y[2:0];
                counter<=counter+1;
            end
            else if(counter==2) begin
                B[3:0]<=y;
                counter<=counter+1;
            end
            else if(counter==3) begin
                B[6:4]<=y[2:0];
                counter<=counter+1;
            end
            else if(counter==4) begin
                operation<=y[0];
                counter<=counter+1;
            end
				else if(counter==5)	begin
					counter<=0;
				end
        end
		  prev_rotation_event<=rotation_event;
    end
	 
	 detect_rotation det(clk,ROT_A,ROT_B,rotation_event);
	 fulladdsub uut0(A[0],B[0],operation,operation,z[0],cout[0]);
	 fulladdsub uut1(A[1],B[1],cout[0],operation,z[1],cout[1]);
	 fulladdsub uut2(A[2],B[2],cout[1],operation,z[2],cout[2]);
	 fulladdsub uut3(A[3],B[3],cout[2],operation,z[3],cout[3]);
	 fulladdsub uut4(A[4],B[4],cout[3],operation,z[4],cout[4]);
	 fulladdsub uut5(A[5],B[5],cout[4],operation,z[5],cout[5]);
	 fulladdsub uut6(A[6],B[6],cout[5],operation,z[6],cout[6]);
	 assign overflow=cout[6]^cout[5];

endmodule
