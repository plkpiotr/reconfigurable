`timescale 1ns / 1ps

module stimulate (
        output [7:0] x,
        output [2:0] a
    );
    
    reg [7:0] inc_x=8'b00000000;
    reg [2:0] inc_a=3'b000;
    reg clk = 1'b0;
	
    initial
    begin
        while(1)
        begin
            #1; clk = 1'b0;
            #1; clk = 1'b1;
        end
    end
    
    always @(posedge clk)
    begin
        inc_x = inc_x + 1;
        inc_a = inc_a + 1;
    end
    
    assign x = inc_x;
    assign a = inc_a;
endmodule

module tb_mysterious ();

    wire [7:0] x;
    wire [2:0] a;
    wire y;
	
    stimulate stim_i (
        .x(x),
        .a(a)
    );
    
    mysterious dut (
        .x(x),
        .a(a),
        .y(y)
    );
endmodule