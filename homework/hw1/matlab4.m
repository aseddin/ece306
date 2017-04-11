%%
% Spring 2017
% HW 1, MATLAB 4
% 
% Anas Salah Eddin, 2017
%
%% Setup
close all; clear all;

%% Loading djw6576.txt

x = load('../../misc/djw6576.txt');
N = length(x);
n = 0:N - 1;

[folded_x, folded_n] = fold(x, n);
%% 4 - (a) y1[n]

% Generating first average y1[n]

y1 = zeros(size(x));

for i = 0:N - 1
    [shifted_folded_x, k] = shift(folded_x, folded_n, i);
    
    % i + 1 because we cannot start at 0 in matlab
    y1(i + 1) = 1/51 * sum(shifted_folded_x(k >= 0 & k <= 50));
end

% Generating second average y2[n]

y2 = zeros(size(x));

for i = 0:N - 1
    [shifted_folded_x, k] = shift(folded_x, folded_n, i);
    
    % i + 1 because we cannot start at 0 in matlab
    y2(i + 1) = 1/51 * sum(shifted_folded_x(k >= -25 & k <= 25));
end

%% Plotting x[n] (blue)
figure;
plot(n, x, 'linewidth', 2, 'color', 'blue');

legend('\fontsize{13} x[n]');
%% Plotting y1[n] (magenta)
hold on;
plot(n, y1, 'linewidth', 2, 'color', 'magenta');
legend('\fontsize{13} x[n]', '\fontsize{13} y_1[n]');

%% Plotting y2[n] (green)
hold on;
plot(n, y2, 'linewidth', 2, 'color', 'green');
legend('\fontsize{13} x[n]', '\fontsize{13} y_1[n]', '\fontsize{13} y_2[n]');

