% QAM Modulation Example

clc;
clear all;
close all;

%% Parameters
M = 16;               % Modulation order (16-QAM)
k = log2(M);          % Number of bits per symbol
n = 30000;            % Number of symbols per frame (number of bits = n * k)
sps = 1;              % Samples per symbol (no oversampling)

% Set random number generator seed for reproducibility
rng default

%% Generate Random Binary Data
% Create a vector of random bits (0s and 1s)
dataIn = randi([0 1], n * k, 1);

% Plot the first 40 bits of data
figure;
stem(dataIn(1:40), 'filled');
title('Random Binary Data');
xlabel('Bit Index');
ylabel('Binary Value');
grid on;

%% Convert Binary Data to Integer Symbols
% Reshape the binary data into groups of 'k' bits and convert to integers
dataSymbolsIn = bi2de(reshape(dataIn, k, []).', 'left-msb');

% Plot the first 10 integer symbols
figure;
stem(dataSymbolsIn(1:10));
title('Integer Symbols from Binary Data');
xlabel('Symbol Index');
ylabel('Integer Value');
grid on;

%% QAM Modulation
% Binary-encoded QAM modulation (using binary Gray mapping)
dataModBinary = qammod(dataSymbolsIn, M, 'bin');

% Gray-encoded QAM modulation (using standard Gray mapping)
dataModGray = qammod(dataSymbolsIn, M);

%% Define Eb/No (Energy per bit to Noise power spectral density ratio)
EbNo = 10;   % Set Eb/No in dB

% Convert Eb/No to SNR (Signal-to-Noise Ratio in dB)
snr = EbNo + 10 * log10(k);  % SNR = Eb/No + 10*log10(k)

%% Add AWGN Noise
% Add noise to the modulated signals based on the calculated SNR
receivedSignalBinary = awgn(dataModBinary, snr, 'measured');
receivedSignalGray = awgn(dataModGray, snr, 'measured');

%% Plot Constellation Diagrams
% Plot the constellation of the received binary-encoded QAM
figure;
scatterplot(receivedSignalBinary, 1, 0, 'g.');
hold on;
scatterplot(dataModBinary, 1, 0, 'k*');
title('Constellation Diagram for Binary-encoded 16-QAM');
xlabel('In-phase (I)');
ylabel('Quadrature (Q)');
grid on;

% Plot the constellation of the received Gray-encoded QAM
figure;
scatterplot(receivedSignalGray, 1, 0, 'g.');
hold on;
scatterplot(dataModGray, 1, 0, 'k*');
title('Constellation Diagram for Gray-encoded 16-QAM');
xlabel('In-phase (I)');
ylabel('Quadrature (Q)');
grid on;

%% QAM Demodulation
% Perform demodulation for both binary and Gray-coded signals
dataSymbolsOutBinary = qamdemod(receivedSignalBinary, M, 'bin');
dataSymbolsOutGray = qamdemod(receivedSignalGray, M);

%% Convert Demodulated Symbols back to Binary Data
% Convert demodulated integer symbols back to binary data for both binary and Gray mapping
dataOutBinary = de2bi(dataSymbolsOutBinary, k, 'left-msb').';
dataOutBinary = dataOutBinary(:);  % Reshape into a column vector

dataOutGray = de2bi(dataSymbolsOutGray, k, 'left-msb').';
dataOutGray = dataOutGray(:);  % Reshape into a column vector

%% Calculate Bit Error Rate (BER)
% Calculate the bit error rate for both binary-encoded and Gray-encoded QAM
[numErrorsBinary, berBinary] = biterr(dataIn, dataOutBinary);
fprintf('Binary-coded QAM BER: %5.2e, based on %d errors.\n', berBinary, numErrorsBinary);

[numErrorsGray, berGray] = biterr(dataIn, dataOutGray);
fprintf('Gray-coded QAM BER: %5.2e, based on %d errors.\n', berGray, numErrorsGray);

%% 16-QAM Symbol Mapping and Constellation Diagrams
% Define the symbol set for 16-QAM (integer values from 0 to M-1)
x = 0:(M-1);

% Plot 16-QAM constellation using binary encoding
symbin = qammod(x, M, 'bin');
symgray = qammod(x, M, 'gray');

% Plot the 16-QAM constellation for Gray-coded mapping
figure;
scatterplot(symgray, 1, 0, 'b*');
hold on;

% Annotate the constellation points with binary and integer values
for k = 1:M
    % Display binary representation (4-bit) and integer value for each symbol
    text(real(symgray(k)) - 0.0, imag(symgray(k)) + 0.3, dec2base(x(k), 2, 4), 'Color', [0 1 0]);
    text(real(symgray(k)) - 0.5, imag(symgray(k)) + 0.3, num2str(x(k)), 'Color', [0 1 0]);
    text(real(symbin(k)) - 0.0, imag(symbin(k)) - 0.3, dec2base(x(k), 2, 4), 'Color', [1 0 0]);
    text(real(symbin(k)) - 0.5, imag(symbin(k)) - 0.3, num2str(x(k)), 'Color', [1 0 0]);
end

% Set plot title and axis limits
title('16-QAM Symbol Mapping (Binary and Gray Coding)');
axis([-4 4 -4 4]);
xlabel('In-phase (I)');
ylabel('Quadrature (Q)');
grid on;
