clc;
clear all;
close all;

first = 0.32345;
second = -0.78743;
third = 0.56532;

firstSign = 0;
secondSign = 1;
thirdSign = 0;

precisionIntegral = 1;
differences = zeros(1, 17);

for precisionFractional = 0:16

    firstFixed = fi(first, firstSign, 1 + precisionIntegral + precisionFractional, precisionFractional);
    secondFixed = fi(second, secondSign, 1 + precisionIntegral + precisionFractional, precisionFractional);
    thirdFixed = fi(third, thirdSign, 1 + precisionIntegral + precisionFractional, precisionFractional);
    
    firstDouble = double(firstFixed);
    secondDouble = double(secondFixed);
    thirdDouble = double(thirdFixed);
    
    result = (first + second) * third;
    resultDouble = (firstDouble + secondDouble) * thirdDouble;

    differences(precisionFractional + 1) = abs(result - resultDouble);

end

semilogy(differences, 'o', 'MarkerFaceColor', [.50 .70 .90]);
axis([1 17 10e-8 1]);
title('Differences according to the precision');
grid on;
grid minor;
