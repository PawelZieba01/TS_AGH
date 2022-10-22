clear all; close all; clc;

%% zmienne %%
dt = 10e-2;
Tmax = 100;
Tmin = -100;

C_1 = 1e4;  C_2 = 1;    C_3 = 1e4;    C_4 = 1;
a_1 = 0.01; a_2 = 0.1;  a_3 = -0.01;  a_4 = -0.1;




%% obliczenia %%
t = Tmin : dt : Tmax;

x_1 = C_1.*exp(a_1*t);
x_2 = C_2.*exp(a_2*t);
x_3 = C_3.*exp(a_3*t);
x_4 = C_4.*exp(a_4*t);

%% wykresy %%
figure
tiledlayout(1, 2); 

% --- wykres 1 ---
nexttile
hold on
grid on
plot(t, x_1, '-b')
plot(t, x_2, '-g')

xlabel('t')
ylabel('x(t)')
title('x(t) = Ce^a^t')
legend(['a = ' num2str(a_1) ',   C = ' num2str(C_1)], ['a = ' num2str(a_2) ',   C = ' num2str(C_2)])

% --- wykres 2 ---
nexttile
hold on
grid on
plot(t, x_3, '-b')
plot(t, x_4, '-g')

xlabel('t')
ylabel('x(t)')
title('x(t) = Ce^a^t')
legend(['a = -' num2str(a_1) ',   C = ' num2str(C_1)], ['a = -1' num2str(a_2) ',   C = ' num2str(C_2)])

