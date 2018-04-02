`timescale 1ns / 1ps

module tb_or_gate ();

    wire clk;
    wire [9:0] in;
    wire y;

    tb_or_gate dut (
        .i(in),
        .o(y)
    );

    stimulate stim (
        .clk(clk),
        .out(in)
    );

    test test_i (
        .in(in),
        .out(y)
    );

endmodule // tb_or_gate

module stimulate (
        output clk,
        output [9:0] out
    );

    reg clock = 1'b1;
    reg [9:0] out_s = 10'b0000000000;

    initial begin
        while (1) begin
            #1; clock <= 1'b0;
            #1; clock <= 1'b1;
        end
    end

    always @(posedge clk) begin
        out_s <= out_s + 1;
    end

    assign clk = clock;
    assign out = out_s;

endmodule // stimulate

module test (
        input [9:0] in,
        input out
    );

    integer file, i;
    reg checked = 1'b0;

    initial begin
        file = $fopen("C:/Users/Piotr/Desktop/input.txt", "wb");
        #2;
            for (i = 0; i < 9; i = i + 1) begin
                checked = checked | in[i];
            end
            if (checked != out)
                $fwrite(file, "Test failed", in);
        $fclose(file);
    end

endmodule // test
