% Define the transfer function H(z)

num = [1]; % Numerator coefficients (z)
den = [1 -0.9]; % Denominator coefficients (z - 0.9)

% Create the transfer function
H = tf(num, den, -1); % -1 indicates discrete time
disp('seros and poles Located at')
[zz,pp] = tf2zp(num,den)

% a) Pole-Zero Plot
figure;
pzmap(H);
title('Pole-Zero Plot of H(z)');
grid on;

% b) Frequency Response
omega = linspace(-pi, pi, 1024); % Frequency range
H_freq = freqz(num, den, omega); % Frequency response

% Magnitude and Phase
magnitude = abs(H_freq);
phase = angle(H_freq);

% Plot Magnitude Response
figure;
subplot(2, 1, 1);
plot(omega, magnitude);
title('Magnitude Response');
xlabel('frequency in radians');
ylabel('Magnitude');

% Plot Phase Response
subplot(2, 1, 2);
plot(omega, phase);
title('Phase Response');
xlabel('frequency in radians');
ylabel('Phase values');


% c) Impulse Response
n = 0:20; % Time index
h = (0.9).^n; % Impulse response for n >= 0
h(1) = 1; % h(0) = 1 for the impulse response
disp('Samples of impulse response')
disp(h);
figure;
stem(n, h);
title('Impulse Response h(n)');
xlabel('n');
ylabel('Amplitude');
