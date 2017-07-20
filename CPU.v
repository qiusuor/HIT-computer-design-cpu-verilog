`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:50:21 07/15/2017 
// Design Name: 
// Module Name:    cpu 
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
module cpu(CLK,RST,ABUS,DBUS,nMREQ,nRD,nWR,nBHE,nBLE,IOAD,IODB,nPREQ,nPRD,nPWR
    );

input CLK,RST;
output [15:0]ABUS; 
inout [15:0] DBUS;
output nMREQ,nRD,nWR,nBHE,nBLE; 
output [1:0] IOAD; 
inout [7:0] IODB;
output nPREQ,nPRD,nPWR;

wire [3:0] t;
wire [15:0] ir;
wire nDRD,nDWR;
wire irr;
wire [15:0]aluout;
wire [15:0] irnew;
wire jp;
wire [15:0] pc;
wire ldastart;
wire wbin;
wire wbr;
wire [7:0] data;



four_beat_generator BG(
.clk(CLK),
.rst(RST),
.t(t)
);


MR mr(.rst(RST),
.t2(t[2]),
.ir(ir),
.nDRD(nDRD),
.nDWR(nDWR)
);


fe fetch(.rst(RST),
.t0(t[0]),
.t3(t[3]),
.irr(irr),
.ir(ir),
.pcnew(aluout),
.irnew(irnew),
.jp(jp),
.pc(pc)
);

WB wb(.t3(t[3]),
.rst(RST),
.wbin(wbin),
.wbr(wbr),
.ir(ir)
);

alu au(.t1(t[1]),
.rst(RST),
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


control cn(.t1(t[1]),
.rst(RST),
.irr(irr),
.pc(pc),
.irnew(irnew),
.aluout(aluout),
.data(data),
.nDRD(nDRD),
.nDWR(nDWR),
.abus(ABUS),
.dbus(DBUS),
.nmreq(nMREQ),
.nrd(nRD),
.nwr(nWR),
.nbhe(nBHE),
.nble(nBLE)
);

endmodule
