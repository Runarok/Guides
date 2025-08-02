% Enhanced Number Guessing Game with Score System and Randomized Game Modes

% Function to play the game
function play_game()
    clc;
    clear;
    close all;

    % Welcome message
    disp('Welcome to the Enhanced Number Guessing Game!');
    disp('Choose a game mode:');
    disp('1. Classic Mode (You guess the number)');
    disp('2. Reverse Mode (Computer guesses your number)');
    disp('3. Speed Mode (Guess the number in a limited time)');
    disp(' ');

    while true
        % Select the game mode
        mode = input('Choose game mode (1-Classic, 2-Reverse, 3-Speed): ');
        
        % Validate mode input
        if ~ismember(mode, [1, 2, 3])
            disp('Invalid choice! Please select a valid game mode.');
            continue;
        end
        
        % Set up the game based on the mode
        if mode == 1
            % Classic Mode (User guesses the number)
            [score, elapsedTime] = classic_mode();
        elseif mode == 2
            % Reverse Mode (Computer guesses the number)
            [score, elapsedTime] = reverse_mode();
        elseif mode == 3
            % Speed Mode (Guess the number in a limited time)
            [score, elapsedTime] = speed_mode();
        end

        % Display score
        fprintf('Your score is: %d\n', score);
        
        % Ask if the user wants to play again
        play_again = input('Do you want to play again? (y/n): ', 's');
        if lower(play_again) ~= 'y'
            disp('Thank you for playing! Goodbye!');
            break;
        end
    end
end

function [score, elapsedTime] = classic_mode()
    % Set up the game parameters
    targetNumber = randi([1, 100]);
    maxGuesses = input('Enter the number of guesses you would like: ');
    attempts = 0;
    disp('Game starts now!');
    tic; % Start the timer when the game actually starts
    
    while attempts < maxGuesses
        % Get the user's guess and check if it's empty
        guessStr = input('Enter your guess: ', 's');  % 's' allows string input
        if isempty(guessStr) || ~isnumeric(str2double(guessStr)) || str2double(guessStr) < 1 || str2double(guessStr) > 100
            disp('Invalid input! Please enter a number between 1 and 100.');
            continue; % Skip the rest of the loop and ask for the guess again
        end
        
        guess = str2double(guessStr); % Convert the input to a number
        attempts = attempts + 1;

        % Calculate the difference between the guess and the target number
        range = 100; % Range of numbers
        halfRange = range / 2;
        
        if guess == targetNumber
            fprintf('Congratulations! You guessed the correct number %d in %d attempts.\n', targetNumber, attempts);
            break;
        elseif guess < targetNumber
            % Feedback for guesses below the target number
            difference = targetNumber - guess;
            if difference > halfRange
                disp(['Too low! The number is much higher than your guess. Try a larger number.']);
            else
                disp(['Low. You\'re close, but the number is slightly higher. Try guessing a bit higher.']);
            end
        else
            % Feedback for guesses above the target number
            difference = guess - targetNumber;
            if difference > halfRange
                disp(['Too high! The number is much lower than your guess. Try a smaller number.']);
            else
                disp(['High. You\'re close, but the number is slightly lower. Try guessing a bit lower.']);
            end
        end


    % Calculate elapsed time
    elapsedTime = toc;

    % Score calculation: higher score for fewer attempts and less time
    baseScore = 1000;
    score = max(0, baseScore - attempts * 20 - round(elapsedTime));
    fprintf('You took %.2f seconds to guess the correct number.\n', elapsedTime);
end

% Reverse Mode (Computer guesses the number)
function [score, elapsedTime] = reverse_mode()
    % Set up the game parameters
    disp('Think of a number between 1 and 100, and the computer will try to guess it!');
    lowerBound = 1;
    upperBound = 100;
    attempts = 0;
    disp('Game starts now!');
    tic; % Start the timer when the game actually starts
    
    while true
        attempts = attempts + 1;
        guess = round((lowerBound + upperBound) / 2); % Binary search approach
        fprintf('Is your number %d? (1 = too low, 2 = correct, 3 = too high): ', guess);
        
        userResponse = input('', 's');
        
        % Ensure the user provides valid input
        if userResponse == '2'
            fprintf('The computer guessed the correct number %d in %d attempts.\n', guess, attempts);
            break;
        elseif userResponse == '1'
            lowerBound = guess + 1; % The number is higher
        elseif userResponse == '3'
            upperBound = guess - 1; % The number is lower
        else
            disp('Invalid input, please respond with 1, 2, or 3.');
            attempts = attempts - 1; % Do not count invalid attempts
        end
    end

    % Score calculation: based on attempts only, not time
    baseScore = 1000;
    score = max(0, baseScore - attempts * 30);
end

function [score, elapsedTime] = reverse_mode()
    % Set up the game parameters
    disp('Think of a number between 1 and 100, and the computer will try to guess it!');
    lowerBound = 1;
    upperBound = 100;
    attempts = 0;
    disp('Game starts now!');
    tic; % Start the timer when the game actually starts
    
    while true
        attempts = attempts + 1;
        guess = round((lowerBound + upperBound) / 2); % Binary search approach
        fprintf('Is your number %d? (1 = too low, 2 = correct, 3 = too high): ', guess);
        
        % Loop until the user provides valid input
        validInput = false;
        while ~validInput
            userResponse = input('', 's');
            
            if userResponse == '2'
                fprintf('The computer guessed the correct number %d in %d attempts.\n', guess, attempts);
                validInput = true;
                break;
            elseif userResponse == '1'
                lowerBound = guess + 1; % The number is higher
                validInput = true;
            elseif userResponse == '3'
                upperBound = guess - 1; % The number is lower
                validInput = true;
            else
                disp('Invalid input, please respond with 1, 2, or 3.');
            end
        end
    end

    % Stop the timer
    elapsedTime = toc;
    
    % Score calculation: based on attempts only, not time
    baseScore = 1000;
    score = max(0, baseScore - attempts * 30);
end
