`timescale 1ns / 1ps

module complex (
    input [7:0] x,
    input [7:0] y,
    output z
);
    wire[7:0] levelFirst;
    wire[3:0] levelScond;
    wire[1:0] levelThird;
    wire levelFourth;
    genvar i;
	generate
		for(i=0; i<8; i=i+1)
		begin
			assign levelFirst[i] = x [i] && y[i];
			if (i % 2 == 1)
			begin
				assign levelScond[(i-1)/2] = levelFirst[i-1] || levelFirst[i];
			end
			if (i % 4 == 3)
			begin
				assign levelThird[(i-3)/4] = levelScond[(i-3)/2] && levelScond[(i-1)/2];
			end
			if (i % 8 == 7)
			begin 
				assign levelFourth = levelThird[i-7] || levelThird[i-6];
			end
		end
		assign z = levelFourth;
	endgenerate
endmodule
