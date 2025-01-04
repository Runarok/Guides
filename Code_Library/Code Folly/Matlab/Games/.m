% Simple Number Guessing Game in MATLAB

% Initialize the game
clc;
clear;
close all;

% Generate a random number between 1 and 100
targetNumber = randi([1, 100]);

% Initialize number of attempts
attempts = 0;

% Welcome message
disp('Welcome to the Number Guessing Game!');
disp('I have selected a number between 1 and 100.');
disp('Try to guess it!');
disp(' ');

% Game loop
while true
    % Get user input
    guess = input('Enter your guess: ');
    
    % Increment the attempt counter
    attempts = attempts + 1;
    
    % Check if the guess is correct, too high, or too low
    if guess == targetNumber
        fprintf('Congratulations! You guessed the correct number %d in %d attempts.\n', targetNumber, attempts);
        break; % Exit the game loop
    elseif guess < targetNumber
        disp('Too low! Try again.');
    else
        disp('Too high! Try again.');
    end
end
