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
    .send(send),
    .data(data)
  );

  save save_i (
    .in(txd)
  );

endmodule //tb_machine

module load (
  output send,
  output [7:0] data
  );

  integer file;
  reg flag = 1'b0;
  reg [2:0] counter = 3'b0;
  reg [7:0] transfer = 8'b0;
  reg [7:0] amount [6:0];

  initial begin
    file = $fopen("C:/Users/Piotr/Desktop/input.txt", "rb");
    for (counter = 0; counter < 7; counter = counter + 1) begin
      amount[counter] = $fgetc(file);
    end
    $fclose(file);
    counter = 0;
    while (1) begin
      transfer = amount[counter];
      counter = counter + 1;
      #5; flag <= 1;
      #5; flag <= 0;
      if (counter == 7)
        counter = 0;
    end
  end

  assign data = transfer;
  assign send = flag;

endmodule //load

module save (
  input in
  );

  integer file;
  reg [7:0] counter = 8'b00000000;
  wire data = in;

  initial begin
    file = $fopen("C:/Users/Piotr/Desktop/output.txt", "wb");
    for (counter = 0; counter < 56; counter = counter + 1) begin
      #2; $fwrite(file, "%d", data);
    end
    $fclose(file);
  end

endmodule //save
