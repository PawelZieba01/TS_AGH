%% Notch Filter
%
%
%
clear all; close all; clc;



%% ZMIENNE %%
F = 50;

a = 0;
b = 2*pi*F;
c = 5;

z = [-a-1j*b ; -a+1j*b];
p = [-c-1j*b ; -c+1j*b];




%% OBLICZENIA %%
t1 = 0 : 0.001 : 0.5;
[B,A] = zp2tf(z,p,1);
[h,T,t] = impulse(B,A,t1);

f = 0 : 0.001 : 100;
w = 2*pi.*f;

[H,W] = freqs(B,A,w);
H_lab = freqs_lab(B,A,w);

err_H = sum(abs(H_lab-H));



%% WYKRESY %%
figure(Position=[150 100 1200 600])

% ------------------ wykres 1 ------------------
subplot(2,2,1)
hold on
box on
grid on
axis tight

plot(t, h, '-r', LineWidth=1 )

xlabel('t(s)')
ylabel('h(t)')
title("Odpowiedź impulsowa")

% ------------------ wykres 2 ------------------
subplot(2,2,2)
hold on
box on
grid on
axis tight

plot(f, abs(real(H)), '-r', LineWidth=1 )
plot(f, real(H_lab), '-b', LineWidth=1 )

%title(["Err =" num2str(err_H)]);

xlabel('f(Hz)')
ylabel('|H(f)|')
title("Odpowiedź częstotliwościowa")

% ------------------ wykres 3 ------------------
subplot(2,2,3)
hold on
box on
grid on
axis([-15 1 -100 100])

plot(real(z), imag(z)./(2*pi), 'ro');
plot(real(p), imag(p)./(2*pi), 'bx');


xlabel('Re')
ylabel('Im')

% ------------------ wykres 4 ------------------
subplot(2,2,4)
hold on
box on
grid on
axis tight


plot(f, real(H_lab), '-b', LineWidth=1 )

title(["Err =" num2str(err_H)]);

xlabel('f(Hz)')
ylabel('|H(f)|')

