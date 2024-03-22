clear all
close all
clc

x=(0:4)';
y=[0.0434 1.0343 -0.2588 3.68622 4.3188];

x_2=(0:1)';
y_2=[0.0434 1.0343];

sigma=[0.1 0.1];

p=x.^1;
p_2=x_2.^1;

lm_2=fitlm(p_2,y_2);
lm=fitlm(p,y);

m=lm.Coefficients.Estimate(2);
b=lm.Coefficients.Estimate(1);

m_short=lm_2.Coefficients.Estimate(2);
b_short=lm_2.Coefficients.Estimate(1);

neu=length(x)-2;

sigma_m=lm.Coefficients.SE(2)*sqrt(neu/(neu-2));
sigma_b=lm.Coefficients.SE(1)*sqrt(neu/(neu-2));

sigma_m_2=lm_2.Coefficients.SE(2)*sqrt(neu/(neu-2));
sigma_b_2=lm_2.Coefficients.SE(1)*sqrt(neu/(neu-2));


model_2=m.*x+b;

n=5000;

m_error=m-sigma_m + 2*sigma_m*rand(n,1);
b_error=b-sigma_b + 2*sigma_b*rand(n,1);



figure(4)
errors = [];
for i=1:n
    
    model_error=m_error(i).*x+b_error(i);
    errors(i,:)=model_error;
            if or(model_2(1)<(model_error(1)-.1),or(model_2(1)>(model_error(1)+.1),or(model_2(2)<(model_error(2)-.1),model_2(2)>(model_error(2)+.1))))
                % model_error=[0 0 0 0 0]-10;
                model_error=NaN;
            end

    plot(x,model_error,'b','LineWidth',.2)
    
    hold on
end

plot(x,y,'r-o')
plot(x,model_2,'k','LineWidth',5)
ylim([-.5 5])
hold off

nparam=3;

figure(5)
hist(errors(:,nparam)-model_2(nparam),20)

errorbar_x2=std(errors(:,2)-model_2(2))
errorbar_x3=std(errors(:,3)-model_2(3))
errorbar_x4=std(errors(:,4)-model_2(4))


sigma_m
sigma_b