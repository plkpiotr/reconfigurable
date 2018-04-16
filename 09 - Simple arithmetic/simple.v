`timescale 1ns / 1ps

module simple (
        input [14:0] A,
        input [14:0] B,
        input [14:0] C,
        input clk,
        input ce,
        output [30:0] Y
    );

    wire signed [14:0] lag;
    wire signed [15:0] D;
    wire signed [30:0] out;
    
    c_addsub_0 c_addsub_0 (
        .A(A),
        .B(B),
        .CLK(clk),
        .CE(ce),
        .S(D) 
    );
        
    delay #(
        .SIZE(15)
    ) delay (
        .clk(clk),
        .d(C),
        .q(lag)
    );
    
    mult_gen_1 mult_gen_1 (
        .CLK(clk),
        .A(lag),
        .B(D),
        .P(out)
    );
    
    assign Y = out;
    
endmodule // simple
