`timescale 1ns / 1ps

module tb_simple ();
    wire signed [14:0] A = 15'b0000000000000001;
    wire signed [14:0] B = 15'b0000000000000010;
    wire signed [14:0] C = 15'b0000000000000100;
    wire signed [30:0] Y;
    
    wire ce = 1'b1;
    wire clk;

    stimulate stimulate (
        .clk(clk)
    );
    
    add_multiply add_multiply (
        .A(A),
        .B(B),
        .C(C),
        .clk(clk),
        .ce(ce),
        .Y(Y)
    );
    
endmodule // tb_simple
