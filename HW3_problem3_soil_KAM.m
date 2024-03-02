clear all

%HW 3 Problem 3: Soil Response to CO2 and H2O

% Define the labels for CO2 and water levels
labels_CO2 = ['B', 'B', 'A', 'A', 'B', 'B', 'A', 'A', 'B', 'B', 'A', 'A', 'B', 'B','A','A'];
labels_H2O = ['a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b'];
% labels_CO2 = ['A', 'A', 'B', 'B', 'A', 'A', 'B', 'B', 'A', 'A', 'B', 'B', 'A', 'A', 'B', 'B'];
% labels_H2O = ['a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b'];
% 
%A is the matrix representing the model in question 3


%vectors indicating difference in CO2 and H20
Delta_CO2 = (labels_CO2 == 'B');
Delta_H2O = (labels_H2O == 'b');

Delta_CO2 = Delta_CO2';
Delta_H2O = Delta_H2O';
% Construct the design matrix A
A = [ones(length(labels_CO2), 1), Delta_CO2, Delta_H2O, Delta_CO2 .* Delta_H2O];

% Define d (resulting masses vector)
%could use random numbers, idk. i just made d be ones
d = [ones(16,1)]; %

% Define matrix A and parameter vector beta
A = [ones(length(labels_CO2), 1), Delta_CO2, Delta_H2O, Delta_CO2 .* Delta_H2O];
beta = (A' * A) \ (A' * d);

% Calculate A'^TA and A'^Td
ATA = A' * A;
ATd = A' * d;

% Display matrix A, parameter vector beta, A'^TA, and A'^Td
disp('Matrix A:');
disp(A);
disp('Parameter Vector beta:');
disp(beta);
disp('Matrix A''A:');
disp(ATA);
disp('Matrix A''d:');
disp(ATd);