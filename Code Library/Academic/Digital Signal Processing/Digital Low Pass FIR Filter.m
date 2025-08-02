clc;
clear all;
close all;

% User inputs for filter design
rp = input('Enter the passband ripple: ');        % Passband ripple in linear scale
rs = input('Enter the stopband ripple: ');        % Stopband ripple in linear scale
fp = input('Enter the passband frequency (fp): '); % Passband frequency in Hz
fs = input('Enter the stopband frequency (fs): '); % Stopband frequency in Hz
f = input('Enter the sampling frequency (f): ');   % Sampling frequency in Hz

% Normalized frequency values (in terms of pi)
wp = 2 * fp / f;  % Normalized passband frequency
ws = 2 * fs / f;  % Normalized stopband frequency

% Calculate filter order (n)
num = -20 * log10(sqrt(rp * rs)) - 13;
den = 14.6 * (fs - fp) / f;
n = ceil(num / den);  % Minimum filter order
n1 = n + 1;           % Adjusted filter order (to ensure it is odd)

% If n is even, decrement it by 1 to make it odd
if(rem(n, 2) ~= 0)
    n1 = n;
    n = n - 1;
end;

% Choose window type (you can select one of the following)
y = boxcar(n1);  % Rectangular window
% y = bartlett(n1); % Bartlett window (use this for smoother transition)
% y = hanning(n1);  % Hanning window
% y = hamming(n1);  % Hamming window

% Design the FIR filter using the 'fir1' function with the chosen window
b = fir1(n, wp, 'low', y);  % Low-pass FIR filter design

% Frequency response calculation
[h, q] = freqz(b, 1, 256);   % Frequency response of the filter
m = 20 * log10(abs(h));      % Magnitude response in dB

% Plot the magnitude response
subplot(2, 2, 1);            % First subplot (2x2 grid, first position)
plot(q/pi, m);               % Plot the frequency response (normalized frequency)
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Gain (dB)');
title('Low-pass Filter Using Rectangular Window');

% Add more subplots for additional window functions or filter responses
% For example, if you want to add plots for Hamming, Hanning, or Bartlett:
subplot(2, 2, 2);            % Second subplot (2x2 grid, second position)
y = hamming(n1);             % Hamming window
b = fir1(n, wp, 'low', y);   % Design filter with Hamming window
[h, q] = freqz(b, 1, 256);   % Frequency response
m = 20 * log10(abs(h));      % Magnitude response in dB
plot(q/pi, m);
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Gain (dB)');
title('Low-pass Filter Using Hamming Window');

subplot(2, 2, 3);            % Third subplot (2x2 grid, third position)
y = hanning(n1);             % Hanning window
b = fir1(n, wp, 'low', y);   % Design filter with Hanning window
[h, q] = freqz(b, 1, 256);   % Frequency response
m = 20 * log10(abs(h));      % Magnitude response in dB
plot(q/pi, m);
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Gain (dB)');
title('Low-pass Filter Using Hanning Window');

subplot(2, 2, 4);            % Fourth subplot (2x2 grid, fourth position)
y = bartlett(n1);            % Bartlett window
b = fir1(n, wp, 'low', y);   % Design filter with Bartlett window
[h, q] = freqz(b, 1, 256);   % Frequency response
m = 20 * log10(abs(h));      % Magnitude response in dB
plot(q/pi, m);
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Gain (dB)');
title('Low-pass Filter Using Bartlett Window');

%%
Example input:
Enter the passband ripple: 0.02
Enter the stopband ripple: 0.01
Enter the passband frequency: 1200
Enter the stopband frequency: 1700
Enter the sampling frequency: 9000
%%