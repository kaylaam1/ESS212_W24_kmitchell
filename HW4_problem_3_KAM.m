
close all
clear all
clc

%column of t
t=[1,2,3,4,5]';
%design matrix
A=[[t;t;t;t;].^0 [t;t;t;t]] ;

%y vals
y=[3.75; .93; .38; .05; .04; .36; .32; .11; .15; .03; .58; .67; .12; .05; .08;
    2.06; 1.01; .6; .11; .06];


lm=fitlm(A(:,2),log(y));


b=lm.Coefficients.Estimate(2);
mu_exp=lm.Coefficients.Estimate(1);

neu=length(y)-1;

sigma_b=lm.Coefficients.SE(2)*sqrt(neu/(neu-2));
sigma_mu=lm.Coefficients.SE(1)*sqrt(neu/(neu-2));




model_3 =1.*exp(-b.*t);

n=1000;
b_error=b + 1*sigma_b*randn(n,1);

mu = mu_exp;

% mu = exp(mu_exp);
mu_error=mu + 1*sigma_mu*randn(n,1);
error = [];
% error = 
error_std = lm.CoefficientCovariance(1,1)


mu
sigma_mu
b
sigma_b
error

    
    
error_std

figure(6)
plot(lm)
%%
figure(7)
subplot(2,1,1)
boxplot(b_error)
title('distribution of b errors')
subplot(2,1,2)
boxplot(mu_error)
title('distribution of mu errors')

