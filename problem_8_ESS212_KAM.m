clear all
%problem 8





%when does wille-E reach the bottom of the canyon at z = 0
%what went wrong?
%does the scheme satisfy the law of conservation of energy?
%dt = 1 second
dt = 1;
n = 1:20000;
z_n(1) = 100;
% v = sqrt(2*g*(z - z_0));
% z_n = [];
g = 9.8;
for i = 2:length(n)
     % z_n(i+1) =
   z_n(i) =  z_n(i-1) + sqrt(2*g*(z_n(i-1) - z_n(1))) ;

end

z_n(end)
%he never reaches the ground!


%part b:
%see written notes for Problem 8 for how I found dz/dt and dv/dt

%dz/dt = v;
%dv/dt = -g
z_n2 = 100;
v = 0;

%z(0) = 100, v(0) = 0
for i = 2:length(n)
    v(i) = v(i-1) - dt*g;
    % v = sqrt(2*g*(z_n2(i) - z_n2(1)));
    z_n2(i) = z_n(i-1) + dt*v(i-1);
end

% figure(2)
% plot(n,z_n2);
%mass of coyote in kilograms
m = 60;
%potential energy
p_e = m*g*z_n2(1);
for i = 2:length(n)
    p_e(i) = m*g*(z_n2(i));
end

k_e = 0;
for i = 2:length(n)
    k_e(i) = 0.5*m*(v(i)^2);
end

%total energy
t_e = k_e + p_e;


no_p_e = find(p_e<0);
p_e(no_p_e) = [];
%make separate time variable for p_e
t_p = n;
t_p(no_p_e) = [];
figure(1)
plot(t_p,p_e)
hold on
plot(n,k_e)
plot(n,t_e)
hold off
legend('potential energy','kinetic energy','total energy')
xlim([0 50])
% ylim([0 10000000])
% figure(4)
% plot(t_p,p_e)

v_LF = 0;
z_n_LF = 0;
%leap frog scheme
%part c

for i = 2:length(n)
    v_LF(i) = v_LF(i-1) + 2*g;
    % v = sqrt(2*g*(z_n2(i) - z_n2(1)));
    % z_n_LF(i) = z_n_LF(i-1) + 2*v_LF(i);
end

z_n_LF2 = 0;

for i = 2:2:length(n)
    for j = 2:length(n)/2
    z_n_LF2(j) = z_n_LF2(j-1) + 2*v_LF(i);
    end
end




%potential energy
p_e_LF = m*g*z_n_LF2(1);
for i = 2:length(n)/2
    p_e_LF(i) = m*g*(z_n_LF2(i));
end

k_e_LF = 0;
for i = 2:length(n)/2
    k_e_LF(i) = 0.5*m*(v_LF(i)^2);
end

t_e_LF = k_e_LF + p_e_LF;

no_p_e_LF = find(p_e_LF<0);
p_e_LF(no_p_e_LF) = [];
%make separate time variable for p_e_LF
t_p_LF = 2:2:length(n);
%make new time variable for kinetic and potential
knt_p_LF = 2:2:length(n);

t_p_LF(no_p_e_LF) = [];
figure(2)
plot(t_p_LF,p_e_LF)
hold on
plot(knt_p_LF,k_e_LF)
plot(knt_p_LF,t_e_LF)
hold off
legend('potential energy','kinetic energy','total energy')

