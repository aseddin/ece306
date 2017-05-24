%% Illustration of the DFT Shifting Property
% The DFT can be centered by multiplying the time domain signal by (-1)^n
% 
% Anas Salah Eddin, 2017
%

clear all; close all;

%% Generate the signal x[n] and its padded version x_z[n]
N = 25;

n = 0:N-1;

% uncomment one of the following signals

% % Rec function
% x = ones(1, N);

% Sinusoidal function
f = 2/N;
x = 2 * sin(2 * pi * f * n);

% zero pad the signal
x_zropad = [x zeros(1, length(x) * 5)];

% plot the original signal
figure; 
subplot(2,3,1); stem(x, 'fill', 'markersize', 5, 'linewidth', 2);title('Original Signal x[n]');xlabel('n');

% compute and plot the DFT mag spectrum
y = fft(x);
subplot(2,3,4); stem(abs(y), 'fill', 'markersize', 5, 'linewidth', 2);title('Fourier Transform X[k]');xlabel('k');
axis tight;
%% Improve the frequency domain resolution by zero padding

% zero pad the original x[n]
x_zropad = [x zeros(1, length(x) * 5)];

% compute the DFT of the padded signal
y_zropad = fft(x_zropad);

% plot signal and DFT mag spectrum of zero padded signal
subplot(2,3,2); stem(x_zropad, 'fill', 'markersize', 5, 'linewidth', 2);title('Padded Signal x_z[n]');xlabel('n');
subplot(2,3,5); plot(abs(y_zropad));title('Improved Resolution Fourier Transform X_z[k]');xlabel('k');
axis tight;
%% Centering the signal and plotting DFT mag spectrum

x_centered = zeros(size(x_zropad));
for i=1:size(x_zropad,2)    
    x_centered(i) = x_zropad(i) * (-1) .^ i;    
end

y_centered = fft(x_centered);


% plot modified signal and its centered DFT mag spectrum
subplot(2,3,3); stem(x_centered, 'fill', 'markersize', 5, 'linewidth', 2);title('Modified Signal x_m[n]');xlabel('n');
subplot(2,3,6); plot(abs(y_centered));title('Centered Fourier Transform X_{centered}[k]');xlabel('k');
axis tight;
%% Correcting the DFT centered axes

l_y = length(y_centered)/2;
k=-l_y:l_y - 1;
subplot(2,3,6); plot(k, abs(y_centered));title('Centered Fourier Transform X_{centered}[k]');xlabel('k');
axis tight;

