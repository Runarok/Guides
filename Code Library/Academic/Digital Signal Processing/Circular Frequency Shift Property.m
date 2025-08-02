clc;
clear all;
close all;

% Taking input from user
x = input('Enter the first input sequence: ');  % Input sequence x
l = input('Enter the number of shifts: ');     % Number of shifts

% Get the length of the sequence
N = length(x);

% Compute the FFT of the sequence
xk = fft(x, N);

% Circularly shift the FFT of x by l positions
yv = circshift(xk, [0, l]);

% Compute the frequency shifts for circular frequency shift
for n = 0:N-1
    w(n+1) = exp((j*2*pi*n*l)/N);  % Frequency shift factor
end

% Multiply the frequency shift factor with the original sequence x
y = w .* x;

% Compute the FFT of y
yk = fft(y);

% Display the FFTs
disp('FFT of y (yk):');
disp(yk);

disp('Circularly shifted FFT of x (yv):');
disp(yv);

% Check if the circular frequency shift property is satisfied
if all(floor(abs(yk)) == floor(abs(yv)))
    disp('Circular frequency shift property is satisfied');
else
    disp('Circular frequency shift property is not satisfied');
end;