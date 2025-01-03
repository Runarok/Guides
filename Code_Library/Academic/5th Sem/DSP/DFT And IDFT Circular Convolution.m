clc;
clear all;
close all;

% Taking input from the user
x = input('Enter the first input sequence: ');  % Input sequence x
h = input('Enter the second input sequence: '); % Input sequence h

% Lengths of the sequences
l = length(x);
m = length(h);

% Length of the result sequence (linear convolution length)
N = l + m - 1;

% Compute the FFT of both sequences
Xk = fft(x, N);
Hk = fft(h, N);

% Multiply the FFTs (frequency domain multiplication)
Yk = Xk .* Hk;

% Compute the inverse FFT to get the linear convolution result
y = ifft(Yk, N);

% Display the linear convoluted output
disp('Linear convoluted output using DFT and IDFT method:');
disp(y);

% Plot the sequences and the result
figure;
subplot(3, 1, 1);
stem(x);
title('The First Sequence');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 2);
stem(h);
title('The Second Sequence');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 3);
stem(y);
title('The Linear Convoluted Sequence');
xlabel('Time');
ylabel('Amplitude');
