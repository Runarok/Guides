clc;
clear all;
close all;

% Taking input from the user
x = input('Enter the first input sequence: ');  % First input sequence
h = input('Enter the second input sequence: '); % Second input sequence

% Lengths of the sequences
l = length(x);
m = length(h);

% Length of the result sequence (for circular convolution, we use max length)
N = max(l, m);

% Compute the FFT of both sequences, zero-padding if necessary
Xk = fft(x, N);  % FFT of the first sequence
Hk = fft(h, N);  % FFT of the second sequence

% Element-wise multiplication in the frequency domain
Yk = Xk .* Hk;

% Compute the inverse FFT to get the circular convolution result
y = ifft(Yk, N);

% Display the circular convoluted output
disp('Circular convoluted output using DFT and IDFT method:');
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
title('The Circular Convoluted Sequence');
xlabel('Time');
ylabel('Amplitude');
