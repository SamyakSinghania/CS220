`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:42:24 01/29/2024
// Design Name:   blinking_led
// Module Name:   /media/cse/SAMYAK/CS220/Lab3_1/blinking_led/blinking_led_top.v
// Project Name:  blinking_led
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blinking_led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blinking_led_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	blinking_led uut (
		.clk(clk), 
		.led0(led0)
	);
	always@(led0) begin
	$display("time= %d,clock=%b,led=%b\n",$time,clk,led0);
	end
	// change the OFF_TIME to 2 in blinking_led.v to see simulation
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

