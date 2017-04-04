function [y1, y2, n] = timealign(x1, n1, x2, n2)
% Syntax: [y1, y2, n] = timealign(x1, n1, x2, n2)
%
% Time align x1, x2, so they have the same range n
% the resulting y1, y2 will be zero padded
%
% x1, x2, are assumed to be row vectors

L1 = length(x1);
L2 = length(x2);

n = min(n1(1), n2(1)):max(n1(L1), n2(L2));
L = length(n);

y1 = zeros(1, L);
y1(find((n >= min(n1)) & (n <= max(n1)))) = x1;

y2 = zeros(1, L); 
y2(find((n >= min(n2)) & (n <= max(n2)))) = x2;