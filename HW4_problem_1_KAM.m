%HW 4
%problem 1
clear all
close all
clc

%make column of time and data
t = [1:10]';
d = [-2.73,-2.71,-2.65,-0.87,-3.10,-1.03,0.63,1.46,5.90,8.38]';
%number of data
N = 10;
%number of parameters (a b c)
k = 3;
%dont know how its spelled, symbol looks like a curvy V,
%i will call it "neu" becuz that's what it sounds like
neu = N - k;
%beta would be represented as [c b a]';

%design matrix A where column of ones is implicit when
%input into the fitlm function
% p = [t.^0,t.^1,t.^2];
p = [t.^1,t.^2];

%linear model
lm = fitlm(p,d);

%a_hat, b_hat, and c_hat
a_hat = lm.Coefficients.Estimate(3);
b_hat = lm.Coefficients.Estimate(2);
c_hat = lm.Coefficients.Estimate(1);
%we must assign std dev to a b and c
std_a = lm.Coefficients.SE(3);
std_b = lm.Coefficients.SE(2);
std_c = lm.Coefficients.SE(1);
%do we multiply this by sqrt neu/neu-2?

std_a2 = std_a * sqrt(neu/(neu-2));
std_b2 = std_b * sqrt(neu/(neu-2));
std_c2 = std_c * sqrt(neu/(neu-2));

a = a_hat + std_a2;
a2 = a_hat - std_a2;
b = b_hat + std_a2;
b2 = b_hat - std_a2;
c = c_hat + std_b2;
c2 = c_hat - std_c2;
%lets find beta_hat
%try again?
p2 = [t.^0,t.^1,t.^2];
%same as (A'A)\A'y (when we were calling the data y)
beta_hat = p\d;
beta_hat2 = p2\d;


fprintf('a = %d +/- %d \n',a_hat,std_a2);
fprintf('b = %d +/- %d \n',b_hat,std_b2);
fprintf('c = %d +/- %d \n',c_hat,std_c2);


t12=(1:12)';

model_12=a_hat.*t12.^2+b_hat.*t12+c_hat;

n=5000;



sigma_a =a_hat + 1*std_a2*randn(n,1);
sigma_b =b_hat + 1*std_b2*randn(n,1);
sigma_c =c_hat + 1*std_c2*randn(n,1);



figure(1)
for i=1:n
    hold on
    plot(t12,sigma_a(i).*t12.^2+sigma_b(i).*t12+sigma_c(i),'b','LineWidth',2)
    
end
plot(t,d,'o','Linewidth',2)
plot(t12,model_12,'k','LineWidth',2)

hold off

error_12 = [];
for i = 1:n
    error_12(i)=sigma_a(i).*12.^2+sigma_b(i).*12+sigma_c(i);
end


d12=a_hat.*12^2+b_hat.*12+c_hat;



figure(2) 
hist(error_12-d12,40)


error_12 = std(error_12-d12)

