`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 15:45:25
// Design Name: 
// Module Name: rev_or
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


module rev_or(
    input a,b,
    output c
    );
    wire w1,w2,w3;
    hng_gate h_or(a,b,1'b1,1'b0,w1,w2,w3,c);
endmodule
