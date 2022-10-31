%% Fourier
%
%Przekombinowałem i nie jestem teraz w stanie wygenerować wykresu błędu :(
%
clear all; close all; clc;

%% ZMIENNE %%
T0 = 1;
T1 = 0.1;

Tmin = -0.5;
Tmax = 0.5;
dt = 0.0001;
om0 = 2*pi/T0;

K_num = 100;    %ilość elementów w tablicy błędów

%% OBLICZENIA %%
t = Tmin : dt : Tmax;

%symetryczny przebieg prostokątny ---------------------
x = zeros(size(t));
ind_x = find(abs(t) < T1);
x(ind_x) = 1;

k_t = 1 : 1 : K_num;
En = zeros(size(k_t));  %tablica na błędy

for ind_K = 1 : 1 : K_num
    %współczynniki fouriera ---------------------
    k = -ind_K : 1 : ind_K;
    
    % ak = zeros(size(k));
    % for ind_k = 1 : 1 : length(k)
    %     if k(ind_k) ~= 0
    %         ak(ind_k) = sin(k(ind_k)*om0*T1)/(k(ind_k)*pi);
    %     else
    %         ak(ind_k) = 2*T1/T0;
    %     end
    % end
    
    ak = sin(k*om0*T1)./(k*pi);
    ind_zero = find(k==0);
    ak(ind_zero) = 2*T1/T0;
    % ak(K+1) = 2*T1/T0;                %można też tak :)
    
    %aproksymacja sinusem ---------------------
    xn = zeros(size(t));
    for ind_k = 1 : 1 : length(ak)
        xn = xn + ak(ind_k).*exp(1j*k(ind_k)*om0.*t);
    end
    
    %błąd obliczeń ---------------------
    En(ind_K) = sum(abs((x-xn)).^2.*dt);
end


%% WYKRESY %%
figure(Position=[300 100 900 600])

% --- wykres 1 ---
subplot(2,1,1)
hold on
box on
grid on
axis tight

plot(t, x, '-b', LineWidth=1 )
plot(t(), real(xn), '-r', LineWidth=1.5 )
% plot(t, real(xn), '-g', LineWidth=1 )

% text(-0.1, 0.5, ['N=' num2str(K)],'FontSize',14)
% text(-0.1, 0.3, ['E_N=' num2str(en)],'FontSize',14)

title("")
xlabel('t(s)')
ylabel('x(t)')


% --- wykres 2 ---
subplot(2,1,2)
hold on
box on
grid on
axis tight

% stem(k, ak, '.b', 'MarkerSize',10)
stem(k_t, En, '.b', 'MarkerSize',10)  

title("")
xlabel('k')
ylabel('a_k')

