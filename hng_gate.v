`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2021 18:37:52
// Design Name: 
// Module Name: hng_gate
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


module hng_gate(
    input a,b,c,d,
    output p,q,r,s
    );
    assign p = a;
    assign q = b;
    assign r = a^b^c;
    assign s = (a^b)&c^(a&b)^d;
endmodule
