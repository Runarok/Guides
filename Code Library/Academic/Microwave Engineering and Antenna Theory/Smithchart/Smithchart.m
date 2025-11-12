t = linspace(0, 2*pi, 100); % parameter for plotting
x = cos(t);
y = sin(t);

% Plot the main circle
figure;
plot(x, y, 'linewidth', 3);
axis equal;
title('Smith Chart');
set(gca, 'xticklabel', []);
set(gca, 'yticklabel', []);
hold on;

% Draw circles along the horizontal axis (real axis)
k = [0.25 0.5 0.75];
for i = 1:length(k)
    x_circle = k(i) + (1 - k(i)) * cos(t); % Circle equation along real axis
    y_circle = (1 - k(i)) * sin(t); % Circle equation along imaginary axis
    plot(x_circle, y_circle, 'k'); % Plot each circle
end

% Draw partial circles along the vertical axis (imaginary axis)
kt = [2.5 pi 3.79 4.22]; % Angles for partial circles
k_values = [0.5 1 2 4]; % Values for the vertical axis circles
for i = 1:length(k_values)
    t_partial = linspace(kt(i), 1.5*pi, 50); % Adjust angle range for partial circles
    a = 1 + k_values(i) * cos(t_partial); % Horizontal (real part)
    b = k_values(i) * sin(t_partial); % Vertical (imaginary part)
    plot(a, b, 'k:', a, -b, 'k:'); % Plot partial circles on both sides of the real axis
end
