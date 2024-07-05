`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:25 02/26/2024 
// Design Name: 
// Module Name:    grid_top 
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
module grid_top(clk,ROT_A,ROT_B,bits,x1,y1);

    input clk,ROT_A,ROT_B;
	input [3:0] bits;
    output x1,y1;
    reg[4:0] x1,y1;
	wire[4:0] x2,y2;
    reg prev_rotation_event;
    wire rotation_event;
	reg flag;
	reg [3:0] z;
    initial begin
	prev_rotation_event=1;
	x1=0;
	y1=0;
	flag=0;
	z=0;
    end
	 
    
	always@(posedge clk)
    begin
		if(flag==1)	begin
			if(z[2]==0 && z[3]==0)	begin
				// west;
				if(x2[4]==1)	x1<=0;
				else	x1<=x2;
			end
			else if(z[2]==1 && z[3]==0)	begin
				// north;
				if(y2[4]==1)	y1<=5'b01111;
				else	y1<=y2;
			end
			else if(z[2]==0 && z[3]==1)	begin
				//east;
				if(x2[4]==1)	x1<=5'b01111;
				else	x1<=x2;
			end
			else if(z[2]==1 && z[3]==1)	begin
				// south;
				if(y2[4]==1)	y1<=0;
				else	y1<=y2;
			end
			flag<=0;
		end
        if(prev_rotation_event==0 && rotation_event==1)  begin
			flag<=1;
			z<=bits;
        end
		prev_rotation_event<=rotation_event;
    end

	detect_rotation det(clk,ROT_A,ROT_B,rotation_event);
	// 0 1 2 3 for directions;
	// 0-> west 1-> north 2-> east 3-> south;
	// when lsb is 0, move along x, when lsb is 1 when along y;
	adder uut(x1,y1,z,x2,y2);

endmodule