`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:03 01/29/2024
// Design Name:   five_four_adder
// Module Name:   /media/cse/SAMYAK/CS220/Lab3_3/five_four_adder/five_four_top.v
// Project Name:  five_four_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: five_four_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module five_four_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg PB5;
	reg [3:0] Y;

	// Outputs
	wire [5:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	five_four_adder uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.PB5(PB5), 
		.Y(Y), 
		.sum(sum), 
		.carry(carry)
	);
	always@(PB1,PB2,PB3,PB4,PB5,sum,carry) begin
	$display("time=%d: sum=%b, carry=%b\n",$time,sum[5:0],carry);
	end
	initial begin
		// Initialize Inputs
		PB1 = 0;
		PB2 = 0;
		PB3 = 0;
		PB4 = 0;
		PB5 = 0;
		Y = 0;
		#2
		Y=4'b0001;
		#1
		PB1=1;
		#2
		Y=4'b0001;
		#1
		PB2=1;
		#2
		Y=4'b0001;
		#1
		PB3=1;
		#2
		Y=4'b0001;
		#1
		PB4=1;
		#2
		Y=4'b0001;
		#1
		PB5=1;
		
		#5
		$finish;

	end
      
endmodule

