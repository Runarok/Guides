clc;
clear all;
close all;

% Step 1: Input the number of symbols
x = input('Enter the Number of Symbols: ');  
N = 1:x;  % Symbol set
disp('Number of Symbols are:');
disp(N);

% Step 2: Input the probabilities for each symbol
P = input('Enter the Probability: ');

% Step 3: Sort the probabilities in descending order
S = sort(P, 'descend');
disp('Sorted Probability are:');
disp(S);

% Step 4: Generate Huffman dictionary
[dict, avglen] = huffmandict(N, S);
disp('Average length is:');
disp(avglen);

% Step 5: Calculate the entropy of the source
H = 0;
for i = 1:x
    H = H + (P(i) * log2(1 / P(i)));  % Entropy formula: H = - Σ P(i) * log2(P(i))
end;
disp('Entropy is:');
disp(H);

% Step 6: Calculate the efficiency of the Huffman coding
Efficiency = (H / avglen) * 100;
disp('Efficiency is:');
disp(Efficiency);

% Step 7: Encode the symbols using Huffman coding
Codeword = huffmanenco(N, dict);
disp('Codeword is:');
disp(Codeword);

% Step 8: Decode the Huffman encoded symbols
disp('Decoded symbols are:');
decode = huffmandeco(Codeword, dict);
disp(decode);
