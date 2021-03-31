`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 14:50:20
// Design Name: 
// Module Name: vedic2x2_mult
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


module vedic2x2_mult(
    input [1:0] a,b,
    output [3:0] q_out
    );
    wire w1,w2,i0,i1,g1,w3,w4,w5,g2,w6;
    bvf_gate bvf1(b[0],1'b0,b[1],1'b0,w1,i0,w2,i1);
    bme_gate bme1(a[1],i0,1'b0,i1,g1,w3,w4,g2);
    bme_gate bme2(a[0],b[0],1'b0,b[1],g1,q_out[0],w5,g2);
    peres_gate peres1(w5,w3,1'b0,g1,q_out[1],w6);
    cnot_gate cnot1(w6,w4,q_out[3],q_out[2]);
endmodule
