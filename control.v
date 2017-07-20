`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:50:12 07/15/2017 
// Design Name: 
// Module Name:    control 
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
module control(t1,rst,irr,pc,irnew,aluout,data,nDRD,nDWR,abus,dbus,nmreq,nrd,nwr,nbhe,nble
    );
input t1,rst,irr,nDRD,nDWR;
input [15:0] pc;
output [15:0] irnew;
input [15:0] aluout;
inout [7:0] data;
output nrd,nwr,nmreq,nble,nbhe; reg nrd,nwr,nmreq,nble,nbhe;
inout [15:0] dbus;
output [15:0] abus; 

assign abus=(irr)?pc:(16'bz);
assign abus=(nDWR==0 | nDRD==0 | t1)?(aluout>>1):16'bz;
assign irnew=dbus;
assign dbus=(nDWR==0)?{8'bz,data}:16'bz;
assign data=(nDRD==0)?dbus[7:0]:8'bz;
always @(rst,irr,nDWR,nDRD,aluout)
begin
if(rst) begin nrd=1;nwr=1;nmreq=1;nble=1;nbhe=1;end
else if(irr) begin nrd=0;nwr=1;nbhe=0;nble=0;nmreq=0;end
else if(nDRD==0) begin nrd=0;nwr=1;if(aluout%2) begin  nble=1;nbhe=0; end else begin   nble=0;nbhe=1; end nmreq=0;end 
else if(!nDWR) begin nrd=1;nwr=0;if(aluout%2) begin  nble=1;nbhe=0; end else begin  nble=0;nbhe=1; end nmreq=0; end
else begin nmreq=1;end
end

endmodule
