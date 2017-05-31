%%
% Spring 2017
% HW 4, MATLAB 1
% 
% Anas Salah Eddin, 2017
%

clear all; close all;
%% Loading DTMF files

load('DTMF_a.mat');
load('DTMF_b.mat');

Fs = 8000; % Sampling Frequency [Hz]


% Uncomment the following to listent to the tones
%soundsc(DTMF_a, Fs);
%soundsc(DTMF_b, Fs);

% NOTE: The following command stops the sound player
% clear sound

%% Using fft to figure out the keys pressed

A = fft(DTMF_a);
B = fft(DTMF_b);

k = 0:length(A) - 1;

% plotting the magnitude spectrums
figure;
subplot(1, 2, 1);
stem(k, abs(A));
xlabel('k');
title('DTMF\_a');

subplot(1, 2, 2)
stem(k, abs(B));
xlabel('k');
title('DTMF\_b');