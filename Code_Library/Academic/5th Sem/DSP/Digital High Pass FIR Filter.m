clc;
clear all;
close all;

% Taking input from the user
rp = input('Enter the passband ripple: ');  % Passband ripple (in linear scale)
rs = input('Enter the stopband ripple: ');  % Stopband ripple (in linear scale)
fp = input('Enter the passband frequency: '); % Passband frequency
fs = input('Enter the stopband frequency: '); % Stopband frequency
f = input('Enter the sampling frequency: ');  % Sampling frequency

% Normalize the passband and stopband frequencies
wp = 2 * fp / f;
ws = 2 * fs / f;

% Calculate filter order (n)
num = -20 * log10(sqrt(rp * rs)) - 13;
den = 14.6 * (fs - fp) / f;
n = ceil(num / den);
n1 = n + 1;

% Adjust n to be even
if rem(n, 2) ~= 0
    n1 = n;
    n = n - 1;
end

% Choose window function (Boxcar, Bartlett, Hanning, Hamming)
y_boxcar = boxcar(n1);        % Boxcar window
y_bartlett = bartlett(n1);    % Bartlett window
y_hanning = hanning(n1);      % Hanning window
y_hamming = hamming(n1);      % Hamming window

% High-pass FIR filter design using boxcar window
b_boxcar = fir1(n, wp, 'high', y_boxcar);
[h_boxcar, q] = freqz(b_boxcar, 1, 256);
m_boxcar = 20 * log10(abs(h_boxcar));

% High-pass FIR filter design using Bartlett window
b_bartlett = fir1(n, wp, 'high', y_bartlett);
[h_bartlett, ~] = freqz(b_bartlett, 1, 256);
m_bartlett = 20 * log10(abs(h_bartlett));

% High-pass FIR filter design using Hanning window
b_hanning = fir1(n, wp, 'high', y_hanning);
[h_hanning, ~] = freqz(b_hanning, 1, 256);
m_hanning = 20 * log10(abs(h_hanning));

% High-pass FIR filter design using Hamming window
b_hamming = fir1(n, wp, 'high', y_hamming);
[h_hamming, ~] = freqz(b_hamming, 1, 256);
m_hamming = 20 * log10(abs(h_hamming));

% Plot the frequency response for each window type in subplots
figure;

% Boxcar window
subplot(2, 2, 1);
plot(q / pi, m_boxcar);
xlabel('Normalized Frequency');
ylabel('Gain (dB)');
title('High-pass filter using Boxcar window');
grid on;

% Bartlett window
subplot(2, 2, 2);
plot(q / pi, m_bartlett);
xlabel('Normalized Frequency');
ylabel('Gain (dB)');
title('High-pass filter using Bartlett window');
grid on;

% Hanning window
subplot(2, 2, 3);
plot(q / pi, m_hanning);
xlabel('Normalized Frequency');
ylabel('Gain (dB)');
title('High-pass filter using Hanning window');
grid on;

% Hamming window
subplot(2, 2, 4);
plot(q / pi, m_hamming);
xlabel('Normalized Frequency');
ylabel('Gain (dB)');
title('High-pass filter using Hamming window');
grid on;

%%
Example input:
Enter the passband ripple: 0.02
Enter the stopband ripple: 0.01
Enter the passband frequency: 1200
Enter the stopband frequency: 1700
Enter the sampling frequency: 9000
%%