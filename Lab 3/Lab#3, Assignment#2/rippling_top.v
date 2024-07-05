`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:08:42 01/29/2024
// Design Name:   rippling
// Module Name:   /media/cse/SAMYAK/CS220/Lab3_2/rippling_led/rippling_top.v
// Project Name:  rippling_led
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rippling
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rippling_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;

	// Instantiate the Unit Under Test (UUT)
	rippling uut (
		.clk(clk), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7)
	);
	always@(led0,led1,led2,led3,led4,led5,led6,led7)
	$display("time = %d, led0=%b, led1=%b, led2=%b, led3=%b, led4=%b, led5=%b, led6=%b, led7=%b",$time,led0,led1,led2,led3,led4,led5,led6,led7);
	// change the shift time to 2 in rippling.v to see the simulation
	initial begin
		forever begin
		clk=0;
		#1
		clk=1;
		#1
		clk=0;
		end
	end
	initial begin
		#100;
       $finish;
	end
      
endmodule

