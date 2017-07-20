`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:17 07/15/2017
// Design Name:   WB
// Module Name:   F:/Xilinx/ise-progject/cpu_verilog/test_wb.v
// Project Name:  cpu_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_wb;

	// Inputs
	reg t3;
	reg rst;
	reg [15:0] ir;

	// Outputs
	wire wbin;
	wire wbr;

	// Instantiate the Unit Under Test (UUT)
	WB uut (
		.t3(t3), 
		.rst(rst), 
		.wbin(wbin), 
		.wbr(wbr), 
		.ir(ir)
	);
always #20 t3=~t3;
	initial begin
		// Initialize Inputs
		t3 = 0;
		rst = 0;
		ir = 0;
		#1 rst=1;
		#1 rst=0;
		#38 ir=16'b0011000000000000;
		#40 ir=16'b1001000000000000;
		#40 ir=16'b0010000000000000;
		#40 ir=16'b0111000000000000;
		#40 ir=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

