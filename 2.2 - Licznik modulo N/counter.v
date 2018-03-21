`timescale 1ns / 1ps

module counter # (
    parameter MODULO = 4,
    parameter WIDTH = $clog2(MODULO)
) (
    input clk,
    input ce,
    input rst,
    output [WIDTH-1:0] out
);
    reg [WIDTH-1:0] val = 0;
    always @(posedge clk)
    begin
        if(rst) 
            val <= 0;
        else
            if(ce)
                if(val == N-1) 
                    val <= 0;
                else 
                    val <= val + 1;
            else 
                val <= val;
    end
    assign out = val;
endmodule
