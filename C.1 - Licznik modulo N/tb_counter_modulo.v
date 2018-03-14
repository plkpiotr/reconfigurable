`timescale 1ns / 1ps

module counter_modulo # (
    parameter MODULO = 7,
    parameter WIDTH = $clog2(MODULO)
) (
);

reg clk = 1'b0;
reg ce = 1'b1;
reg rst = 1'b0;
wire [WIDTH-1:0] out;
reg [WIDTH-1:0] cnt = WIDTH-1'b0;

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
    cnt <= cnt + 1;
end

cnt_mod_N # (
    .MODULO(MODULO)
) dut (
    .clk(clk),
    .ce(ce),
    .rst(rst),
    .out(out)
);
endmodule
