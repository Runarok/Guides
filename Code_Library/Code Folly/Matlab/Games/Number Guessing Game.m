% Enhanced Number Guessing Game in MATLAB

% Initialize the game
clc;
clear;
close all;

% Welcome message
disp('Welcome to the Enhanced Number Guessing Game!');
disp('I will select a number between 1 and 100.');
disp('You can set the number of guesses you want to make.');
disp(' ');

% Set the maximum number of guesses
maxGuesses = input('Enter the number of guesses you would like: ');

% Generate a random number between 1 and 100
targetNumber = randi([1, 100]);

% Initialize attempt counter
attempts = 0;

% Array of diverse messages
lowMessages = {'Too low!', 'Not quite, try higher.', 'Your guess is too small.'};
highMessages = {'Too high!', 'Close, but lower.', 'Your guess is too large.'};

% Game loop
while attempts < maxGuesses
    % Get user input
    guess = input('Enter your guess: ');
    
    % Increment the attempt counter
    attempts = attempts + 1;
    
    % Check if the guess is correct, too high, or too low
    if guess == targetNumber
        fprintf('Congratulations! You guessed the correct number %d in %d attempts.\n', targetNumber, attempts);
        break; % Exit the game loop
    elseif guess < targetNumber
        disp(lowMessages{randi(length(lowMessages))}); % Randomly choose a "too low" message
    else
        disp(highMessages{randi(length(highMessages))}); % Randomly choose a "too high" message
    end
    
    % If maximum guesses are reached
    if attempts == maxGuesses
        disp('Sorry, you have run out of guesses!');
        fprintf('The correct number was %d.\n', targetNumber);
        break;
    end
end

disp('Thank you for playing!');
