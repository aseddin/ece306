%% Discrete Fourier Transform Example
% Generate a signal composed of 2 sinusoids (1 KHz, and 2 KHz)
% The 2 KHz signal has a phase shift of 135 degrees
close all; clear all;

%% Generate the "continous" signal
Fs = 8000; %Hz
Ts = 1/Fs; %seconds
N = 8;

t = 0:Ts/(2 * N):N * Ts; % small steps to generate enough samples
xt = sin(2*pi * 1000 * t) + 0.5 * sin(2 * pi * 2000 * t + 3 * pi/4);

plot(t, xt, 'LineWidth', 2);
%% Generate the "sampled" discrete signal
n = 0:N - 1;

[n_ts, i_n, i_t] = intersect(n * Ts, t);

xn = xt(i_t);

hold on
plot(n_ts, xn, 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

% Modify the xtick to refelect the value of N
% The process works for MATLAB R2014a and earlier, for later versions
% check: http://www.mathworks.com/help/matlab/creating_plots/change-tick-marks-and-tick-labels-of-graph-1.html
set(gca, 'XTick', n_ts);
set(gca, 'XTickLabel', n);
xlim([0 N*Ts])
grid on;
main_axis = gca;
%% DFT

Xm = zeros(1, N);
 
for i = 0:N-1 %m frequency points
    phi = 2 * pi * n * i / N;
    cos_phi = cos(phi);
    sin_phi = sin(phi);
    Xm(i + 1) = sum(xn .* (cos_phi - 1j * sin_phi));
    
    %plot (start with a copy of the input signal figure)
    figure(); ax = axes;
    copyobj(allchild(main_axis), ax);
    grid on;
    set(gca, 'XTick', n_ts);
    set(gca, 'XTickLabel', n);
    xlim([0 N*Ts])
    title(strcat('X(', num2str(i), ')'));
    
    % plot the m sinusoids
    hold on;
    f_m = i * Fs / N;
    plot(t, cos(2 * pi * t * f_m), '--m', 'LineWidth', 2);
    plot(t, sin(2 * pi * t * f_m), ':k', 'LineWidth', 2);
end


%% DFT Plots

% Magnitude
figure();
subplot(2, 2, 1);
stem(n, abs(Xm), 'fill', 'MarkerSize', 10, 'LineWidth', 2);
title('Magnitude of X(m)');
axis([0 N 0 max(abs(Xm))]);

% Phase in degrees
subplot(2, 2, 3);
stem(n, angle(round(Xm)) * (180 / pi), 'fill', 'MarkerSize', 10, 'LineWidth', 2);
%round(Xm) was used to compensate for floating point errors, i.e. 1.234e-17
%~=0
title('Phase of X(m)');
axis([0 N -180 180]);

% Real
subplot(2, 2, 2);
stem(n, real(Xm), 'fill', 'MarkerSize', 10, 'LineWidth', 2);
title('Real part of X(m)');
axis([0 N min(real(Xm)) max(real(Xm))]);

% Imaginary
subplot(2, 2, 4);
stem(n, imag(Xm), 'fill', 'MarkerSize', 10, 'LineWidth', 2);
title('Imag of X(m)');
axis([0 N min(imag(Xm)) max(imag(Xm))]);

