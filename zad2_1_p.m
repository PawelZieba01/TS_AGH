%% Obliczanie całki metodami numeryczynmi (prostokąty i trapezy)
% wykresy nie są perfekcyjne bo przybliżenie opiera się na tym samym odcinku
% czasu dt, więc krzywe na drugim wykresie pokrywają się idealnie

clear all; close all; clc;

%% ZMIENNE %%
dt = 0.1;
Tmax = 1;
Tmin = -1;

I_real = 10/3;


%% OBLICZENIA %%
t = Tmin : dt : Tmax;

x = -t.^2 + t/2 + 2;

%przybliżenie prostokątami
I_rect = sum(x.*dt, "all");
I_diff_rect = I_rect - I_real;

%przybliżenie trapezami
I_trap = sum((x(1:end-1) + x(2:end)).*dt/2, "all");
I_diff_trap = I_trap - I_real;

%% WYKRESY %%

figure(Position=[300 100 900 600])
tiledlayout(2, 1)

% --- wykres 1 ---
nexttile
hold on
box on
grid on
axis tight

plot(t, x, '-r')
plot(t, x, '.b', MarkerSize=16)

title(['I_d_i_f_f=' num2str(I_diff_rect) '  ,  I_r_e_a_l=' num2str(I_real) ',  I_r_e_c_t=' num2str(I_rect)])
xlabel('t(s)')
ylabel('x(t)')
for i=1 : 1 : length(t)-1
    rectangle("Position",[t(i), 0, dt, x(i)], "EdgeColor",[0, 0, 1])
end

% --- wykres 2 ---
nexttile
hold on
box on
grid on
axis tight

plot(t, x, '-r')
plot(t, x, '.b', MarkerSize=16)

title(['I_d_i_f_f=' num2str(I_diff_trap) '  ,  I_r_e_a_l=' num2str(I_real) ',  I_r_e_c_t=' num2str(I_trap)])
xlabel('t(s)')
ylabel('x(t)')

for i=1 : 1 : length(t)
    line([t(i) t(i)], [0 x(i)], 'Color', 'blue', 'LineStyle', '--')
    if(i ~= length(t))
        line([t(i) t(i+1)], [x(i) x(i+1)], 'Color', 'blue', 'LineStyle', '--')
    end
end
