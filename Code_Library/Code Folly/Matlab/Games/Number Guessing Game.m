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

% Classic Mode (User guesses the number)
function [score, elapsedTime] = classic_mode()
    % Set up the game parameters
    disp('Select difficulty level:');
    disp('1. Easy (1 to 50)');
    disp('2. Medium (1 to 100)');
    disp('3. Hard (1 to 200)');
    
    difficulty = input('Choose difficulty (1-Easy, 2-Medium, 3-Hard): ');
    
    % Set the range based on difficulty
    if difficulty == 1
        rangeMin = 1;
        rangeMax = 50;
    elseif difficulty == 2
        rangeMin = 1;
        rangeMax = 100;
    elseif difficulty == 3
        rangeMin = 1;
        rangeMax = 200;
    else
        disp('Invalid choice, defaulting to Medium difficulty.');
        rangeMin = 1;
        rangeMax = 100;
    end
    
    targetNumber = randi([rangeMin, rangeMax]);
    maxGuesses = input('Enter the number of guesses you would like: ');
    attempts = 0;
    tic; % Start the timer
    
    while attempts < maxGuesses
        guessesLeft = maxGuesses - attempts;  % Calculate guesses left
        fprintf('You have %d guesses left.\n', guessesLeft);  % Display guesses left
        guess = input('Enter your guess: ');
        attempts = attempts + 1;

        % Calculate the difference between the guess and the target number
        halfRange = (rangeMax - rangeMin) / 2;
        
        if guess == targetNumber
            fprintf('Congratulations! You guessed the correct number %d in %d attempts.\n', targetNumber, attempts);
            break;
        elseif guess < targetNumber
            % Feedback for guesses below the target number
            if targetNumber - guess > halfRange
                disp('Too low!');
            else
                disp('Low');
            end
        else
            % Feedback for guesses above the target number
            if guess - targetNumber > halfRange
                disp('Too high!');
            else
                disp('High');
            end
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
    tic; % Start the timer
    
    while true
        attempts = attempts + 1;
        guess = round((lowerBound + upperBound) / 2); % Binary search approach
        fprintf('Is your number %d? (1 = too low, 2 = correct, 3 = too high): ', guess);
        userResponse = input('', 's');
        
        if userResponse == '2'
            fprintf('The computer guessed the correct number %d in %d attempts.\n', guess, attempts);
            break;
        elseif userResponse == '1'
            lowerBound = guess + 1; % The number is higher
        elseif userResponse == '3'
            upperBound = guess - 1; % The number is lower
        else
            disp('Invalid input, please respond with 1, 2, or 3.');
        end
    end

    % Calculate elapsed time
    elapsedTime = toc;

    % Score calculation: higher score for fewer attempts and less time
    baseScore = 1000;
    score = max(0, baseScore - attempts * 30 - round(elapsedTime));
    fprintf('The computer took %.2f seconds to guess your number.\n', elapsedTime);
end

% Speed Mode (Guess the number in a limited time)
function [score, elapsedTime] = speed_mode()
    % Set up the game parameters
    targetNumber = randi([1, 100]);
    maxTime = 30; % Time limit in seconds
    tic; % Start the timer
    attempts = 0;
    
    disp('You have 30 seconds to guess the number between 1 and 100!');
    
    while true
        elapsedTime = toc;
        
        if elapsedTime > maxTime
            disp('Time is up! You ran out of time.');
            break;
        end
        
        guess = input('Enter your guess: ');
        attempts = attempts + 1;

        if guess == targetNumber
            fprintf('Congratulations! You guessed the correct number %d in %d attempts.\n', targetNumber, attempts);
            break;
        elseif guess < targetNumber
            disp('Your guess is too low! Try higher.');
        else
            disp('Your guess is too high! Try lower.');
        end
    end
    
    % Calculate elapsed time
    elapsedTime = toc;

    % Score calculation: higher score for fewer attempts and less time
    baseScore = 1000;
    score = max(0, baseScore - attempts * 10 - round(elapsedTime));
    fprintf('You took %.2f seconds to guess the correct number.\n', elapsedTime);
end
