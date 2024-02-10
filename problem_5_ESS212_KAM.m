%problem 5
%a. compute the sequence S(n) for n = 0,1,...,N
%c. verify computer program produces same sequence as closed form solution from part b
%(part c starts on line 49)

clear all

%initial conditions
S_0 = 0;
S_1 = 1;
%choose a N 
N = 20;
%define the first two sequence numbers as stated by initial conditions
S_n = [S_0, S_1];
%for the loop, start at step 3 and go to any specified N
n = [3:N];


%fill in sequence starting at 3 using the formula provided
for i = n
    S_n(i) = 2*S_n(i-1) + 2*S_n(i-2);
end


%find where fxn_b intersects 6 to compute b
%the value 6 comes from solving the sequence in the written portion

%define "x values" for b
b = -N:N;
%this is the function of b that I found in the written portion
fxn_b = 1./(b-(2-b))  .* (b.^3 - (2-b).^3);
%plot the function of b
figure(1)
plot(b, fxn_b)
hold on
plot(b,ones(1,length(b))*6);
ylim([5 7])
xlim([-1.4 0])
hold off
%fxn b crosses 6 at -0.7321
%this is equal to 1 - sqrt(3)
%print what b is: 
fprintf('b is:')
1 - sqrt(3)

%part c. using closed form solution from part b,
A = 1/(2*sqrt(3));
B = -A;
b = 1 - sqrt(3);
a = 1 + sqrt(3);

%compute S_n again using the solution computed in the written portion
%call this S_n2
n = [0:N-1];
S_n2 = A*(a.^n) + B*(b.^n);
S_n2 = round(S_n2);
%sum the differences to check if S_n and S_n2 are the same
sum(S_n2 - S_n)
%print the answer : zero
fprintf('sequences are the same!')
