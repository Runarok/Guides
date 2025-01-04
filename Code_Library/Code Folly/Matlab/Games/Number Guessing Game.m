% Enhanced Number Guessing Game in MATLAB

% Function to play the game
function play_game()
    clc;
    clear;
    close all;

    % Welcome message
    disp('Welcome to the Enhanced Number Guessing Game!');
    disp('I will select a number between 1 and 100.');
    disp('You can set the number of guesses you want to make.');
    disp(' ');

    while true
        % Set the maximum number of guesses
        maxGuesses = input('Enter the number of guesses you would like: ');

        % Validate number of guesses
        if ~isnumeric(maxGuesses) || maxGuesses <= 0
            disp('Please enter a valid positive number of guesses.');
            continue;
        end
        
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
                    disp('Very close, but still a little too low! You are so close!');
                elseif targetNumber - guess <= 10
                    disp('Close, but you need to guess higher!');
                else
                    disp('Your guess is too low! Try a much higher number.');
                end
                fprintf('Range: %d - 100\n', guess+1); % Suggest range above guess
            else
                % Specific message for "too high"
                if guess - targetNumber <= 5
                    disp('Very close, but still a little too high! Almost there!');
                elseif guess - targetNumber <= 10
                    disp('Close, but you need to guess lower!');
                else
                    disp('Your guess is too high! Try a much lower number.');
                end
                fprintf('Range: 1 - %d\n', guess-1); % Suggest range below guess
            end

            % If maximum guesses are reached
            if attempts == maxGuesses
                disp('Sorry, you have run out of guesses!');
                fprintf('The correct number was %d.\n', targetNumber);
                break;
            end
        end

        % Ask if the user wants to play again
        play_again = input('Do you want to play again? (y/n): ', 's');
        if lower(play_again) ~= 'y'
            disp('Thank you for playing! Goodbye!');
            break;
        end
    end
end

% Call the function to start the game
play_game();
