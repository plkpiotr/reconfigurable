`timescale 1ns / 1ps

module stimulate # (
        parameter N = 1
    ) (
        output clk,
        output [N-1:0] out
    );

    reg clks = 1'b0;
    reg [N-1:0] outs = 0;

    initial begin
        while(1) begin
            #1; clks <= 1'b0;
            #1; clks <= 1'b1;
        end
    end

    always @(posedge clk) begin
        outs <= outs + 1;
    end

    assign clk = clks;
    assign out = outs;

endmodule //stimulate

module tb_delay ();
    localparam N = 3;
    localparam DELAY = 4;
    wire clk;
    wire [N-1:0] in;
    wire [N-1:0] out;

    stimulate # (
        .N(N)
    ) stim_i (
        .clk(clk),
        .out(in)
    );

    delay_line # (
        .N(N),
        .DELAY(DELAY)
    ) dut (
        .clk(clk),
        .idata(in),
        .odata(out)
    );

endmodule //tb_delay
