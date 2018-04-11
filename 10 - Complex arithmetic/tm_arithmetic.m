clc;
clear all;
close all;

first = -100.34;
second = 7.367;
third = -4.92;
fourth = 9.111;
fifth = -99.99;
sixth = 134.56;

firstFixed = fi(first, 1, 18, 8);
secondFixed = fi(second, 0, 8, 3);
thirdFixed = fi(third, 1, 12, 7);
fourthFixed = fi(fourth, 0, 8, 2);
fifthFixed = fi(fifth, 1, 14, 5);
sixthFixed = fi(sixth, 0, 19, 9);

seventhFixed = firstFixed + secondFixed;
eighthFixed = seventhFixed * thirdFixed;
ninthFixed = fourthFixed + fifthFixed;
tenthFixed = fifthFixed + sixthFixed;
eleventhFixed = ninthFixed * tenthFixed;
twelfthFixed = eighthFixed + eleventhFixed;

firstBinary = bin(firstFixed);
secondBinary = bin(secondFixed);
thirdBinary = bin(thirdFixed);
fourthBinary = bin(fourthFixed);
fifthBinary = bin(fifthFixed);
sixthBinary = bin(sixthFixed);
seventhFixedBinary = bin(seventhFixed);
tenthFixedBinary = bin(tenthFixed);
ninthFixedBinary = bin(ninthFixed);
eighthFixedBinary = bin(eighthFixed);
eleventhFixedBinary = bin(eleventhFixed);
twelfthFixedBinary = bin(twelfthFixed);

