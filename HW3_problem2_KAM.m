warning off
clear
close all
clc
%read datafile from internet

filename = websave("GLODAPv2.2022_Arctic_Ocean.csv","https://www.ncei.noaa.gov/data/oceans/ncei/ocads/data/0257247/GLODAPv2.2022_Arctic_Ocean.csv");

glodap_data = readtable("GLODAPv2.2022_Arctic_Ocean.csv");

salinity =table2array(glodap_data(:,20));
year =table2array(glodap_data(:,6));
month =table2array(glodap_data(:,7));
day =table2array(glodap_data(:,8));
hour =table2array(glodap_data(:,9));
minute =table2array(glodap_data(:,10));
%%
year = year * 60 *24*12*365;
month = month* 60 * 24*12;
day = day * 60*24;
hour = hour * 60;
dy = year+month+day+hour+minute;
%lots of data, lets look at the last cruise only (cruise 4056)
%starts at 154723
cruise_idx = [154723:length(year)];
salinity = salinity(cruise_idx);
dy = dy(cruise_idx);


%column 20 salinity column 6 year

%project data on trend model of form
%d_i + mu + (t_i - t_bar)m
%t_bar midpoint of time series

%take out bad vals (fill value -9999)
dy(salinity<-9000) = [];
salinity(salinity<-9000) = [];

dy = dy - dy(1);
%t_bar (mean of timeseries)
t_bar = mean(dy,'omitnan');
t_normalized = dy - t_bar;
t = [t_normalized,ones(length(t_normalized),1)];


%output estimated mu and m and std dev components of e vector

b1 = t\salinity;

b = b1'\salinity';

% timespan = linspace(min(dy),max(dy),length(dy));

modelfit=b1(2)+b1(1)*t_normalized;

residuals =salinity - modelfit;

Rsq = 1 - sum((salinity - modelfit).^2)/sum((salinity - mean(salinity)).^2);

%%
%plot data and plot trend model
figure(1)
scatter(dy, salinity,'filled','o')
hold on
plot(dy, modelfit, 'LineWidth',3,'DisplayName','Projection')
ylabel('salinity (PSU)')
xlabel('time (minutes since start of cruise, October 6 4:44 am 2019)')
title('Glodap Arctic Ocean Cruise Salinity and Linear Fit')

% legend('Location','northwest')
axis tight

disp(strcat("m = ", num2str(b(2))))
disp(strcat("mu = ", num2str(b(1))))
disp(strcat("R^2 = ", num2str(Rsq)))
disp(strcat("Std deviation of residuals : ", num2str(std(residuals))))

hold off

