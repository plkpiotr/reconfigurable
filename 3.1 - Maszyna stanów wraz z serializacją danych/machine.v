`timescale 1ns / 1ps

module machine (
    input clk,
    input rst,
    input send,
    input [7:0] data,
    output txd
    );

    localparam STATE0 = 2'd0;
    localparam STATE1 = 2'd1;
    localparam STATE2 = 2'd2;
    localparam STATE3 = 2'd3;

    reg previous = 1'b0;
    reg next = 1'b0;
    reg [1:0] current = STATE0;
    reg [2:0] index = 3'b0;
    reg [7:0] letter = 8'b0;

    always @ (posedge clk) begin
      if (rst)
    end
