% QPSK

% Clear workspace and close all figures
clc;
clear all;
close all;

% Input data (binary sequence)
data = [0 1 0 1 1 1 0 0 1 1]; 

% Plot the original data before transmission
figure(1)
stem(data, 'linewidth', 3);
grid on;
title('Information before Transmitting');
axis([0 11 0 1.5]);

% QPSK Modulation:
% Step 1: Convert binary data (0, 1) to NZR (Non-Zero-Return) format, i.e., 0 -> -1, 1 -> 1
data_NZR = 2 * data - 1; 

% Step 2: Reshape data into two components for I (in-phase) and Q (quadrature)
s_p_data = reshape(data_NZR, 2, length(data)/2);

% Define transmission parameters
br = 10^6;        % Bit rate in bits per second (1 Mbps)
f = br;           % Carrier frequency (same as bit rate for simplicity)
T = 1/br;         % Bit duration (1/bit rate)
t = T/99:T/99:T;  % Time vector (for each bit period)

% Initialize arrays for the signals
y = [];    % Combined signal (I + Q)
y_in = []; % In-phase signal (I)
y_qd = []; % Quadrature-phase signal (Q)

% Step 3: Modulate each pair of bits using QPSK
for i = 1:length(data)/2
    % In-phase component (I) - modulated by cosine
    y1 = s_p_data(1, i) * cos(2 * pi * f * t); 
    
    % Quadrature-phase component (Q) - modulated by sine
    y2 = s_p_data(2, i) * sin(2 * pi * f * t); 
    
    % Append to the corresponding signals
    y_in = [y_in y1];
    y_qd = [y_qd y2]; 
    
    % Combined signal (I + Q)
    y = [y y1 + y2]; 
end

% Tx_sig is the transmitted signal (sum of I and Q)
Tx_sig = y; 

% Time vector for plotting the signals
tt = T/99:T/99:(T * length(data))/2;

% Plot the modulated signals
figure(2)
subplot(3, 1, 1);
plot(tt, y_in, 'linewidth', 3), grid on;
title('In-phase Component of QPSK');
xlabel('Time (sec)');
ylabel('Amplitude (V)');

subplot(3, 1, 2);
plot(tt, y_qd, 'linewidth', 3), grid on;
title('Quadrature-phase Component of QPSK');
xlabel('Time (sec)');
ylabel('Amplitude (V)');

subplot(3, 1, 3);
plot(tt, Tx_sig, 'r', 'linewidth', 3), grid on;
title('Combined QPSK Modulated Signal');
xlabel('Time (sec)');
ylabel('Amplitude (V)');

% QPSK Demodulation:
% Step 4: Initialize received data array
Rx_data = []; 

% Assume the received signal is the same as the transmitted signal (ideal channel)
Rx_sig = Tx_sig; 

% Step 5: Demodulate each pair of bits
for i = 1:length(data)/2
    % Extract the in-phase component (multiply by cosine)
    Z_in = Rx_sig((i-1)*length(t) + 1 : i*length(t)) .* cos(2 * pi * f * t);
    
    % Integrate over one bit period to get the decision value for the in-phase component
    Z_in_intg = (trapz(t, Z_in)) * (2 / T); 
    
    % Decision rule: if the integral is positive, bit is 1, else bit is 0
    if Z_in_intg > 0
        Rx_in_data = 1;
    else
        Rx_in_data = 0;
    end

    % Extract the quadrature-phase component (multiply by sine)
    Z_qd = Rx_sig((i-1)*length(t) + 1 : i*length(t)) .* sin(2 * pi * f * t);
    
    % Integrate over one bit period to get the decision value for the quadrature-phase component
    Z_qd_intg = (trapz(t, Z_qd)) * (2 / T);
    
    % Decision rule: if the integral is positive, bit is 1, else bit is 0
    if Z_qd_intg > 0
        Rx_qd_data = 1;
    else
        Rx_qd_data = 0;
    end
    
    % Append the decoded in-phase and quadrature-phase data
    Rx_data = [Rx_data Rx_in_data Rx_qd_data];
end

% Plot the received data after demodulation
figure(3)
stem(Rx_data, 'linewidth', 3);
title('Information after Receiving');
axis([0 11 0 1.5]);
grid on;
