`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2021 21:09:28
// Design Name: 
// Module Name: full_adder_pg
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


module full_adder_pg(
    input a,b,
    output sum,carry
    );
    wire w1,fpg1_q,fpg1_r;
    peres_gate fpg1(a,b,1'b0,w1,fpg1_q,fpg1_r);
    peres_gate fpg2(fpg1_q,1'b0,fpg1_r,w1,sum,carry);
endmodule
