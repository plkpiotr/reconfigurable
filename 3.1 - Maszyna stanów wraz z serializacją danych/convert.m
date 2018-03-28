close all;
clear all;
clc;

input = fopen('input.txt', 'r');
out = fopen('output.txt', 'w+');
next = fscanf(input, '%c');

for index = 1:7
    next(index)
    current = double(next(index));
    current = dec2bin(current);
    current = fliplr(current);
    fprintf(out, '001');
    fprintf(out, current);
    fprintf(out, '00');
end

fclose(input);
fclose(output);
