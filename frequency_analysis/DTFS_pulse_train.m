%% The different spectrums of a discrete-time pulse train
% 
% Illustration of DTFS
%
% Anas Salah Eddin, 2017
%
%
close all;
clear all;
%% Generate the pulse train
L = 6; % length of on pulse
N = 15; % Length of a single period
A = 5; %scale
periods = 3; % number of periods to show on the plot

x = A * [ones(1, L), zeros(1, N-L)];
n = 0:N-1;

x_p = repmat(x, 1, periods); %the periodic signal
n_p = 0:length(x_p) - 1;

% Plot the signal x[n]
subplot(2, 3, [1 3]);
stem(n_p, x_p, 'fill', 'markersize', 5, 'linewidth', 2);
xlabel('n')
ylabel('x[n]');
title('Discrete-Time Signal x[n]');

%% Compute the DTFS

%-------Note--------
% DTFS c_k can be cumputed as follows
% c = 1 / N * fft(x)
%
% x can be computed from c as follows
% x = N * ifft(c);
%-------------------

% The padded x is used to improve the stem plots, it's not needed when
% only computing DTFS
padded_x = [x, zeros(1, 3 * length(x))];
c = 1 / N * fft(padded_x);
k = linspace(0, N-1, length(c));


% plot the magnitude spectrum of c_k
magnitude = abs(c);
subplot(2, 3, 4);
stem(k, magnitude, 'fill', 'markersize', 5, 'linewidth', 2);
hold on
plot(k, magnitude);
xlabel('k')
ylabel('|c_k|');
title('Magnitude Spectrum (DTFS)');
axis tight;

% plot the phase spectrum of c_k
phase = angle(c);
subplot(2, 3, 5);
stem(k, phase, 'fill', 'markersize', 5, 'linewidth', 2);
hold on
plot(k, phase);
xlabel('k')
ylabel('\angle{c_k}');
title('Phase Spectrum (DTFS)');
axis tight;

% plot the power density spectrum of c_k
power_density = (abs(c) .^ 2);
subplot(2, 3, 6);
stem(k, power_density, 'fill', 'markersize', 5, 'linewidth', 2);
hold on
plot(k, power_density);
xlabel('k')
ylabel('|c_k|^2');
title('Power Density Spectrum (DTFS)');
axis tight;
