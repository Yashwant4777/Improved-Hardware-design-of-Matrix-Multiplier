`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2021 21:21:57
// Design Name: 
// Module Name: rc_adder_pg
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
    assign carry_out = c3;
endmodule
