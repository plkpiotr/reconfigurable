`timescale 1ns / 1ps

module tb_complex ();
  reg clk = 1'b0;
  reg [15:0] cnt = 16'b0000000000000000;
  wire out;

  initial begin
    while(1) begin
      #1; clk = 1'b0;
      #1; clk = 1'b1;
      end
  end

  always @(posedge clk) begin
    cnt <= cnt + 1;
  end

  complex dut (
    .x(cnt[7:0]),
    .y(cnt[15:8]),
    .z(out)
  );

endmodule
