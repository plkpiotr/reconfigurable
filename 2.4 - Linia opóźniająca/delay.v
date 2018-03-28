`timescale 1ns / 1ps

module delay # (
        parameter N = 1
    ) (
        input clk,
        input [N-1:0] d,
        output [N-1:0] q
    );

    reg [N-1:0] val = 0;

    always @(posedge clk) begin
        val <= d;
    end

    assign q = val;

endmodule

module delay_line # (
        parameter N = 1,
        parameter DELAY = 1
    ) (
        input [N-1:0] idata,
        input clk,
        output [N-1:0] odata
    );

    wire [N-1:0] tdata [DELAY:0];

    assign tdata[0] = idata;

    generate
        for (genvar i = 0; i < DELAY; i = i + 1) begin
            delay #(
                .N(N)
            ) delay_i (
                .clk(clk),
                .d(tdata[i]),
                .q(tdata[i+1])
            );
        end
    endgenerate

    assign odata = tdata[DELAY];

endmodule
