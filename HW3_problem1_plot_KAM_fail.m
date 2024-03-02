clc
clear all
%Checking for Convergence of Newton's Method on the B and C Plane

x = [-4 0 4]';
y = [30 2 6]';
%tolerance for convergence
tol = 1e-6;
% Max # iterations for Newton's method
max_iter = 100;
%initial guesses for B and C
B_values = -100:1:100;
C_values = -100:1:100;

%matrix to store convergence status
convergence_matrix = zeros(length(B_values), length(C_values));

% Iterate over initial guesses grid
for i = 1:length(B_values)
    for j = 1:length(C_values)
        % Initial guess for A
        A_guess = 1;
        
        % Initial guess for B and C
        beta_0 = [A_guess; B_values(i); C_values(j)];
        
        % Newton's method
        beta_final = newtons_method(@F, @J, x, y, beta_0, tol, max_iter);
        
        %check for convergence
        if norm(beta_final - beta_0) < tol
            convergence_matrix(i, j) = 1; % Convergence achieved
        end
    end
end

% Plot convergence points
[BC_converged_B, BC_converged_C] = find(convergence_matrix);
scatter(BC_converged_B, BC_converged_C);
xlabel('B');
ylabel('C');
%functions F and J
function F_val = F(beta, x, y)
    A = beta(1);
    B = beta(2);
    C = beta(3);
    F_val = [ y(1) - A * (x(1) - B) * (x(1) - C); 
              y(2) - A * (x(2) - B) * (x(2) - C); 
              y(3) - A * (x(3) - B) * (x(3) - C) ];
end

function J_val = J(beta, x)
    A = beta(1);
    B = beta(2);
    C = beta(3);
    J_val = [ -(x(1) - B) * (x(1) - C), A * (x(1) - C), A * (x(1) - B); 
              -(x(2) - B) * (x(2) - C), A * (x(2) - C), A * (x(2) - B);
              -(x(3) - B) * (x(3) - C), A * (x(3) - C), A * (x(3) - B)];
end

% Newton's method 
function beta_sol = newtons_method(F, J, x, y, beta_i, tol, max_iter)
    beta = beta_i;
    for i = 1:max_iter
        F_val = F(beta, x, y);
        J_val = J(beta, x);
        delta = -J_val \ F_val;
        beta1 = beta + delta;
        % Check for convergence
        if norm(delta) < tol
            beta_sol = beta1;
            return;
        end
        beta = beta1;
    end
    % If max iterations reached without convergence
    beta_sol = beta;
end