clc;
clear all;
close all;

sequence = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
accumulator = fi(0, 0, 13, 4);

for i = 1:10
    
   accumulatorFixed(i) = fi(sequence(i), 0, 13, 4);
   accumulator = accumpos(accumulator, accumulatorFixed(i));
   accumulatorBinary(i, :) = bin(accumulatorFixed(i));
   
end

result = bin(accumulator);
