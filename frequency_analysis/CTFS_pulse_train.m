%% The different spectrums of a continous-time pulse train
% 
% Illustration of Fourier Series (sort of working)
%
% Anas Salah Eddin, 2017
%
%
%
%
%    
%                          x(t)
%                           |
%         ______         __A|___          _______
%        |      |       |   |   |        |       |
%        |      |       |   |   |        |       |
% _______|      |_______|   |   |________|       |_______ t
%           -Tp      -tao/2 0  tao/2         Tp           
%
%
% Setup
close all; clear all;

Tp = 1; %[s]
A = 1;
N = 100; %samples (for freq domain)

F0 = 1/Tp;
%% Compare the effect of tao

duty_cycle = [4, 10, 100];

figure;
i = 1;
for d = duty_cycle
    % Generate signal
    tao = Tp * d/100; 
    t = linspace(-3/2 * Tp, 3/2 * Tp, 1000);
    x = A * square(2 * pi * F0 * t, d); %need to use a different function  to get a square wave centered at 0
    subplot(3, 2, i);
    plot(t, x);
    ylim([0, 1.1 * A])

    % Compute CTFS
    k = -N/2:N/2;
    c = (A * tao / Tp) * sinc(pi * k * F0 * tao);
    subplot(3, 2, i + 1);
    stem(c)
    axis tight
    hold on
    plot(c)
    
    i = i + 2;
end