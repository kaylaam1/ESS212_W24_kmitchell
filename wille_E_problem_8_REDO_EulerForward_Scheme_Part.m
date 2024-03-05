clear all
close all
clc
g = 9.81; % Acceleration due to gravity (m/s^2)
t_final = 5; % Final time (s)
delta_t = 1; % Time step (s)

% Initial conditions
z0 = 100; % Initial height (m)
v0 = 0; % Initial velocity (m/s)

% Arrays to store results
time = 0:delta_t:t_final;
height = zeros(size(time));
velocity = zeros(size(time));
potential_energy = zeros(size(time));
kinetic_energy = zeros(size(time));
total_energy = zeros(size(time));

% Euler forward scheme
for i = 1:length(time)
    % Calculate height and velocity
    height(i) = z0 - g * (i - 1) * delta_t^2 / 2;
    velocity(i) = -g * (i - 1) * delta_t;
    
    % Calculate potential and kinetic energy
    potential_energy(i) = g * height(i);
    kinetic_energy(i) = 0.5 * v0^2;
    
    % Update total energy
    total_energy(i) = potential_energy(i) + kinetic_energy(i);
end

% Print results
for i = 1:length(time)
    fprintf('At t = %d s, Wile-E''s height = %.2f m.\n', time(i), height(i));
end
fprintf('Ground level reached at t = %d s.\n', t_final);