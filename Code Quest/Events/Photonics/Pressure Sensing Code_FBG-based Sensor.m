clc;           % Clears the command window
close all;     % Closes all open figure windows
clear all;     % Clears all variables from the workspace

% --- Strain-optic tensor components ---
P11 = 0.113;   % Component of strain-optic tensor (dimensionless)
P12 = 0.252;   % Component of strain-optic tensor (dimensionless)

% --- Fiber and material parameters ---
NEFF = 1.482;  % Effective refractive index of the fiber core
V = 0.33;      % Poisson’s ratio of the material (dimensionless)

% --- Strain-optic constant PE ---
% This constant defines how the effective refractive index changes under strain.
% It is derived from the strain-optic tensor and Poisson's ratio
PE = (((NEFF)^2)/2) * (P12 - V * (P11 + P12));  

% --- Bragg wavelength of the FBG (Fiber Bragg Grating) ---
LAMBDAB = 1550e-9;  % Central wavelength (in meters)

% --- Measured strain values (from experiment or simulation) ---
E = [0.000068, 0.000171, 0.0003166, 0.0005283];  % Strain (dimensionless)

% --- Corresponding applied pressure values ---
P = [0.012, 0.021, 0.05, 0.054];  % Pressure values in MPa (MegaPascals)

% --- Wavelength shift due to applied pressure ---
% Formula: Δλ = λ * (1 - PE) * strain
% This equation gives the wavelength shift due to the strain induced by pressure
DELTALAMBDA = LAMBDAB * (1 - PE) .* E;  

% --- Plotting the results ---
plot(P, DELTALAMBDA, '-ob', 'LineWidth', 2, 'MarkerSize', 6);  % Plot pressure vs. wavelength shift
grid on;                 % Display grid on plot
xlabel('Pressure (MPa)');  % X-axis label
ylabel('Wavelength Shift (m)');  % Y-axis label
title('Pressure Sensing using FBG');  % Title for the plot
