`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:20:38 07/19/2017
// Design Name:   control
// Module Name:   F:/Xilinx/ise-progject/cpu_verilog_new/test_control.v
// Project Name:  cpu_verilog_new
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_control;

	// Inputs
	reg rst;
	reg irr;
	reg [15:0] pc;
	reg [15:0] aluout;
	reg nDRD;
	reg nDWR;
	reg t1;

	// Outputs
	wire [15:0] irnew;
	wire [15:0] abus;
	wire nmreq;
	wire nrd;
	wire nwr;
	wire nbhe;
	wire nble;

	// Bidirs
	wire [7:0] data;
	wire [15:0] dbus;
	
	reg [15:0] db; reg [7:0] dt;
	assign dbus=(nrd==0)?db:16'bz;
	assign data=(nwr==0)?dt:8'bz;
	// Instantiate the Unit Under Test (UUT)
	control uut (
		.rst(rst), 
		.t1(t1),
		.irr(irr), 
		.pc(pc), 
		.irnew(irnew), 
		.aluout(aluout), 
		.data(data), 
		.nDRD(nDRD), 
		.nDWR(nDWR), 
		.abus(abus), 
		.dbus(dbus), 
		.nmreq(nmreq), 
		.nrd(nrd), 
		.nwr(nwr), 
		.nbhe(nbhe), 
		.nble(nble)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		irr = 0;
		pc = 0;
		t1=0;
		aluout = 33;
		nDRD = 1;
		dt=8'b11100011;
		db=16'b0010001110011001;
		nDWR = 1;
		#1 rst=1;
		#1 rst=0;
		
		#18 irr=1;
		#10 irr=0; 
		
		#20 nDRD=0;
		#10 nDRD=1;
		#20 t1=1;
		#10 t1=0;nDWR=0;
		#10 nDWR=1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

