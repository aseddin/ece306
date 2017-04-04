function [y, n] = shift(x, n, n0)
% Syntax: [y, n] = shift(x, n, n0)
%
% shift x by n0
% y[n] = x[n - n0]

y = x;
n = n + n0;