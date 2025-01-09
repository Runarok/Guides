clc; close all; clear all;

% Define the set of input vectors (3x3 matrix where each column is a vector)
V = [1 1 0; 1 0 1; 0 1 1]'; % Linearly Independent vectors
%V = rand(3, 3);              % Random vectors
%V = [1 2 3; 1 5 2; 2 4 6]'; % Linearly Dependent
%V = [3 2 1; 1 2 3; 0 1 4];  % Another set of vectors (potentially linearly dependent)

% Number of vectors (columns in V)
n = size(V, 2); % This is the number of columns (i.e., number of vectors)

% Initialize the matrix for orthogonal vectors
U = zeros(size(V)); % Matrix to store the orthogonalized vectors

% Gram-Schmidt Process to orthogonalize the vectors
for i = 1:n
    % Start with the original vector
    U(:, i) = V(:, i);

    % Subtract projections of previous orthogonal vectors
    for j = 1:i-1
        % Projection formula: proj(Uj, Vi) = (dot(Uj, Vi) / dot(Uj, Uj)) * Uj
        U(:, i) = U(:, i) - (dot(U(:, j), V(:, i)) / dot(U(:, j), U(:, j))) * U(:, j);
    end
end

% Normalize the orthogonal vectors to make them orthonormal
E = zeros(size(U)); % Matrix to store the orthonormal vectors
for i = 1:n
    E(:, i) = U(:, i) / norm(U(:, i)); % Normalize each orthogonal vector
end

% Display the results
disp('Original Vectors (V):');
disp(V); % Display the original vectors
disp('Orthogonal Vectors (U):');
disp(U); % Display the orthogonalized vectors
disp('Orthonormal Vectors (E):');
disp(E); % Display the orthonormalized vectors

% Plotting the original vectors
figure;
hold on;
grid on;

% Plot the original vectors in 3D
quiver3(0, 0, 0, V(1, 1), V(2, 1), V(3, 1), 'r', 'LineWidth', 2);
quiver3(0, 0, 0, V(1, 2), V(2, 2), V(3, 2), 'g', 'LineWidth', 2);
quiver3(0, 0, 0, V(1, 3), V(2, 3), V(3, 3), 'b', 'LineWidth', 2);

% Plot the orthonormal vectors in 3D
quiver3(0, 0, 0, E(1, 1), E(2, 1), E(3, 1), 'r--', 'LineWidth', 2);
quiver3(0, 0, 0, E(1, 2), E(2, 2), E(3, 2), 'g--', 'LineWidth', 2);
quiver3(0, 0, 0, E(1, 3), E(2, 3), E(3, 3), 'b--', 'LineWidth', 2);

% Setting up the plot
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Gram-Schmidt Orthonormalization');
legend({'V1', 'V2', 'V3', 'E1', 'E2', 'E3'}, 'Location', 'Best');
axis equal; % Make sure the axis is scaled equally for X, Y, and Z
hold off;
