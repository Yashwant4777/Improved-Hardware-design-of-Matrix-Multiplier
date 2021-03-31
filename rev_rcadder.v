`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 15:30:13
// Design Name: 
// Module Name: rev_rcadder
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


module rev_rcadder(
    input [3:0] a,b,
    output [3:0] sum,
    output carry_out
    );
    wire w1,w2,w3,w4,w5,w6,w7;
    hng_gate h1(a[0],b[0],1'b0,1'b0,w1,w2,sum[0],w3);
    hng_gate h2(a[1],b[1],w3,1'b0,w1,w2,sum[1],w4);
    hng_gate h3(a[2],b[2],w4,1'b0,w1,w2,sum[2],w6);
    hng_gate h4(a[3],b[3],w6,1'b0,w1,w2,sum[3],w7);
    assign carry_out = w7;
endmodule
