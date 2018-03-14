`timescale 1ns / 1ps

module led_button # (
    parameter MODULO = 7,
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
                if(val == MODULO-1) 
                    val <= 0;
                else 
                    val <= val + 1;
            else 
                val <= val;
    end
    assign out = val;
endmodule
