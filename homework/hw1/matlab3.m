%%
% Spring 2017
% HW 1, MATLAB 3
% 
% Anas Salah Eddin, 2017
%
%% Setup
close all; clear all;

load handel

x = y(:)'; clear y;
n = 1:length(x);

%% 3 - (a)

soundsc(x, Fs);

%% 3 - (b)
% Select every other sample in x, which reduces the sampling rate by a
% factor of 2

x2 = x(mod(n, 2) == 0);
Fs2 = Fs / 2;
soundsc(x2, Fs2);

%% 3 - (c)
% Select every fourth sample in x, which reduces the sampling rate by a
% factor of 4

x4 = x(mod(n, 4) == 0);
Fs4 = Fs / 4;
soundsc(x4, Fs4);

%% Saving the generated file
audiowrite('sub_sampled_audio.wav', x4, Fs4);