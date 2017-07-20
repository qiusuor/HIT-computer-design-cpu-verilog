`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:35:32 07/12/2017
// Design Name:   four_beat_generator
// Module Name:   F:/Xilinx/ise-progject/cpu_verilog/test_four_beat_generator.v
// Project Name:  cpu_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_beat_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_four_beat_generator;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] t;

	// Instantiate the Unit Under Test (UUT)
	four_beat_generator uut (
		.clk(clk), 
		.rst(rst), 
		.t(t)
	);
always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		#1 rst=1;
		#1 rst=0;
		
		# 1000 $finish;

		// Wait 100 ns for global rst to finis
        
		// Add stimulus here

	end
      
endmodule

