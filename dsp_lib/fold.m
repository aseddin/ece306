function [y, ny] = fold(x, nx)
% Syntax: [y, ny] = fold(x, nx)
%
% reflect x about the origin

[nx1, nx2] = size(x); 
[n1, n2] = size(nx);

if nx1 > nx2
    y = flipud(x); 
else
    y = fliplr(x); 
end

if n1 > n2
    ny = -flipud(nx);
else
    ny = -fliplr(nx); 
end
