function [x, n] = delta(n1, n0, n2)
% Syntax: [x, n] = delta(n1, n0, n2)
%
% Generate a unit impulse (delta) located at n0
% n is defined from n1 to n2

if (n0 < n1) || (n0 > n2) 
   error('n0 is outside signal range');
end

n = (n1:n2)'; %x=[n-n0==0];
x = zeros(size(n));
ind = find(n - n0 == 0);
x(ind) = ones(size(ind));

   