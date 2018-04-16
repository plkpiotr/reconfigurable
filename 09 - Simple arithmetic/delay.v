`timescale 1ns / 1ps

module delay # (
    parameter SIZE = 1
    ) (
        input clk,
        input [SIZE-1:0] d,
        output [SIZE-1:0] q
    );

    reg [SIZE-1:0] val = 0;

    always @(posedge clk) begin
        val <= d;
    end

    assign q = val;

endmodule //delay
