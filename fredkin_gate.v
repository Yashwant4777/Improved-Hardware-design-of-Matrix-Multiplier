`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2021 18:39:54
// Design Name: 
// Module Name: fredkin_gate
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


module fredkin_gate(
    input x,y,z,
    output p,q,r
    );
    assign p = x;
    assign q = ~x&y ^ x&z;
    assign r = ~x&z ^ x&y;
endmodule
