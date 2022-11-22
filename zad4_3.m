%% Filters
%
%
%
clear all; close all; clc;



%% ZMIENNE %%
F = 10000;
fp = 1000;
fs = 1500;
Rp = 1;
Rs = 30;

%% OBLICZENIA %%
w = 0 : 0.01 : 2*pi*F;
t = 0 : 1e-6 : 5e-3;


%Butterworth ---------
[Nb, Wnb] = buttord(2*pi*fp, 2*pi*fs, Rp, Rs, "s");
[Bb,Ab] = butter(Nb, Wnb, "s");

[hb, Tb, tb] = impulse(Bb,Ab, t);

[Hb,Wb] = freqs(Bb,Ab, w);

[Zb,Pb,Kb] = tf2zp(Bb,Ab);
%---------------------


%Chebyshev1 ----------
[Nc1,Wnc1] = cheb1ord(2*pi*fp, 2*pi*fs, Rp, Rs, "s");
[Bc1,Ac1] = cheby1(Nc1, 3 ,Wnc1, "low", "s");

[hc1, Tc1, tc1] = impulse(Bc1, Ac1, t);
[Hc1, Wc1] = freqs(Bc1, Ac1, w);

[Zc1, Pc1, Kc1] = tf2zp(Bc1,Ac1);
%---------------------

%Chebyshev2 ----------
[Nc2, Wnc2] = cheb2ord(2*pi*fp, 2*pi*fs, Rp, Rs, "s");
[Bc2, Ac2] = cheby2(Nc2, Rs, Wnc2, "low", "s");

[hc2, Tc2, tc2] = impulse(Bc2, Ac2, t);
[Hc2, Wc2] = freqs(Bc2, Ac2, w);
[Zc2, Pc2] = tf2zp(Bc2, Ac2);
%----------------------


%Eliptic --------------
[Ne, Wne] = ellipord(2*pi*fp, 2*pi*fs, Rp, Rs, "s");
[Be, Ae] = ellip(Ne, Rp, Rs, Wne, "s");

[he, Te, te] = impulse(Be, Ae, t);
[He, We] = freqs(Be, Ae, w);
[Ze, Pe] = tf2zp(Be, Ae);
%----------------------


%Bessel ---------------
Nbe = 9;
[Bbe, Abe] = besself(Nbe, 4*pi*fp, "low");

[hbe, Tbe, tbe] = impulse(Bbe, Abe, t);
[Hbe, Wbe] = freqs(Bbe, Abe, w);
[Zbe, Pbe] = tf2zp(Bbe, Abe);
%----------------------

%% WYKRESY %%
figure(Position=[150 100 1200 600])

% ------------------ wykres 1 ------------------
subplot(2,2,1)
hold on
box on
grid on
axis tight

plot(tb, hb, '-r', LineWidth=1 )    %Butterworth
plot(tc1, hc1, '-b', LineWidth=1 )  %Chebyshev1
plot(tc2, hc2, '-g', LineWidth=1 )  %Chebyshev2
plot(te, he, '-y', LineWidth=1 )    %Eliptic
plot(tbe, hbe, '-m', LineWidth=1 )    %Bessel

xlabel('t(s)')
ylabel('h(t)')
title("Odpowiedź impulsowa")
legend(['Butterworth N=' num2str(Nb)], ['ChebyshevI N=' num2str(Nc1)], ['ChebyshevII N=' num2str(Nc2)], ['Eliptic N=' num2str(Ne)], ['Bessel N=' num2str(Nbe)])

% ------------------ wykres 2 ------------------
subplot(2,2,2)
hold on
box on
grid on
axis tight

plot(Wb./(2*pi), 20.*log10(abs(Hb)), '-r', LineWidth=1 )
plot(Wc1./(2*pi), 20.*log10(abs(Hc1)), '-b', LineWidth=1)
plot(Wc2./(2*pi), 20.*log10(abs(Hc2)), '-g', LineWidth=1)
plot(We./(2*pi), 20.*log10(abs(He)), '-y', LineWidth=1)
plot(Wbe./(2*pi), 20.*log10(abs(Hbe)), '-m', LineWidth=1)

xlabel('f(Hz)')
ylabel('H(t)')
title("Charakterystyka częstotliwościowa")
legend(['Butterworth N=' num2str(Nb)], ['ChebyshevI N=' num2str(Nc1)], ['ChebyshevII N=' num2str(Nc2)], ['Eliptic N=' num2str(Ne)], ['Bessel N=' num2str(Nbe)])


% ------------------ wykres 3 ------------------
subplot(2,2,3)
hold on
box on
grid on
axis tight

plot(Wb, unwrap(angle(Hb)), '-r', LineWidth=1 )
plot(Wc1, unwrap(angle(Hc1)), '-b', LineWidth=1)
plot(Wc2, unwrap(angle(Hc2)), '-g', LineWidth=1)
plot(We, unwrap(angle(He)), '-y', LineWidth=1)
plot(Wbe, unwrap(angle(Hbe)), '-m', LineWidth=1)

xlabel('\Omega(rad/s)')
ylabel('angle(rad)')
title("Charakterystyka fazowa")
legend(['Butterworth N=' num2str(Nb)], ['ChebyshevI N=' num2str(Nc1)], ['ChebyshevII N=' num2str(Nc2)], ['Eliptic N=' num2str(Ne)], ['Bessel N=' num2str(Nbe)])

% ------------------ wykres 1' ------------------
figure(Position=[150 100 1200 600])

subplot(2,3,1)
hold on
box on
grid on
axis tight

plot(real(Zb), imag(Zb), 'or')
plot(real(Pb), imag(Pb), 'xb')

xlabel('Re')
ylabel('Im')
title("Butterworth")

% ------------------ wykres 2' ------------------
subplot(2,3,2)
hold on
box on
grid on
axis tight

plot(real(Zc1), imag(Zc1), 'or')
plot(real(Pc1), imag(Pc1), 'xb')

xlabel('Re')
ylabel('Im')
title("Chebyshev1")


% ------------------ wykres 3' ------------------
subplot(2,3,3)
hold on
box on
grid on
axis tight

plot(real(Zc2), imag(Zc2), 'or')
plot(real(Pc2), imag(Pc2), 'xb')

xlabel('Re')
ylabel('Im')
title("Chebyshev2")


% ------------------ wykres 4' ------------------
subplot(2,3,4)
hold on
box on
grid on
axis tight

plot(real(Ze), imag(Ze), 'or')
plot(real(Pe), imag(Pe), 'xb')

xlabel('Re')
ylabel('Im')
title("Eliptic")


% ------------------ wykres 5' ------------------
subplot(2,3,5)
hold on
box on
grid on
axis tight

plot(real(Zbe), imag(Zbe), 'or')
plot(real(Pbe), imag(Pbe), 'xb')

xlabel('Re')
ylabel('Im')
title("Bessel")



