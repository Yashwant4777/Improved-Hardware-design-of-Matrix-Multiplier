`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 15:07:35
// Design Name: 
// Module Name: vedic4x4_mult
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


module vedic4x4_mult(
    input [3:0] a,b,
    output [7:0] res
    );
    wire[3:0] w1,w2,w3,w4,rc1_sum;
    wire rc1_carry,rc2_carry,or_out,adder_out,w8;
    vedic2x2_mult vm1(a[1:0],b[1:0],w1);
    assign res[1:0] = w1[1:0];
    vedic2x2_mult vm2(a[3:2],b[1:0],w2);
    vedic2x2_mult vm3(a[1:0],b[3:2],w3);
    vedic2x2_mult vm4(a[3:2],b[3:2],w4);
    rev_rcadder rc1(w2,w3,rc1_sum,rc1_carry);
    rev_rcadder rc2(rc1_sum,{w4[1:0],w1[3:2]},res[5:2],rc2_carry);
    rev_or or1(rc1_carry,rc2_carry,or_out);
    rev_halfadder half_adder1(or_out,w4[2],res[6],adder_out);
    rev_halfadder half_adder2(adder_out,w4[3],res[7],w8);
endmodule
