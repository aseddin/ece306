%% Illustration of the effect of pole location
% Show the pole-zero plot and the corresponding time domain represenation
% of a first order (1 real pole) signal:
% x[n] = a^n u[n]
% where a (the pole) is a real number
%
% Press any key to continue the illustration
%
% Anas Salah Eddin, 2017
%
%% Setup
close all; clear all;

N = 50;
n = 0:N;

%% Show the different cases
% First positive a, then negative a

figure;
B = [1 0];

for a = [0.9, 1, 1.1, -0.9, -1, -1.1]
    
    A = [1 -a];

    % generate the sequence
    x = filter(B, A, [1 zeros(1, N)]);

    % stem x[n]
    subplot(1, 2, 1);
    stem(n, x, 'fill', 'markersize', 5, 'linewidth', 2);
    xlabel('n')
    ylabel('x[n]');
    title(['a = ', num2str(a)]);

    % pole-zero plot
    subplot(1, 2, 2);

    % The returned values xz, xp, xt are used to manipulate the formatting of
    % the pole-zero plot. They can be ignored if not showing the plot on a
    % projector. i.e. use:
    %   zplane(B, A);
    % without the returned values

    [xz, xp, xt] = zplane(B, A);
    title(['a = ', num2str(a)]);

    % Manipulate the formatting (can be ignored if using zplane(B, A) without
    % return values
    set(findobj(xz, 'Type', 'line'), 'MarkerSize', 18); 
    set(findobj(xz, 'Type', 'line'), 'LineWidth', 2); 
    set(findobj(xp, 'Type', 'line'), 'MarkerSize', 18); 
    set(findobj(xp, 'Type', 'line'), 'LineWidth', 2); 
    set(findobj(xt, 'Type', 'line'), 'LineWidth', 2); 
    
    pause;
end