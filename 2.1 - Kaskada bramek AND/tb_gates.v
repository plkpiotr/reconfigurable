`timescale 1ns / 1ps

module tb_gates # (
    parameter LENGTH = 8) ();

    reg clock = 1'b0;
    reg[LENGTH-1:0] inTestbench = 8'b00000000;
    wire outTestbench;

    initial begin
        while (1) begin
            #1 clock=1'b0;
            #1 clock=1'b1;
        end
    end

    always @(posedge clock) begin
        inTestbench <= inTestbench + 1;
    end

    led_button dut (
		.in(inTestbench),
		.out(outTestbench)
    );

endmodule //tb_gates
