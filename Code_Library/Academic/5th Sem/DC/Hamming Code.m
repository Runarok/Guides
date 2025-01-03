clc;
close all;
clear all;

% Step 1: Input parameters
k = input('Enter the length of the message word: ');  % Length of the message word
n = input('Enter the length of the codeword: ');     % Length of the codeword
p = input('Enter the parity matrix: ');              % Parity matrix

% Step 2: Construct the generator matrix G
disp('Generator matrix:');
G = [eye(k) p];  % G = [I_k | P], where I_k is the identity matrix of size k
disp(G);

% Step 5: Construct the parity check matrix H
H = [p' eye(n - k)];  % H = [P' | I_(n-k)]
disp('H matrix:');
disp(H);
    
% Step 3: Input the message word
m = input('Enter the message word: ');

% Step 4: Encode the message
disp('Codeword:');
C = encode(m, n, k, 'linear', G);  % Encoding using the generator matrix G
disp(C);

% Step 11: Decode the encoded message
D = decode(C, n, k, 'linear', G);  % Decoding using the generator matrix G
disp('Decoded Output:');
disp(D);
    
% Step 6: Generate the syndrome table for error correction
dtable = syndtable(H);

% Step 7: Input the received codeword
R = input('Enter the received codeword: ');

% Step 8: Compute the syndrome
Syndrome = rem(R * H', 2);  % Syndrome = R * H' (mod 2)
disp('Syndrome:');
disp(Syndrome);

% Step 9: Convert the syndrome to a decimal position
Syn_position = bi2de(Syndrome, 'left-msb');
disp('Syndrome position:');
disp(Syn_position);

% Step 10: Error detection and correction
if (Syndrome == 0)
    disp('The received codeword is valid.');
else
    disp('The received codeword is invalid.');
    E = dtable(Syn_position + 1, :);  % Find the error vector from the syndrome table
    disp('The corrected word is:');
    CC = rem(R + E, 2);  % Correct the received codeword by adding the error vector
    disp(CC);
    % Extract the original message from the corrected codeword
    msg = CC(1:k);
end
