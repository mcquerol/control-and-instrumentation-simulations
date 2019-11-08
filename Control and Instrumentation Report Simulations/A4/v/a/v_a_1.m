% transfer funtion G(s) = 1/(s(s+1)(s+5))
% numerator is 1
% denominator expanded is s^3 + 6s^2 + 5s^1 + 0s^0
% denominator array is written as the coefficients of each term, in
% descending order of the exponents 

num = [1];
den = [1 6 5 0];

% root locus plot of G(s)
rlocus(num,den);