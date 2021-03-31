`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2021 21:40:38
// Design Name: 
// Module Name: vedic_mult2x2
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


module vedic_mult(
    input [1:0] a,b,
    output [3:0] ans
    );
    wire temp,temp1;
    wire w1,w2,w3,w4;
    //and a3(ans[0],a[0],b[0]);
    toffoli_gate a3(a[0],b[0],1'b0,temp,temp1,ans[0]);
    //and a4(w1,a[0],b[1]);
    toffoli_gate a4(a[0],b[1],1'b0,temp,temp1,w1);
    //and a5(w2,a[1],b[0]);
    toffoli_gate a5(a[1],b[0],1'b0,temp,temp1,w2);
    full_add f1(w1,w2,ans[1],w3);
    //and a6(w4,a[1],b[1]);
    toffoli_gate a6(a[1],b[1],1'b0,temp,temp1,w4);
    full_add f2(w3,w4,ans[2],ans[3]);
endmodule
