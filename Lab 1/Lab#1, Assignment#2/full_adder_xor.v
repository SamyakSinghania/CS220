// Verilog test fixture created from schematic /media/samyaks21/SAMYAK/CS220/Lab1_2/full_adder_schematic/fuller_adder_sch.sch - Mon Jan 15 15:40:00 2024

`timescale 1ns / 1ps

module fuller_adder_sch_fuller_adder_sch_sch_tb();

// Inputs
   reg cin;
   reg a;
   reg b;

// Output
   wire sum;
   wire cout;

// Bidirs

// Instantiate the UUT
   fuller_adder_sch UUT (
		.cin(cin), 
		.a(a), 
		.b(b), 
		.sum(sum), 
		.cout(cout)
   );
// Initialize Inputs
   always @(sum or cout) begin
$display("time=%d: %b + %b + %b = %b, cout = %b\n", $time, a, b, cin, sum, cout);
end
initial begin
a = 0; b = 0; cin = 0;
#5
a = 0; b = 1; cin = 0;
#5
a = 1; b = 0; cin = 1;
#5
a = 1; b = 1; cin = 1;
#5
$finish;
end
endmodule
