clc;
clear all;
close all;

% Taking input from the user
x = input('Enter the first input sequence: ');  % Input sequence x
m = input('Enter the number of shifts: ');     % Number of shifts

% Get the length of the sequence
N = length(x);

% Perform the circular shift on the sequence
Xs = circshift(x, [0, m]);  % Circularly shift x by m positions

% Compute the FFT of the shifted sequence
y = fft(Xs, N);

% Compute the FFT of the original sequence
xk = fft(x, N);

% Compute the frequency shift factors for the circular shift property
for K = 0:N-1
    w(K+1) = exp((-j*2*pi*K*m)/N);  % Frequency shift factor for each frequency component
end;

% Apply the frequency shift to the FFT of x
Yv = w .* xk;  % Frequency-domain shifted version of xk

% Display the results
disp('FFT of circularly shifted sequence (y):');
disp(y);

disp('Expected frequency shift (Yv):');
disp(Yv);

% Check if the circular time shift property is satisfied
if all(floor(abs(y)) == floor(abs(Yv)))  % Compare magnitudes of y and Yv
    disp('Circular time shift property is satisfied');
else
    disp('Circular time shift property is not satisfied');
end;
