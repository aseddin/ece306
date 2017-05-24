%% Illustration of the relationship between the Z-transform and the DFT
% 
% Anas Salah Eddin, 2017
%

clear all; close all;

%% Generate an H(z) and associated surface

% Generate the z plane
Re = linspace(-2, 2, 150);
Im = linspace(-2, 2, 150);
[Re, Im] = meshgrid(Re, Im);
z = Re + Im * 1j;

% Generate an H(z) 
H_z = (1 - z.^(-2)) ./ (1 - 0.9 * sqrt(2) * z.^(-1) + 0.81 * z.^(-2));

% plot |H(z)|
surf(Re, Im, abs(H_z));
colormap(hsv);
%% Truncate the surface to show Fourier Transform corss section
truncated_H_z = H_z;
index = find((abs(z) > 1));
truncated_H_z(index) = NaN * ones(size(index));

% plot |H(z)|
figure;
surf(Re, Im, abs(truncated_H_z));
colormap(hsv);

%% Compute the Fourier Transform
w = linspace(0, 2 * pi, 150);
F = (1 - exp(w * 1j).^(-2)) ./ (1 - 0.9 * sqrt(2) * exp(w * 1j).^(-1) + 0.81 * exp(w * 1j).^(-2));
figure;
plot(abs(F))