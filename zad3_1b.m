%% Fourier
%
%Przekombinowałem i nie jestem teraz w stanie wygenerować wykresu błędu :(
%
clear all; close all; clc;

%% ZMIENNE %%
Tmax = 2;
Tmin = -2;
dt = 0.001;

period = 1;
n = 10;

%% OBLICZENIA %%
t = Tmin : dt : Tmax;
t_periodic = mod(t,period);

x1 = 1./t_periodic;
x2 = sin(2.*pi./t_periodic);

%% WYKRESY %%
figure(Position=[300 100 900 600])
tiledlayout(3,1)

% --- wykres 1 ---
nexttile
hold on
box on
grid on
axis tight

plot(t, x1, '-b', LineWidth=1 )

xlabel('t(s)')
ylabel('x(t)')

axis([Tmin Tmax 0 10])


% --- wykres 2 ---
nexttile
hold on
box on
grid on
axis tight

plot(t, x2, '-b', LineWidth=1 )

xlabel('t(s)')
ylabel('x(t)')


% % --- wykres 3 ---
% nexttile
% hold on
% box on
% grid on
% axis tight
% 
% plot(t, x3, '-b', LineWidth=1 )
% 
% xlabel('t(s)')
% ylabel('x(t)')

