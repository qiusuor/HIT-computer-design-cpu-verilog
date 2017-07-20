`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:06 07/12/2017 
// Design Name: 
// Module Name:    four_beat_generator 
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
module four_beat_generator(clk,rst,t
    );
input clk,rst;
output [3:0] t;
reg [3:0] t;

always @(posedge clk or posedge rst)
begin
	if(rst) t<=4'b0000;
	else case (t)
	4'b0001: t<=4'b0010;
	4'b0010: t<=4'b0100;
	4'b0100: t<=4'b1000;
	default:  t<=5'b0001;
	endcase
end


endmodule
