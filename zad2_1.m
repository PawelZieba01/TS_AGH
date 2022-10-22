clear all; close all; clc;


%%  ZMIENNE  %%
I = 10/3;                   %rzeczywista wartość funkcji

dt = 0.05;                  %krok dziedziny
t = -1 : dt : 1;            %dziedzina
y = -t.^2 + t./2 + 2;       %funkcja

n = dt;                     %szerokość prostokąta

%%  OBLICZENIA  %%
I_p = sum(y(1:end-1).*n, "all")                     %suma metody prostokątów
e_p = I_p - I                                       %błąd obliczeń metody prostokątów

I_t = sum((y(1:end-1) + y(2:end))*dt/2, "all")      %suma metody trapezów
e_t = I_t - I                                       %błąd obliczeń metody trapezów

%%  WYKRESY  %%
grid on
box on
hold on

title(['e_p = ' num2str(e_p) ', e_t = ' num2str(e_t)])
plot(t, y, '.-b');
axis([-1 1 0 max(y)])
