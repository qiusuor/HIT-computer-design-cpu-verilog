`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:17:03 07/13/2017 
// Design Name: 
// Module Name:    MR 
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
module MR(rst,t2,ir,nDRD,nDWR
    );
input rst,t2;
input [15:0] ir;
output nDRD,nDWR;
reg nDRD,nDWR;

always @(t2,rst,ir)
begin
	if(rst) begin
		nDRD<=1; nDWR<=1; end
	else if(t2) begin case(ir[15:11])
	5'b01100: begin nDRD<=1;nDWR<=0;end 
	5'b01110: begin nDRD<=0;nDWR<=1;end
	default: begin nDRD<=1;nDWR<=1; end
	endcase end
	else begin nDRD<=1;nDWR<=1; end
end
endmodule
