`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2021 18:36:34
// Design Name: 
// Module Name: peres_gate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module peres_gate(
    input a,b,c,
    output p,q,r
    );
    assign p = a;
    assign q = a^b;
    assign r = (a&b)^c;
endmodule
