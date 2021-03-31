`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2021 13:53:57
// Design Name: 
// Module Name: bme_gate
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


module bme_gate(
    input a,b,c,d,
    output w,x,y,z
    );
    assign w = a;
    assign x = (a&b)^c;
    assign y = (a&d)^c;
    assign z = (~a&b)^c^d;
endmodule
