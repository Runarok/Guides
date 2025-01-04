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
        % Specific message for "too low"
        if targetNumber - guess <= 5
            disp('Very close, but still a little too low!');
        elseif targetNumber - guess <= 10
            disp('Close, but you need to guess higher!');
        else
            disp('Your guess is too low! Try a much higher number.');
        end
    else
        % Specific message for "too high"
        if guess - targetNumber <= 5
            disp('Very close, but still a little too high!');
        elseif guess - targetNumber <= 10
            disp('Close, but you need to guess lower!');
        else
            disp('Your guess is too high! Try a much lower number.');
        end
    end
    
    % If maximum guesses are reached
    if attempts == maxGuesses
        disp('Sorry, you have run out of guesses!');
        fprintf('The correct number was %d.\n', targetNumber);
        break;
    end
end

disp('Thank you for playing!');
