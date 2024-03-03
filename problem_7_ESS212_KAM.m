clear all
%Problem 7
% compute and visualize the Mandelbrot set for specified range of 
% Define the range of x and y values
x = linspace(-2, 0.5, 1000);
y = linspace(-1.5, 1.5, 1000);

% make meshgrid of complex numbers
[X, Y] = meshgrid(x, y);


%make the real component of c be X and the imaginary be Y
c_vals = X + 1i *Y;

%check points in the grid to see if they belong to the Mandelbrot set
%specify maximum value to iterate to
iteration_max = 100;
mandelbrot = arrayfun(@(c) check_mandelbrot(c, iteration_max), c_vals);

% Plot the Mandelbrot set
figure(1)
imagesc(x, y, mandelbrot);
% colormap('gray');
title('The Mandelbrot Set');
xlabel('Real(c)');
ylabel('Imag(c)');
axis image
%c vals. can specify the iteration_max parameter to set the # of iterations 
%that you check each point is in the set

% Define fxn f_c = z^2 + c

function result = f_c(z, c)
    result = z.^2 + c;
end

% Define function to check if a point, c, belongs to the Mandelbrot set
function result = check_mandelbrot(c, iteration_max)
    z = 0;
    for iter = 1:iteration_max
        z = f_c(z, c);
        %point is not part of set if iterates escape
        if abs(z) > 2  
            result = false;
            return;
        end
    end
    %point is part of set if iterates stay bounded
    result = true; 
end
