clear all; close all; clc;

%% ZMIENNE %%
dt = 1e-5;
Tmax = 1e-1;
Tmin = 0;

F0 = 50;    %Hz
phi = 50;
A = 1;

%% OBLICZENIA %%
t = Tmin : dt : Tmax;
om0 = 2*pi*F0;

x = A.*cos(om0*t+phi);
x_euler = (A/2)*exp(1i*phi)*exp(1i*om0*t) + (A/2)*exp(-1i*phi)*exp(-1i*om0*t);
%% WYKRESY %%

figure
hold on
box on
grid on
axis tight

plot(t, x, '-r')
plot(t, x_euler, '-b')
plot(t, x_euler-x, '-g')

legend('Acos(\Omega_0t + \phi)', "Euler's relation", 'Difference')
title(['Max difference = ' num2str(max(x_euler-x))])
xlabel('t(s)')
ylabel('x(t)')
annotation('textbox',[.2 .2 .2 .2],'String',['Max difference = ' num2str(max(x_euler-x))],'FitBoxToText','on');

