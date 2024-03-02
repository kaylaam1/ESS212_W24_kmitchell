clear all
clc

%inital guess
beta_0 = [1 2 3]'; 
%tolerance for convergence
tol = .01;
%maximum number of iterations
max_iter = 10;

x = [-4 0 4]';
y = [30 2 6]';
%first call newtons method using beta_0 as initial guess
beta_1 = newtons_method(@F, @J, x,y, beta_0,tol, max_iter);
%second call, beta_1 used as initial guess and beta_2 is updated with 
%refined estimates for coefficients
beta_2 = newtons_method(@F, @J, x,y, beta_1,tol, max_iter);


function F_val = F(beta, x, y)
    A = beta(1);
    B = beta(2);
    C = beta(3);
    F_val = [ y(1) - A * (x(1) - B) * (x(1) - C); y(2) - A * (x(2) - B) * (x(2) - C); y(3) - A * (x(3) - B) * (x(3) - C) ];
end

function J_val = J(beta, x)
    A = beta(1);
    B = beta(2);
    C = beta(3);
    J_val = [ -(x(1) - B) * (x(1) - C), A * (x(1) - C), A * (x(1) - B); -(x(2) - B) * (x(2) - C), A * (x(2) - C), A * (x(2) - B);
        -(x(3) - B) * (x(3) - C), A * (x(3) - C), A * (x(3) - B)];
end

function beta_sol = newtons_method(F, J, x, y, beta_i, tol, max_iter)
    beta = beta_i;
    for i = 1:max_iter
        F_val = F(beta, x, y);
        J_val = J(beta, x);
        delta = -J_val \ F_val;
        beta1 = beta + delta;
        %check for convergence
        if norm(delta) < tol
            beta_sol = beta1;
            return;
        end
        beta = beta1;
      
    end
end



