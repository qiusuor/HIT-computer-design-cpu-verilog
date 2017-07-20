`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:07 07/13/2017 
// Design Name: 
// Module Name:    WB 
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
module WB(t3,rst,wbin,wbr,ir
    );
input t3,rst;
input [15:0] ir;
output wbin,wbr;
reg wbin,wbr;


always @(t3,rst,ir)
begin
if(rst) begin  wbin<=1'b0;wbr<=1'b0; end
else if(t3) begin
	case (ir[15:11])
	5'b00110,5'b00100: begin wbr<=1;wbin<=0;end
	5'b10010: begin wbr<=0;wbin<=1;end
	default: begin wbr<=0;wbin<=0;end
	endcase
	end
else begin  wbin<=1'b0;wbr<=1'b0; end
end


endmodule
