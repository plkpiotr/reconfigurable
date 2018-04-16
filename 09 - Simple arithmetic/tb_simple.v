`timescale 1ns / 1ps

module tb_simple ();
    wire signed [14:0] A = 15'b000101001011010;
    wire signed [14:0] B = 15'b110011011001101;
    wire signed [14:0] C = 15'b001001000010111;
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
