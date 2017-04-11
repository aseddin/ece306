%%
% Spring 2017
% HW 1, MATLAB 2
% 
% Anas Salah Eddin, 2017
%
%% Setup
close all; clear all;

% generate x[n]
n = -5:4;
x = [-1, 0, 1, 2, 3, 4, 4, 4, 4, 4];

%% 2 - (b)

% folded x[-n]
[folded_x, folded_n] = fold(x, n);

% shifted x[n - 3]
[shifted_x1, shifted_n1] = shift(x, n, 3);

% shifted x[n+2]
[shifted_x2, shifted_n2] = shift(x, n, -2);

%% 2 - (c)

% stem x[n]
subplot(4, 1, 1);
stem(n, x, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x[n]');
title('\fontsize{16} x[n]');

% stem folded x[-n]
subplot(4, 1, 2);
stem(folded_n, folded_x, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x[-n]');
title('\fontsize{16} x[-n]');

% stem shifted x[n - 3]
subplot(4, 1, 3);
stem(shifted_n1, shifted_x1, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x[n-3]');
title('\fontsize{16} x[n - 3]');

% stem shifted x[n+2]
subplot(4, 1, 4);
stem(shifted_n2, shifted_x2, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x[n+2]'); 
title('\fontsize{16} x[n + 2]');

