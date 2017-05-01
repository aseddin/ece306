%%
% Spring 2017
% HW 2, MATLAB 1
% 
% Anas Salah Eddin, 2017
%
%% Setup
close all; clear all;


% (a) this is just a hint that you should use in part (c)

% (b) based on pen and paper
%
% X(Z) = (2 - 1/6z^-1) / (1 - 1/6z^-1 - 1/6z^-2)
% ROC |z| > 1/2
%
%% (c)  comparing the output of the filter command to the actual x[n]

N = 10; % number of samples
n = 0:N; % generate the sample number

% defined in the problem statement
x1 = (1/2).^n + (-1/3).^n; 

% from pen and paper in part (b)
b = [2 -1/6];
a = [1 -1/6 -1/6];

% the following is actually generating the impulse response
% [1 zeros(1, N)] is [1 0 0 0 0 0 0 0 0 ...] which is an impulse
x2 = filter(b, a, [1, zeros(1, N)]);

% stem original time domain x1[n]
subplot(2, 1, 1);
stem(n, x1, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x[n]');
title('\fontsize{16} x[n]');

% stem z-transform generated x2[n] (using the filter command)
subplot(2, 1, 2);
stem(n, x2, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x[n]');
title('\fontsize{16} x[n]');