%% Splot Całkowy

clear all; close all; clc;

%% ZMIENNE %%
dt = 0.001;
Tmax = 2;
Tmin = -2;


%% OBLICZENIA %%
t = Tmin : dt : Tmax;
ind_t = find(abs(t) < 1);

ty = Tmin*2 : dt : Tmax*2;

x = zeros(size(t));
x(ind_t) = 0.5;

h = zeros(size(t));
h(ind_t) = t(ind_t)+1;

y = zeros(size(ty));

for ind_ty = 1 : length(ty)
    for ind_tau = 1 : length(t)
        if ind_ty > ind_tau && ind_ty - ind_tau <= length(h)
            y(ind_ty) = y(ind_ty) + x(ind_tau).*h(ind_ty - ind_tau).*dt;
        end
    end
end

%przygotowanie rzeczywistego wykresu splotu
y_real = zeros(size(ty));

ind_y_real = find(ty>-2 & ty<0);
y_real(ind_y_real) = ((ty(ind_y_real)+2).^2)/4;

ind_y_real = find(ty>=0 & ty<2);
y_real(ind_y_real) = 1-(ty(ind_y_real).^2)/4;

ind_y_real = find(abs(ty) > 2);
y_real(ind_y_real) = 0;


error = y - y_real;

%% WYKRESY %%

figure(Position=[300 100 900 600])
tiledlayout(4, 1)

% --- wykres 1 ---
nexttile
hold on
box on
grid on
axis tight

plot(t, x, '-b', LineWidth=1)

title("x(t)")
xlabel('t(s)')
ylabel('x(t)')

% --- wykres 2 ---
nexttile
hold on
box on
grid on
axis tight

plot(t, h, '-r', LineWidth=1)

title("h(t)")
xlabel('t(s)')
ylabel('h(t)')


% --- wykres 3 ---
nexttile
hold on
box on
grid on
axis tight

plot(ty, y, '-k', LineWidth=1)

title("y(t) = x(t)\asth(t)")
xlabel('t(s)')
ylabel('y(t)')


% --- wykres 4 ---
nexttile
hold on
box on
grid on
axis tight

plot(ty, y_real, '-r')
plot(ty, error, '-g', LineWidth=1)
title(['Real convolution integral' '   Max error=' num2str(min(error))])
legend('Real value', 'Error')
xlabel('t(s)')


