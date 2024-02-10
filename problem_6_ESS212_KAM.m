clear all
%problem 6: babylonian 
%b: estimate square root of c with given tolerance
%c: write unit tests to demonstrate function works
%d: recurrence relation converges to sqrt of c for any initial
%guess of x_o as long as it is a positive real number
%for what values of x_o = x(0), the recurrence relation
%converges to sqrt c includes all positive real numbers

%specify a c
%i like the number 144
c = 144;
%specify a tolerance (this works for smaller tolerances too)
tol = 1e-5; 
sqrt_c = bab_sqrt(c,tol);

check_bab_sqrt(tol)
function x = bab_sqrt(c, tol)
%start with initial guess of x0
    x = c / 2;  
    while abs(x^2 - c) > tol
        %iterate using reccurence relation
        x = 0.5* (x+c / x);
    end
end


function check_bab_sqrt(tol)
%check that output satisfies |x^2 - c| < tol
%specify tol as input
%use 3 different values for c
    c = 300;    
    sqrt_c = bab_sqrt(c, tol);
    assert(abs(sqrt_c^2 - c) < tol, 'Error: x^2 - c > tol');

    c = 3;
    sqrt_c = bab_sqrt(c, tol);
    assert(abs(sqrt_c^2 - c) < tol, 'Error: x^2 - c > tol');

    c = 13;
    sqrt_c = bab_sqrt(c, tol);
    assert(abs(sqrt_c^2 - c) < tol, 'Error: x^2 - c > tol');
%if output satisfies |x^2 - c| < tol, say that it does
%it does! the function works.
    disp('Check complete, output satisfies |x^2 - c| < tol');
end