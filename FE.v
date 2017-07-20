`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:13 07/13/2017 
// Design Name: 
// Module Name:    fe 
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
module fe(rst,t0,t3,irr,ir,pcnew,irnew,jp,pc
    );
input rst,t0,t3,jp;
input [15:0] pcnew;
input [15:0] irnew;

output irr;
output [15:0] ir;
output [15:0] pc;
reg irr;
reg [15:0] ir;
reg [15:0] pc;

reg tag;
always @(posedge rst or posedge t0 or posedge t3)
begin 
if(rst) begin ir=16'bz; irr=0; pc=0;tag=1;end
else if(t3) begin if(jp) pc=pcnew; irr=1;end
else if(t0) begin  if(tag) begin ir=0; tag=0;end else ir=irnew; irr=0;pc=pc+2; end
end                           
endmodule
