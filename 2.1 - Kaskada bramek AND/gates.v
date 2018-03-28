`timescale 1ns / 1ps

module gates # (
    parameter LENGTH = 8 ) (
		input [LENGTH-1:0] in,
		output out
    );

    wire [LENGTH:0] chain;
    assign chain[0] = 1'b1;

    generate
        for (genvar i = 1; i <= LENGTH; i = i + 1)
        begin
            assign chain[i] = chain [i - 1] & in[i - 1];
        end
    endgenerate

    assign out = chain[LENGTH];
    
endmodule
