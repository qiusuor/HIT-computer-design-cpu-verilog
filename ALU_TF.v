`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:41:42 07/19/2017
// Design Name:   alu
// Module Name:   F:/Xilinx/ise-progject/cpu_verilog_new/test_alu.v
// Project Name:  cpu_verilog_new
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_alu;

	// Inputs
	reg t1;
	reg rst;
	reg [15:0] ir;
	reg wbr;
	reg wbin;
	reg nDRD;
	reg nDWR;

	// Outputs
	wire nPREQ;
	wire nPRD;
	wire nPWR;
	wire [1:0] IOAD;
	wire jp;
	wire [15:0] aluout;

	// Bidirs
	wire [7:0] IODB;
	wire [7:0] data;
	reg [7:0] io;
	reg [7:0] dt;
	assign IODB=(nPRD==0)?io:8'bz;
	assign data=(nDRD==0)?dt:8'bz;
	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.t1(t1), 
		.rst(rst), 
		.nPREQ(nPREQ), 
		.nPRD(nPRD), 
		.nPWR(nPWR), 
		.IOAD(IOAD), 
		.IODB(IODB), 
		.jp(jp), 
		.aluout(aluout), 
		.data(data), 
		.ir(ir), 
		.wbr(wbr), 
		.wbin(wbin), 
		.nDRD(nDRD), 
		.nDWR(nDWR)
	);

	initial begin
		// Initialize Inputs
		t1 = 0;
		rst = 0;
		ir = 16'b0000000010110101; //jmp
		wbr = 0;
		wbin = 0;
		nDRD = 1;
		nDWR = 1;
		io=8'b10100111;
		dt=8'b01001100;
		
		#1 rst=1;
		#1 rst=0;
		
		#13 t1=1;
		
		#10 t1=0;
		
		#5 ir=16'b0100011110101110;//moi r7,
		#25 t1=1;
		
		
		#10 t1=0;
		
		#5 //$stop; 
		ir=16'b0000000010110100;//jmp
		#25 t1=1;
		
		#10 t1=0;
		
		#5 //$stop;
		ir=16'b0101000000000111;//mov r0,r7
		#25 t1=1;
		
		#10 t1=0;
		
		#5 //$stop;
		ir=16'b0001000010111000; //jz r0,x
		#25 t1=1;
		
		#10 t1=0;
		
		#5 ir=16'b1000000000000001; //out r0,1  there r0=8'b10101110;
		#25 t1=1;
		
		#10 t1=0;
		
		#5 ir=16'b1001000000000011; //in r0,1
		#25 t1=1;
		
		#10 t1=0; 
		
		#5 ir=16'b0110000000000011; //sta r0,11
		#5 wbin=1;
		#10 wbin=0;
		#10 t1=1;
		#10 t1=0; nDWR=0;
		#10 nDWR=1;
		
		#5 ir=16'b0111000000000111; //lda r0,111
		#15 t1=1;
		
		#10 t1=0; nDRD=0;
		#10 nDRD=1;
		#20 t1=1;
		
		#10 t1=0;
		
		#30 t1=1;
		
		#10 t1=0;
		
		#30 t1=1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

