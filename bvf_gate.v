`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 13:51:30
// Design Name: 
// Module Name: bvf_gate
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


module bvf_gate(
    input a,b,c,d,
    output w,x,y,z
    );
    assign w = a;
    assign x = a^b;
    assign y = c;
    assign z = c^d;
endmodule
