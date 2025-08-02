clc;
clear all;
close all;

% Input sequences from the user
x1 = input('Enter the first input sequence x1 = ');
x2 = input('Enter the second input sequence x2 = ');
a1 = input('Enter the constant a1 = ');
a2 = input('Enter the constant a2 = ');

% Length of the input sequences
l1 = length(x1);
l2 = length(x2);

% Choose the maximum length for zero-padding
N = max(l1, l2);

% Zero padding the input sequences to length N
x1n = [x1, zeros(1, N - l1)];
x2n = [x2, zeros(1, N - l2)];

% Compute the linear combination in time domain
y = a1 * x1n + a2 * x2n;

% Compute the FFT of the output sequence y in time domain
yk = fft(y, N);

% Display the FFT of the output sequence y(k)
disp('Output sequence y(k) is:');
disp(yk);

% Compute the FFT of the individual input sequences x1 and x2
x1k = fft(x1n, N);
x2k = fft(x2n, N);

% Compute the linear combination in frequency domain
yv = a1 * x1k + a2 * x2k;

% Check if the linearity property holds (if both results are equal)
if all(abs(yk - yv) < 1e-10)  % Use a small tolerance to account for numerical errors
    disp('Linearity property is satisfied');
else
    disp('Linearity property is NOT satisfied');
end
