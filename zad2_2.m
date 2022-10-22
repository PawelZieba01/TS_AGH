clear all; close all; clc;


%%  ZMIENNE  %%
dt = 0.01
T_min = -2
T_max = 2



%%  OBLICZENIA  %%
t = T_min : dt : T_max;   
ty = 2*T_min : dt : 2*T_max;

ind_t = find( abs(t) < 1 );

x = zeros( size(t) );
x(ind_t) = 0.5;

h = zeros( size(t) );
h(ind_t) = t(ind_t) + 1;

y = zeros( size(ty));

for ind_ty = 1:length(ty)
    for ind_tau = 1:length(x)
        if ind_ty-ind_tau > 0 && ind_ty-ind_tau <= length(h)
             y(ind_ty) = y(ind_ty) + x(ind_tau) * h(ind_ty-ind_tau)*dt;
        end
    end
end


%%dokończyć (wzór 2.6)



%%  WYKRESY  %%
grid on
box on
hold on

title("title")
plot(t, x, '.-b');
plot(t, h, '.-r');
plot(ty, y, '.-k');
%axis([-1 1 0 max(y)])