`timescale 1ns / 1ps

module tb_counter # (
    parameter MODULO = 7,
    parameter WIDTH = $clog2(MODULO)
) ();

  	reg clk = 1'b0;
    reg ce = 1'b1;
    reg rst = 1'b0;
    wire [WIDTH-1:0] out;
    reg [29:0] cnt = 29'b0;

    initial begin
      while(1) begin
        #10; clk = 1'b0;
        #10; clk = 1'b1;
      end
    end

    always @(posedge clk) begin
      cnt <= cnt + 1;
      if (cnt == 20)
        rst <= 1'b1;
      else if (cnt == 30)
        rst <= 1'b0;
    end

    counter # (
      .MODULO(MODULO)
    ) dut (
      .clk(clk),
      .ce(ce),
      .rst(rst),
      .out(out)
    );

endmodule
