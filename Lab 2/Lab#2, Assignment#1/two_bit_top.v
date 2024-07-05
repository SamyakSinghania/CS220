`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:18:25 01/22/2024
// Design Name:   two_bit_mid
// Module Name:   /media/cse/SAMYAK/CS220/Lab2_1/two_bit_adder/two_bit_top.v
// Project Name:  two_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_mid
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_bit_top;

	// Inputs
	reg [1:0] x;
	reg [1:0] y;

	// Outputs
	wire [1:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	two_bit_mid uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.carry(carry)
	);
	always@(z,carry)
	begin
	$display("time = %d, %b+%b=%b, carry=%b\n",$time,x,y,z,carry);
	end
	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;
		#5
		x=2'b01; y=2'b00;
		#5
		x=2'b10; y=2'b00;
		#5
		x=2'b01;	y=2'b11;
		#5
		$finish;

	end
      
endmodule

