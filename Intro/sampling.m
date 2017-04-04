%% Digital Signal Processing
% 3/2/2017
% Anas Salah Eddin
%
% Sampling
%--------------------------------
%% Clear stuff 
close all;
clear all;
clc
%% Generate original signals
F = 1/2 %Hz
tmin = 0;
tmax = abs(9 * 1/F); %9 periods
time_points = 100000;
t = linspace(tmin, tmax, time_points); %s
A = 1;  %amplitude
theta =  0; %rad

% Signal (can be changed to cos or any other analog signal)
xt = A * sin(2 * pi * F * t + theta);

% Plot the signals
plot(t, xt);
xlabel('Time [Seconds]');
ylabel('Amplitude');
hold on;
%% Sampling
Fs = 1;
Ts = 1 / Fs; %Seconds
nmin = ceil(tmin / Ts);
nmax = floor(tmax / Ts);
n = nmin:nmax;

xn = A * sin(2 * pi * F * n + theta);

plot(n, xn, 'ro--');
