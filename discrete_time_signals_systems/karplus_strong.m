%% Digital Signal Processing
% Spring 2016
% Anas Salah Eddin
%
% Karplus Strong Example
%--------------------------------
%% Control Variables
M = 300; %Delay
a = 0.95; %Scaling Factor
Fs = 44100; %Sampling frequency (2 * 22 kHz)

sx = Fs * 0.01; %Length of input signal
n = 1:sx;

%% Input Signal

%Random Noise
x = -1 + 2 * rand(1, sx);

%Sinusoidal (try a = 1)
%x = sin(2 * pi * n / 100);

subplot(1, 2, 1);
stem(x);

%% Output Signal
y = zeros(1, size(x,2) * 50);
x = [x,  y];

% Implement the Karplus Strong discrete time system
for i = M + 1:size(y, 2);
    y(i) = a * y(i - M) + x(i - M);
end

subplot(1, 2, 2);
stem(y);

%% Play the output
soundsc(y, Fs);

%% Launch the matlab Karplus-Strong example
VirtualGuitarExample

%Source:
%http://www.mathworks.com/help/signal/examples/generating-guitar-chords-using-the-karplus-strong-algorithm.html