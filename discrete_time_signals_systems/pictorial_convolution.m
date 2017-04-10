%% Pictorial Illustration of Convolution
% Show a pictorial illustration of the convolution sum
%
% y[n] = x[n] * h[n]
%
% Generate the x[n] and h[n] in the next section
% Press any key to continue the illustration
%
% Anas Salah Eddin, 2017
%
close all; clear all;

%% Generate sequences (change these if necessary)
x_of_n1 = [6, 5, 4, 3, 2, 1];
n1 = 0:length(x_of_n1) - 1;

h_of_n2 = 1/3 * [1 1 1];
n2 = 0:length(h_of_n2) - 1;

%% Move the sequences to index k
x_of_k1 = x_of_n1;
k1 = n1;

[h_of_k2, k2] = fold(h_of_n2, n2);

%% Start convolution

% shift limits
lower_shift_limit = k1(1) - k2(end) - 1;
upper_shift_limit = k1(end) + find(~k2);

% initialize y
n = lower_shift_limit:upper_shift_limit ;
y = zeros(size(n));
y_index = 1;

for s = lower_shift_limit:upper_shift_limit
    
    % shift h[-k]
    [shifted_h_of_k3, k3] = shift(h_of_k2, k2, s);
    
    [x_of_k, h_of_k, k] = timealign(x_of_k1, k1, shifted_h_of_k3, k3);
    
    % stem x[k]
    subplot(4, 1, 1);
    stem(k, x_of_k, 'fill', 'markersize', 5, 'linewidth', 2);
    xlabel('k')
    ylabel('x[k]');
    title('x[k]');

    % stem h[-k]
    subplot(4, 1, 2);
    stem(k, h_of_k, 'fill', 'markersize', 5, 'linewidth', 2);
    xlabel('k')
    ylabel('h[-k]');
    title('h[-k]');

    % stem x[k].*h[-k]
    subplot(4, 1, 3);
    z_of_k = x_of_k .* h_of_k;
    stem(k, z_of_k, 'fill', 'markersize', 5, 'linewidth', 2);
    xlabel('k')
    ylabel('x[k]h[-k]');
    title('x[k]h[-k]');

    % stem y[n]
    y(y_index) = sum(z_of_k);
    y_index = y_index + 1;

    subplot(4, 1, 4);
    stem(n, y, 'fill', 'markersize', 5, 'linewidth', 2);
    xlabel('n')
    ylabel('y[n]');
    title('y[n]');
    
    pause;
end