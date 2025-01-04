clc;
clear;

disp('Welcome to Rock, Paper, Scissors!');
disp('--------------------------------');
disp('Instructions:');
disp('1. Type "Rock", "Paper", or "Scissors" to make your choice.');
disp('2. Type "q" to quit the game.');
disp('--------------------------------');

choices = {'Rock', 'Paper', 'Scissors'};

while true
    % Prompt user for input
    user_choice = input('Enter your choice (Rock, Paper, Scissors or q to quit): ', 's');
    
    % Exit the game if user chooses 'q'
    if strcmp(user_choice, 'q')
        disp('Thanks for playing!');
        break;
    % Validate the user input
    elseif ~ismember(user_choice, choices)
        disp('Invalid input. Please choose Rock, Paper, or Scissors.');
        disp('Tip: Make sure to type your choice exactly as shown.');
        continue;
    end
    
    % Display user's choice
    disp(['You chose: ', user_choice]);
    
    % Computer randomly selects a choice
    computer_choice = choices{randi(3)};
    disp(['Computer chose: ', computer_choice]);
    
    % Determine and display the winner
    if strcmp(user_choice, computer_choice)
        disp('It''s a tie! You both chose the same.');
    elseif (strcmp(user_choice, 'Rock') && strcmp(computer_choice, 'Scissors')) || ...
           (strcmp(user_choice, 'Paper') && strcmp(computer_choice, 'Rock')) || ...
           (strcmp(user_choice, 'Scissors') && strcmp(computer_choice, 'Paper'))
        disp('You win! Your choice beats the computer''s choice.');
    else
        disp('You lose! The computer''s choice beats yours.');
    end
    
    % Give the player a chance to play again or quit
    disp('--------------------------------');
    disp('Would you like to play again?');
end
