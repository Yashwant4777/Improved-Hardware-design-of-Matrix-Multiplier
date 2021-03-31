`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 22:13:11
// Design Name: 
// Module Name: matrix_multiplier
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
module toffoli_gate(
    input a,b,c,
    output p,q,r
    );
    assign p = a;
    assign q = b;
    assign r = (a&b)^c;
endmodule

module hng_gate(
    input a,b,c,d,
    output p,q,r,s
    );
    assign p = a;
    assign q = b;
    assign r = a^b^c;
    assign s = (a^b)&c^(a&b)^d;
endmodule

module cnot_gate(
    input a,b,
    output w,x
    );
    assign w = a;
    assign x = a^b;
endmodule

module peres_gate(
    input a,b,c,
    output p,q,r
    );
    assign p = a;
    assign q = a^b;
    assign r = (a&b)^c;
endmodule

module full_adder_pg(
    input a,b,cin,
    output sum,carry
    );
    wire w1,fpg1_q,fpg1_r;
    peres_gate fpg1(a,b,1'b0,w1,fpg1_q,fpg1_r);
    peres_gate fpg2(fpg1_q,cin,fpg1_r,w1,sum,carry);
endmodule

module bme_gate(
    input a,b,c,d,
    output w,x,y,z
    );
    assign w = a;
    assign x = (a&b)^c;
    assign y = (a&d)^c;
    assign z = (~a&b)^c^d;
endmodule

module bvf_gate(
    input a,b,c,d,
    output w,x,y,z
    );
    assign w = a;
    assign x = a^b;
    assign y = c;
    assign z = c^d;
endmodule

module rev_halfadder(
    input a,b,
    input sum,carry
    );
    wire w1,w2,w3,w4;
    toffoli_gate toff_half1(1'b1,a,b,w1,w2,sum);
    toffoli_gate toff_half2(a,b,1'b0,w3,w4,carry);
endmodule

module rev_or(
    input a,b,
    output c
    );
    wire w1,w2,w3;
    hng_gate h_or(a,b,1'b1,1'b0,w1,w2,w3,c);
endmodule

module rc_adder_pg(
    input [3:0] a,b,
    output [3:0] sum,
    output carry_out
    );
    wire c0,c1,c2,c3;
    full_adder_pg rcpg1(a[0],b[0],1'b0,sum[0],c0);
    full_adder_pg rcpg2(a[1],b[1],c0,sum[1],c1);
    full_adder_pg rcpg3(a[2],b[2],c1,sum[2],c2);
    full_adder_pg rcpg4(a[3],b[3],c2,sum[3],c3);
endmodule


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
    rc_adder_pg rc1(w2,w3,rc1_sum,rc1_carry);
    rc_adder_pg rc2(rc1_sum,{w4[1:0],w1[3:2]},res[5:2],rc2_carry);
    rev_or or1(rc1_carry,rc2_carry,or_out);
    rev_halfadder half_adder1(or_out,w4[2],res[6],adder_out);
    rev_halfadder half_adder2(adder_out,w4[3],res[7],w8);
endmodule

module matrix_multiplier(
    input [15:0] arr,brr,
    output [31:0] sum_out
    );
    reg [3:0] A[0:1][0:1];
    reg [3:0] B[0:1][0:1];
    wire [7:0] res[0:1][0:1];
    wire [7:0] w1,w2,w3,w4,w5,w6,w7,w8;
    always@(arr or brr) begin
    {A[0][0],A[0][1],A[1][0],A[1][1]} = arr;
    {B[0][0],B[0][1],B[1][0],B[1][1]} = brr;
    end
    vedic4x4_mult ve_1(A[0][0],B[0][0],w1);
    vedic4x4_mult ve_2(A[0][1],B[1][0],w2);
    assign res[0][0] = w1+w2;
    vedic4x4_mult ve_3(A[0][0],B[0][1],w3);
    vedic4x4_mult ve_4(A[0][1],B[1][1],w4);
    assign res[0][1] = w3+w4;
    vedic4x4_mult ve_5(A[1][0],B[0][0],w5);
    vedic4x4_mult ve_6(A[1][1],B[1][0],w6);
    assign res[1][0] = w5+w6;
    vedic4x4_mult ve_7(A[1][0],B[0][1],w7);
    vedic4x4_mult ve_8(A[1][1],B[1][1],w8);
    assign res[1][1] = w7+w8;
    assign sum_out = {res[0][0],res[0][1],res[1][0],res[1][1]};
endmodule
