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
    reg [2:0] index = 3'b000;
    reg [7:0] letter = 8'b00000000;

    always @ (posedge clk) begin
      if (rst) begin
        current = STATE0;
        index = 3'b000;
        letter = 8'b000000000;
      end
      else begin
        case (current)
          STATE0 : begin
            if (send == 1 && previous == 0) begin
              letter = data;
              current = STATE1;
            end
          end
          STATE1 : begin
            next = 1'b1;
            current = STATE2;
          end
          STATE2 : begin
            next = letter[index];
            index = index + 1;
            if (index == 3'b000)
              current = STATE3;
          end
          STATE3 : begin
            next = 1'b0;
            current = STATE0;
          end
        endcase
      end
      previous = send;
    end

    assign txd = next;

endmodule //machine
