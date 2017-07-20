`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:53:55 07/15/2017
// Design Name:   fe
// Module Name:   F:/Xilinx/ise-progject/cpu_verilog/test_fe.v
// Project Name:  cpu_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fe
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fe;

	// Inputs
	reg rst;
	reg t0;
	reg [15:0] pcnew;
	reg [15:0] irnew;
	reg jp;
	reg t3;

	// Outputs
	wire irr;
	wire [15:0] ir;
	wire [15:0] pc;

	// Instantiate the Unit Under Test (UUT)
	fe uut (
		.rst(rst), 
		.t0(t0), 
		.irr(irr), 
		.ir(ir), 
		.pcnew(pcnew), 
		.irnew(irnew), 
		.jp(jp), 
		.t3(t3), 
		.pc(pc)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		t0 = 0;
		pcnew = 0;
		irnew = 34;
		jp = 0;
		t3 = 0;
		
		#1 rst=1;
		
		#1 rst=0;
		
		#3 t0=1;
		#10 t0=0;
		
		
		#20 t3=1;
		#10 t3=0; #10 t0=1;
		
		#10 t0=0;
		
		#10 irnew=77; pcnew=13;jp=1;
		#10 t3=1;
		#10 t3=0; #10 t0=1;
		
		#10 t0=0; jp=0;
		
		#20 t3=1;
		#10 t3=0;#10  t0=1;
		
		#10 t0=0;
		
		#20 t3=1;
		#10 t3=0; #10 t0=1;
		
		#10 t0=0;
		
		#20 t3=1;
		#10 t3=0; #10 t0=1;
		
		
		
	

		// Wait 100 ns for global reset to finish
		#100 $finish;
        
		// Add stimulus here

	end
      
endmodule

