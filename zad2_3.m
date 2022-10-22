%% Splot Całkowy splajny

clear all; close all; clc;

%% ZMIENNE %%
dt = 0.01;
Tmax = 1;
Tmin = -1;

%% OBLICZENIA %%
%b0
tb0 = Tmin : dt : Tmax;
b0 = zeros(size(tb0));
ind_b0 = find(abs(tb0)<1);
b0(ind_b0) = 1;

%b1
tb1 = Tmin*2 : dt : Tmax*2;
b1 = zeros(size(tb1));
for ind_tb1 = 1 : length(tb1)
    for ind_taub0 = 1 : length(tb0)
        if ind_tb1 > ind_taub0 && ind_tb1 - ind_taub0 < length(b0)
            b1(ind_tb1) = b1(ind_tb1) + b0(ind_taub0).*b0(ind_tb1 - ind_taub0).*dt;
        end
    end
end

%b2
tb2 = Tmin*3 : dt : Tmax*3;
b2 = zeros(size(tb2));
for ind_tb2 = 1 : length(tb2)
    for ind_taub1 = 1 : length(tb1)
        if ind_tb2 > ind_taub1 && ind_tb2-ind_taub1 < length(b0)
            b2(ind_tb2) = b2(ind_tb2) + b1(ind_taub1).*b0(ind_tb2-ind_taub1).*dt;
        end
    end
end

%b3
tb3 = Tmin*4 : dt : Tmax*4;
b3 = zeros(size(tb3));
for ind_tb3 = 1 : length(tb3)
    for ind_taub2 = 1 : length(tb2)
        if ind_tb3 > ind_taub2 && ind_tb3-ind_taub2 < length(b0)
            b3(ind_tb3) = b3(ind_tb3) + b2(ind_taub2).*b0(ind_tb3-ind_taub2).*dt;
        end
    end
end

%b4
tb4 = Tmin*5 : dt : Tmax*5;
b4 = zeros(size(tb4));
for ind_tb4 = 1 : length(tb4)
    for ind_taub3 = 1 : length(tb3)
        if ind_tb4 > ind_taub3 && ind_tb4-ind_taub3 < length(b0)
            b4(ind_tb4) = b4(ind_tb4) + b3(ind_taub3).*b0(ind_tb4-ind_taub3).*dt;
        end
    end
end

%% WYKRESY %%

figure(Position=[300 100 900 600])

% --- wykres 1 ---
hold on
box on
grid on
axis tight

plot(tb0, b0, '-y', LineWidth=1.5)
plot(tb1, b1, '-r', LineWidth=1.5)
plot(tb2, b2, '-g', LineWidth=1.5)
plot(tb3, b3, '-b', LineWidth=1.5)
plot(tb4, b4, '-k', LineWidth=1.5)

title("\beta(t)^P = \beta(t)^0 \ast \beta(t)^0 \ast ... \ast \beta(t)^0")
legend('\beta^0', '\beta^1', '\beta^2', '\beta^3', '\beta^4')
xlabel('t(s)')
ylabel('y(t)')

