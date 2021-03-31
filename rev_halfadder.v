`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 15:48:45
// Design Name: 
// Module Name: rev_halfadder
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


module rev_halfadder(
    input a,b,
    input sum,carry
    );
    wire w1,w2,w3,w4;
    toffoli_gate toff_half1(1'b1,a,b,w1,w2,sum);
    toffoli_gate toff_half2(a,b,1'b0,w3,w4,carry);
endmodule
