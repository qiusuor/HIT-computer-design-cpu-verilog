`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:59:33 07/14/2017
// Design Name:   MR
// Module Name:   F:/Xilinx/ise-progject/cpu_verilog/test_MR.v
// Project Name:  cpu_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_MR;

	// Inputs
	reg rst;
	reg t2;
	reg [15:0] ir;

	// Outputs
	wire nDRD;
	wire nDWR;

	// Instantiate the Unit Under Test (UUT)
	MR uut (
		.rst(rst), 
		.t2(t2), 
		.ir(ir), 
		.nDRD(nDRD), 
		.nDWR(nDWR)
	);
always #20 t2=~t2;
	initial begin
		// Initialize Inputs
		rst = 0;
		t2 = 0;
		ir = 0;
		#1 rst=1;
		#1 rst=0;
		#38 ir=16'b0110000000000000;
		#40 ir=16'b0111000000000000;
		#40 ir=16'b1110000000000000;
		// Wait 100 ns for global reset to finish;
        
		// Add stimulus here

	end
      
endmodule

