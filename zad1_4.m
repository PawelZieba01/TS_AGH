clear all; close all; clc;

%% ZMIENNE %%
dt = 1e-2;
Tmax = 100;
Tmin = -100;

om0 = 0.5;
phi = 0;
C = 1;
a = -0.01;

%% OBLICZENIA %%
t = Tmin : dt : Tmax;


exponent = C*exp(a*t);
x = exponent.*cos(om0*t + phi);
%% WYKRESY %%

figure
hold on
box on
grid on
axis tight

plot(t, x, '-r')
plot(t, exponent, '-b')

legend('Ce^a^tcos(\Omega_0t+\phi)', 'Ce^a^t')
title(['a = ' num2str(a) ', C = ' num2str(C) ', \Omega_0 = ' num2str(om0) '(rad/s)'])
xlabel('t(s)')
ylabel('x(t)')

