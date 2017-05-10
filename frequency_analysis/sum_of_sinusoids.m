%% Illustration of the Fourier concept
% Any signal can be represented by the linear sum of sinusoids
% 
% Anas Salah Eddin, 2017
%

Fs = 500;
x = [0:1/Fs:1];
DC = 0;
%Generate 3 random frequencies
f1 = randi(100);
f2 = randi(100);
f3 = randi(100);

%Generate functions 
y1 = cos(2*pi*x*f1);
y2 = sin(2*pi*x*f2);
y3 = cos(2*pi*x*f3);

%Sum the periodic functions
y = DC + randi(10) * y1 +randi(10) *  y2 +randi(10) *   y3;

figure; 
subplot(6,1,1); plot(x,y1);title(sprintf('Frequency %d Hz', f1));
subplot(6,1,2); plot(x,y2);title(sprintf('Frequency %d Hz', f2));
subplot(6,1,3); plot(x,y3);title(sprintf('Frequency %d Hz', f3));
subplot(6,1,4); plot(x,y); title('Generated Signal');

%% plotting (non-Centered) Fourier Transform of the summed signal

Y = fft(y);
Y = abs(Y); %Fourier Power Spectrum
f = Fs * linspace(0,1,size(y,2));
subplot(6,1,5); plot(f, Y);title('Fourier Transform')

%% plotting (Centered) Fourier Transform of the summed signal

centered_y = zeros(size(y));
for i=1:size(y,2)    
    centered_y(i) = y(i) * (-1) .^ i;    
end
Y = fft(centered_y);
Y = abs(Y); %Fourier Power Spectrum
f = Fs * linspace(-.5,.5,size(y,2));
subplot(6,1,6); plot(f, Y);title('Centered Fourier Transform')



