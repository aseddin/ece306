function [x, n] = unitpulse(n1, n2, n3, n4)
% Syntax: [x, n] = unitpulse(n1, n2, n3, n4)
%
% Generate a pulse train starting at n2 and ending n3
% n is defined from n1 to n4\

n = (n1:n4)';
x = zeros(size(n));
ind = find(n >= n2 & n <= n3);
x(ind) = ones(size(ind));