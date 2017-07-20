`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:29:45 07/17/2017
// Design Name:   cpu
// Module Name:   F:/Xilinx/ise-progject/cpu_verilog/test_cpu.v
// Project Name:  cpu_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_cpu;

	// Inputs
	reg CLK;
	reg RST;

	// Outputs
	wire [15:0] ABUS;
	wire nMREQ;
	wire nRD;
	wire nWR;
	wire nBHE;
	wire nBLE;
	wire [1:0] IOAD;
	wire nPREQ;
	wire nPRD;
	wire nPWR;

	// Bidirs
	wire [15:0] DBUS;
	wire [7:0] IODB;
	reg [15:0] db;
	reg [7:0] io;
	
	assign DBUS=(nWR)?db:16'bz;
	assign IODB=(!nPRD)?io:8'bz;
	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.CLK(CLK), 
		.RST(RST), 
		.ABUS(ABUS), 
		.DBUS(DBUS), 
		.nMREQ(nMREQ), 
		.nRD(nRD), 
		.nWR(nWR), 
		.nBHE(nBHE), 
		.nBLE(nBLE), 
		.IOAD(IOAD), 
		.IODB(IODB), 
		.nPREQ(nPREQ), 
		.nPRD(nPRD), 
		.nPWR(nPWR)
	);
always #5 CLK=~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;
		io=8'b10100111;
		db=0;
		#1 RST=1;
		#1 RST=0;
		
		#40 db=16'b0100000001111111;//mvi a0,
		#40 db=16'b1000000000000000;//out a0,00
		#40 db=16'b0001000000000000;//jz a0,0
		
		#40 db=16'b0100000101111110;//mvi  a1,
		#40 db=16'b0010000000000001; //sub a0,a1
		#40 db=16'b1000000000000000;//out a0,00
		
		#40 db=16'b0101000000000001;//mov  a0,a1
		#40 db=16'b1000000000000000;//out a0,00
		
		#40 db=16'b1001000000000001;//in a0,00
		#40 db=16'b1000000000000000;//out a0,00
		
		#40 db=16'b0100000001111110;//mvi  a1,
		#40 db=16'b1000000000000000;//out a0,00
		#40 db=16'b0110000000000000;//sta a0,0
		
		#40 db=16'b0111000000000000;//lda a0,0
		#20 db=16'b0111000011111111;//¸øÊý¾Ý
		#20 db=16'b1000000000000000;//out a0,00
		#100 $stop;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

