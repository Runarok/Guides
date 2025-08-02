% Define the transfer function H(z)

num = [1];          % Numerator coefficients (z)
den = [1 -0.9];     % Denominator coefficients (z - 0.9)

% Create the transfer function
H = tf(num, den, -1); % -1 indicates discrete time
disp('Zeros and poles located at:');
[zz, pp] = tf2zp(num, den); % Get zeros and poles from transfer function

% a) Pole-Zero Plot
figure; 
pzmap(H);             % Plot the pole-zero map of H(z)
title('Pole-Zero Plot of H(z)');
grid on;             % Add grid to the plot

% b) Frequency Response
omega = linspace(-pi, pi, 1024); % Frequency range from -π to π, 1024 points
H_freq = freqz(num, den, omega); % Compute the frequency response of H(z)

% Magnitude and Phase of the frequency response
magnitude = abs(H_freq);  % Magnitude response
phase = angle(H_freq);    % Phase response

% Plot Magnitude Response
figure;
subplot(2, 1, 1);        % Create subplot (2 rows, 1 column, 1st plot)
plot(omega, magnitude);  % Plot magnitude response
title('Magnitude Response');
xlabel('Frequency in radians');
ylabel('Magnitude');

% Plot Phase Response
subplot(2, 1, 2);        % Create subplot (2 rows, 1 column, 2nd plot)
plot(omega, phase);      % Plot phase response
title('Phase Response');
xlabel('Frequency in radians');
ylabel('Phase values');

% c) Impulse Response
n = 0:20;                % Time index from 0 to 20
h = (0.9).^n;            % Impulse response for n >= 0 using (0.9)^n
h(1) = 1;                % h(0) = 1 for the impulse response, correction

disp('Samples of impulse response:');
disp(h);                 % Display the impulse response values

% Plot Impulse Response
figure;
stem(n, h);              % Plot the discrete-time impulse response
title('Impulse Response h(n)');
xlabel('n');
ylabel('Amplitude');
