% transfer funtion G(s) = 1/((s+1)(s+5))
% numerator is 1
% denominator expanded is s^2 + 6s^1 + 5s^0
% denominator array is written as the coefficient in descending order

num = [1];
den = [1 6 5];

% root locus plot of G(s)
rlocus(num,den)