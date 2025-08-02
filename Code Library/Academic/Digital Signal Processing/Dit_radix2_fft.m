% DIT_RADIX2_FFT.M
% This file implements the Decimation in Time (DIT) Radix-2 FFT algorithm
% and demonstrates its use on a simple input signal.

% Main function for DIT Radix-2 FFT Implementation
function X = dit_radix2_fft(x)
    % DIT Radix-2 FFT Implementation
    % Input:
    %   x - Input signal (must be a power of 2 in length)
    % Output:
    %   X - FFT of the input signal

    % Check if the length of x is a power of 2
    N = length(x);
    if mod(log2(N), 1) ~= 0
        error('Input length must be a power of 2');
    end

    % Bit-reverse the input signal for the DIT (Decimation in Time)
    x = bit_reverse(x);

    % Initialize the output array with the bit-reversed input
    X = x;

    % Number of stages in the FFT (log2 of the length of input)
    stages = log2(N);

    % FFT computation using Decimation in Time
    for stage = 1:stages
        % Number of points in each FFT stage (2^stage)
        num_points = 2^stage;
        half_points = num_points / 2;

        % Twiddle factors for this stage
        W = exp(-2 * pi * 1i * (0:half_points-1) / num_points);

        % Perform the butterfly operation for each stage
        for k = 0:N/num_points-1
            for j = 0:half_points-1
                % Indices for the butterfly operation
                idx1 = k * num_points + j + 1; % MATLAB is 1-indexed
                idx2 = idx1 + half_points;

                % Butterfly operation for FFT
                temp = X(idx2) * W(j + 1); % Multiply with twiddle factor
                X(idx2) = X(idx1) - temp;  % Update second half of the butterfly
                X(idx1) = X(idx1) + temp;  % Update first half of the butterfly
            end
        end
    end
end

% Function to perform bit-reversal of the input array
function x_bitreversed = bit_reverse(x)
    % Bit-reverse the input array
    N = length(x);         % Length of the input signal
    n = log2(N);           % Log2 of the length of x to calculate bit reversal
    x_bitreversed = zeros(size(x)); % Initialize the bit-reversed array

    % Loop through all indices and reverse their bits
    for k = 0:N-1
        % Reverse the bits of the index k
        rev_idx = bin2dec(fliplr(dec2bin(k, n))) + 1; % MATLAB is 1-indexed
        x_bitreversed(rev_idx) = x(k + 1); % Assign the value to the bit-reversed index
    end
end


% Part (b): Example program to demonstrate the use of DIT Radix-2 FFT

clc;
clear all;
close all;

% Example input signal (must be a power of 2)
N = 4;  % Length of the input signal
x = [1 2 3 4]; % Example input signal

% Display the input signal
disp('Input Signal:');
disp(x);

% Compute FFT using the DIT Radix-2 FFT function
X = dit_radix2_fft(x);

% Display the FFT result
disp('FFT of the Input Signal:');
disp(X);
