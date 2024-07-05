`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:47:04 01/22/2024
// Design Name:   seven_bit_mid
// Module Name:   /media/cse/SAMYAK/CS220/Lab2_2/seven_bit_adder/seven_bit_top.v
// Project Name:  seven_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_mid
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_top;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg [3:0]y;

	// Outputs
	wire [6:0] z;
	wire carry7;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_mid uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.y(y), 
		.z(z), 
		.carry7(carry7)
	);
	always@(z,carry7)begin
	$display("$Time=%d, sum=  %b,carry= %b\n",$time ,z,carry7);
	end
	
	always@(posedge pb1) begin
	$display("$Time= %d, y= %b\n",$time,y);
	end
	always@(posedge pb2) begin
	$display("$Time= %d, y= %b\n",$time,y);
	end
	always@(posedge pb3) begin
	$display("$Time= %d, y= %b\n",$time,y);
	end
	always@(posedge pb4) begin
	$display("$Time= %d, y= %b\n",$time,y);
	end

	initial begin
		// Initialize Inputs
		pb1=0; pb2=0; pb3=0;
		pb4=0;
		#5
		y= 4'b0000;
		#1
		pb1=1;
		#2
		y= 4'b0111;
		#1
		pb2=1;
		#2
		y= 4'b1111;
		#1
		pb3=1;
		#2
		y= 4'b0101;
		#1
		pb4=1;
		#5
//		pb1=0;pb2=0;
	//	pb3=0;
	//	pb4=0;
		$finish ;

	end
      
endmodule

