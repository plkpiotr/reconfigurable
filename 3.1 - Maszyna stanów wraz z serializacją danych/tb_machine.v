`timescale 1ns / 1ps

module tb_machine ();

  reg clk = 1'b0;

  wire rst = 1'b0;
  wire send;
  wire [7:0] data;
  wire txd;

  initial begin
    while (1) begin
      #1; clk = 1'b0;
      #1; clk = 1'b1;
    end
  end

  machine dut (
    .clk(clk),
    .rst(rst),
    .send(send),
    .data(data),
    .txd(txd)
  );

  load load_i (
    .send(send)
    .data(data)
  );

  save save_i (
    in(txd)
  );

endmodule

module load (
  output send,
  output [7:0] data
  );

  integer file;
  reg []
