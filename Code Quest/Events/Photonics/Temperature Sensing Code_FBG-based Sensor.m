clc;           % Clears the command window
clear all;     % Clears all variables from the workspace
close all;     % Closes all open figure windows

% --- Thermal expansion coefficient of the optical fiber material ---
EETATHERMAL = 6.6e-5;  % Thermal expansion coefficient (per °C)

% --- Temperature range for analysis ---
DELTATEMP = 0:5:80;  % Temperature change from 0°C to 80°C in steps of 5°C

% --- Bragg wavelength of the FBG (Fiber Bragg Grating) ---
LAMBDAB = 1550e-9;  % Central Bragg wavelength (in meters)

% --- Wavelength shift due to temperature change ---
% Formula: Δλ = λ * α * ΔT
% α (thermal expansion coefficient), ΔT is temperature change
DELTALAMBDA = LAMBDAB * EETATHERMAL * DELTATEMP;  

% --- Plotting the results ---
plot(DELTATEMP, DELTALAMBDA, '--rs', 'LineWidth', 2, 'MarkerSize', 6);  % Plot temp vs. wavelength shift
grid on;                         % Display grid
xlabel('Temperature Change (°C)');   % X-axis label
ylabel('Wavelength Shift (m)');     % Y-axis label
title('Temperature Sensing using FBG');  % Title for the plot
