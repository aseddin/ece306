%%
% Spring 2017
% HW 1, MATLAB 1
% 
% Anas Salah Eddin, 2017
%
%% Setup
clear all; close all;
low_n = -20;
high_n = 40;

%% 1 - (a)
% Unit sample

[del, n] = delta(low_n, 0, high_n);

stem(n, del, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('\delta [n]');
title('\fontsize{16} \delta [n]');

%% 1 - (b)
% Unit step

[u, n] = unitstep(low_n, 0, high_n);

stem(n, u, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('u[n]');
title('\fontsize{16} u[n]');

%% 1 - (c)
% Real exponential signals

n = low_n:high_n;
x1 = (0.8) .^ n;

stem(n, x1, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x_1[n]');
title('\fontsize{16} Real Exponential Signal x_1[n] = (0.8)^n');

%% 1 - (d)
% Complex exponential signals

n = low_n:high_n;
x2 = (0.9 * exp(1i * pi / 10)) .^ n;

% real part
subplot(4, 1, 1);
stem(n, real(x2), 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('Re{x_2[n]}');
title('\fontsize{16} Real Part Re\{x_2[n]\}');

% imaginary part
subplot(4, 1, 2);
stem(n, imag(x2), 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('Im{x_2[n]}');
title('\fontsize{16} Imaginary Part Im\{x_2[n]\}');

% magnitude
subplot(4, 1, 3);
stem(n, abs(x2), 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('|x_2[n]|');
title('\fontsize{16} Magnitude |x_2[n]|');

% phase
subplot(4, 1, 4);
stem(n, angle(x2), 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('\angle x_2[n]');
title('\fontsize{16}  Phase \angle x_2[n]');

%% 1 - (e)
% Sinusoidal

n = low_n:high_n;
x3 = 2 * cos(2 * pi * (0.3) * n + pi/3);

figure;
stem(n, x3, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x_3[n]');
title('\fontsize{16} Sinusoidal x_3[n] = 2cos(2\pi (0.3)n + \pi/3)');
