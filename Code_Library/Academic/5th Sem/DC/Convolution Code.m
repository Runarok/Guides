clc;
clear all;
close all;

% Take user input for parameters
k = input('Number of shift registers: ');  % Number of shift registers (constraint length)
g1=input('Enter the value to generator1:');  % Generator polynomial 1 (Decimal input)
g2=input('Enter the value to generator2:');  % Generator polynomial 2 (Decimal input)
m = input('Enter message bits: ');  % Input message bits (binary)

% Create a trellis structure for the convolutional encoder
trel = poly2trellis(k, [g1 g2]);

% Perform convolutional encoding
encoded = convenc(m, trel);

% Display the encoded output
disp('Encoded output:');
disp(encoded);

% Decoding the encoded message using Viterbi algorithm
tblen = length(m);  % Define the traceback length (equal to the length of the input message)
decoded = vitdec(encoded, trel, tblen, 'trunc', 'hard');

% Display the decoded output
disp('Decoded output:');
disp(decoded);
