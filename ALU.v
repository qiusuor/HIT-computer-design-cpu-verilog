`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:08 07/13/2017 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module alu(t1,rst,nPREQ,nPRD,nPWR,IOAD,IODB,jp,aluout,data,ir,wbr,wbin,nDRD,nDWR
    );
input nDRD,nDWR;
input t1,rst,wbr,wbin;
input [15:0] ir;
output nPREQ,nPRD,nPWR;
output [1:0] IOAD;
output jp;
reg jp;
reg nPREQ,nPRD,nPWR;
reg [1:0] IOAD;
inout [7:0]IODB;
output [15:0] aluout;
reg [15:0] aluout;

inout [7:0] data;


assign IODB=(nPWR==0)?register[ir[10:8]]:8'bz;
assign data=(nDWR==0)?register[ir[10:8]]:8'bz;
reg [7:0] register[7:0];
reg[3:0] i;
always @(*) begin  $display("now ir is: %b",ir);
if(rst) begin nPREQ<=1;nPRD<=1;nPWR<=1;IOAD<=2'bz;aluout<=16'b0000000000000000;for(i=0;i<=7;i=i+1) register[i]<=0;jp<=0;end
else if(nDRD==0) begin  register[ir[10:8]]<=data;$display("lda in: %b",data);end
else if(wbin) begin  register[ir[10:8]]<=IODB;end
else if(wbr) register[ir[10:8]]<=aluout[7:0];
else if(t1)begin case(ir[15:11])
	5'b00110: begin aluout<=register[ir[10:8]]+register[ir[2:0]];jp<=0;nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b00100: begin aluout<=register[ir[10:8]]-register[ir[2:0]];jp<=0;nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b01010: begin register[ir[10:8]]<=register[ir[2:0]];jp<=0;nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b01000: begin register[ir[10:8]]<=ir[7:0];jp<=0;nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b01100: begin aluout<={register[7],ir[7:0]};jp<=0; nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b01110: begin aluout<={register[7],ir[7:0]}; jp<=0;nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b00010: begin if(register[ir[10:8]]==0) jp<=1; else jp<=0; aluout<={register[7],ir[7:0]}; nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b00000: begin jp<=1; aluout<={register[7],ir[7:0]}; nPREQ<=1;nPRD<=1;nPWR<=1;end
	5'b10010: begin IOAD<=ir[1:0];nPREQ<=0;nPRD<=0;nPWR<=1; jp<=0;end
	5'b10000: begin IOAD<=ir[1:0];nPREQ<=0;nPRD<=1;nPWR<=0;jp<=0; end
	endcase    
end
end
endmodule
