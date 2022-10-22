clear all; close all; clc;

%% ZMIENNE %%
dt = 1e-4;
Tmax = 10;
Tmin = 0;

kfm = 5;
kam = 0.5;
om_m = 1;
om_0 = 10;
phi = 0;

%% OBLICZENIA %%
t = Tmin : dt : Tmax;

%modulacja AM
mod_signal_am = (1+kam.*cos(om_m.*t));
x_am = mod_signal_am.*cos(om_0.*t + phi);

%modulacja FM
x_fm = cos(om_0.*t + kfm*cos(om_m*t));
om_inst = om_0 - (kfm/om_m).*sin(om_m*t);

%% WYKRESY %%
tiledlayout(2, 1)

% --- wykres modulacji AM ---
nexttile
hold on
box on
grid on
axis tight

%nośna
plot(t, x_am, '-r')

%sygnał modulujący
plot(t, mod_signal_am, '-b')

legend('Carrier signal', 'Modulating signal')

title(['AM   \Omega_0=' num2str(om_0) ' (rad/s),  \Omega_m=' num2str(om_m) ' (rad/s),  k_A_M=' num2str(kam)])
xlabel('t(s)')
ylabel('x(t)')



% --- wykres modulacji FM ---
nexttile
hold on
box on
grid on
axis tight

%nośna
yyaxis left
plot(t, x_fm, '-b')
ylabel('x(t)')

%sygnał modulujący
yyaxis right
plot(t, om_inst, '-r')
ylabel('\Omega_i_n_s_t(rad/s)')

xlabel('t(s)')
legend('Carrier signal', 'Modulating signal')
title(['FM   \Omega_0=' num2str(om_0) ' (rad/s),  \Omega_m=' num2str(om_m) ' (rad/s),  k_A_M=' num2str(kam)])




