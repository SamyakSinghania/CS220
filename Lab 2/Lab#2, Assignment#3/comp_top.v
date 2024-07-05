`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:33:48 01/22/2024
// Design Name:   comp_mid
// Module Name:   /media/cse/SAMYAK/CS220/Lab2_3/comparator/comp_top.v
// Project Name:  comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comp_mid
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comp_top;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg [3:0] q;

	// Outputs
	wire lo;
	wire go;
	wire eo;

	// Instantiate the Unit Under Test (UUT)
	comp_mid uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.q(q), 
		.lo(lo), 
		.go(go), 
		.eo(eo)
	);
	always@(lo,go,eo)
	begin
	$display("time=%d, lo=%b, eo=%b, go=%b\n", $time,lo,eo,go);
	end
	
	always@(posedge pb1) begin
	$display("$Time= %d, q= %b\n",$time,q);
	end
	always@(posedge pb2) begin
	$display("$Time= %d, q= %b\n",$time,q);
	end
	always@(posedge pb3) begin
	$display("$Time= %d, q= %b\n",$time,q);
	end
	always@(posedge pb4) begin
	$display("$Time= %d, q= %b\n",$time,q);
	end
	
	initial begin
		// Initialize Inputs
		pb1=0; pb2=0; pb3=0;
		pb4=0;
		#5
		q= 4'b0000;
		#1
		pb1=1;
		#2
		q= 4'b0111;
		#1
		pb2=1;
		#2
		q= 4'b1111;
		#1
		pb3=1;
		#2
		q= 4'b0101;
		#1
		pb4=1;
		#5
		$finish;

	end
      
endmodule

