`timescale 1ns / 1ps

module mysterious (
        input [7:0] x,
        input [2:0] a,
        output y
    );
    assign y = x[a];
endmodule