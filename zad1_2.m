clear all; close all; clc;

%% ZMIENNE %%
dt = 1e-2;
Tmax = 10;
Tmin = 0;

om0 = 1;        %rad/s
%% OBLICZENIA %%
t = Tmin : dt : Tmax;

x = exp(1i*om0*t);
%% WYKRESY %%

figure
hold on
grid on
box on
axis tight

plot(t, real(x))
plot(t, imag(x))

title('\Omega_0=1(rad/s)')
xlabel('t(s)')
ylabel('x(t)')
legend('Real', 'Imag', 'Location','best')
