%% Fourier
%
%Przekombinowałem i nie jestem teraz w stanie wygenerować wykresu błędu :(
%
clear all; close all; clc;

%% ZMIENNE %%
T0 = 1;
T1 = 0.25;

Tmin = -1.5;
Tmax = 1.5;
dt = 0.01;
om0 = 2*pi;


N = 5;
Kmin = -N;
Kmax = N;



%% OBLICZENIA %%
t = Tmin : dt : Tmax;

%symetryczny przebieg prostokątny
x = zeros(size(t));
ind_t = find(t > -T1-T0  &  t < T1-T0);
x(ind_t) = 1;
ind_t = find(t > -T1  &  t < T1);
x(ind_t) = 1;
ind_t = find(t > -T1+T0  &  t < T1+T0);
x(ind_t) = 1;

%zaznaczenie jednego okresu
ind_x = find(t > -T0/2  &  t < T0/2);
x_once = x(ind_x);


%współczynniki Fouriera
k = Kmin : 1 : Kmax;
ak = zeros(size(k));
for ind_k = 1 : 1 : length(k)
    if k(ind_k) ~= 0
        ak(ind_k) = sin(om0.*T1.*k(ind_k))./(k(ind_k).*pi);
    else
        ak(ind_k) = 2*T1/T0;
    end
end

%aproksymacja sinusoidami
xn = zeros(size(t));
for ind_t = 1 : 1 : length(t)
    for ind_k = 1 : 1 : length(k)
        xn(ind_t) = xn(ind_t) + ak(ind_k).*exp(1j.*k(ind_k).*om0.*t(ind_t));
    end
end

%błąd aproksymacji
square_error_fun = abs(x-xn).^2;
En = sum(square_error_fun.*dt);


%% WYKRESY %%
figure(Position=[300 100 900 600])
tiledlayout(2,1)

% --- wykres 1 ---
nexttile
hold on
box on
grid on
axis tight

plot(t, x, '-b', LineWidth=1 )
plot(t(ind_x), x_once, '-r', LineWidth=1.5 )
plot(t, real(xn), '-g', LineWidth=1 )

text(-0.5, 0.5, ['N=' num2str(N)],'FontSize',14)
text(-0.5, 0.3, ['E_N=' num2str(En)],'FontSize',14)

title("")
xlabel('t(s)')
ylabel('x(t)')


% --- wykres 2 ---
nexttile
hold on
box on
grid on
axis tight

stem(k, ak, '.b', 'MarkerSize',10)

title("")
xlabel('k')
ylabel('a_k')

