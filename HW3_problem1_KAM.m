
clear all
clc

%make projection
X=[16,-4,1; 0,0,1; 16,4,1];
X_T=transpose(X);

d=[30 2 6]';

%solve system by inverting matrix
%use least squares solution
projection=(X_T*X)\X_T*d;
%difference between projected values and data points
error_vect = projection-d;

disp("Projection:")
disp(strcat("a = ",num2str(projection(1))));
disp(strcat("b = ",num2str(projection(2))));
disp(strcat("c = ",num2str(projection(3))));

disp(strcat("Error = ",num2str(error_vect)));