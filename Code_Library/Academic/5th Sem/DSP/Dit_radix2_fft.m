% a)This part of the program is for creating “dit_radix2_fft” function 
%Note:student must type the following code and save as dit_radix2_fft

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

    % Bit-reverse the input
    x = bit_reverse(x);

    % Initialize the output
    X = x;

    % Number of stages
    stages = log2(N);

    % FFT computation
    for stage = 1:stages
        % Number of points in each FFT stage
        num_points = 2^stage;
        half_points = num_points / 2;

        % Twiddle factors
        W = exp(-2 * pi * 1i * (0:half_points-1) / num_points);

        for k = 0:N/num_points-1
            for j = 0:half_points-1
                % Indices for the butterfly operation
                idx1 = k * num_points + j + 1; % MATLAB is 1-indexed
                idx2 = idx1 + half_points;

                % Butterfly operation
                temp = X(idx2) * W(j + 1);
                X(idx2) = X(idx1) - temp;
                X(idx1) = X(idx1) + temp;
            end
        end
    end
end

function x_bitreversed = bit_reverse(x)
    % Bit-reverse the input array
    N = length(x);
    n = log2(N);
    x_bitreversed = zeros(size(x));

    for k = 0:N-1
        % Bit-reverse the index
        rev_idx = bin2dec(fliplr(dec2bin(k, n))) + 1; % MATLAB is 1-indexed
        x_bitreversed(rev_idx) = x(k + 1);
    end
end



% b): Example program to Develop decimation in time radix-2 FFT algorithm 

clc;
clear all;
close all;
N = 4; % Length of the input signal (must be a power of 2)
x = [1 2 3 4]; % Example input signal
X = dit_radix2_fft(x); % Compute FFT
disp('Input Signal:');
disp(x);
disp('FFT of the Input Signal:');
disp(X);
