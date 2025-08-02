clc;
clear all;
close all;

% Taking input from the user
rp = input('Enter the passband ripple (in dB): ');  % Passband ripple (in dB)
rs = input('Enter the stopband ripple (in dB): ');  % Stopband ripple (in dB)
wp = input('Enter the passband frequency (in Hz): '); % Passband frequency (Hz)
ws = input('Enter the stopband frequency (in Hz): '); % Stopband frequency (Hz)
fs = input('Enter the sampling frequency (in Hz): ');  % Sampling frequency (Hz)

% Normalize the passband and stopband frequencies (0 to pi) for digital filter design
w1 = 2 * wp / fs;  % Normalized passband frequency (wp / fs) * 2
w2 = 2 * ws / fs;  % Normalized stopband frequency (ws / fs) * 2

% Design the Butterworth filter using buttord and butter functions
[n, wn] = buttord(w1, w2, rp, rs);  % Calculate the filter order (n) and cutoff frequency (wn)
[b, a] = butter(n, wn, 'low');  % Get the low-pass Butterworth filter coefficients

% Display filter specifications
disp('The order of the low-pass filter:');
disp(n);
disp('The cutoff frequency of the low-pass filter (normalized):');
disp(wn);

% Frequency range for plotting the frequency response
w = 0:0.01:pi;  % Frequency range from 0 to pi
[h] = freqz(b, a, w);  % Compute the frequency response of the filter

% Magnitude and Phase of the frequency response
mag = 20 * log10(abs(h));  % Magnitude in dB
ang = angle(h);  % Phase angle in radians

% Plotting the magnitude and phase response
figure;

% Magnitude plot
subplot(2, 1, 1);
plot(w / pi, mag);  % Normalize frequency by pi
xlabel('Normalized Frequency (\pi rad/sample)');
ylabel('Magnitude (dB)');
title('Magnitude Response of Low-pass Filter');
grid on;

% Phase plot
subplot(2, 1, 2);
plot(w / pi, ang);  % Normalize frequency by pi
xlabel('Normalized Frequency (\pi rad/sample)');
ylabel('Phase (radians)');
title('Phase Response of Low-pass Filter');
grid on;

%%
Example input:
Enter the passband ripple (in dB): 3
Enter the stopband ripple (in dB): 60
Enter the passband frequency (in Hz): 150
Enter the stopband frequency (in Hz): 300
Enter the sampling frequency (in Hz): 1500
%%