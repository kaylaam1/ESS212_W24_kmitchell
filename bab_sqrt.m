function x = bab_sqrt(c, tol)
%start with initial guess of x0
    x = c / 2;  
    while abs(x^2 - c) > tol
        %iterate using reccurence relation
        x = 0.5* (x+c / x);
    end
end
