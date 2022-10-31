%% Fourier Integral
%
%
%
clear all; close all; clc;

%% ZMIENNE %%
Tmax = 2;
Tmin = -2;
dt = 0.002;

om0 = 50;
omm = 15;
A = 1;
phi = 0;
kAM = 0.5;

Om = 100;

%% OBLICZENIA %%
t = Tmin : dt : Tmax;

%przygotowanie funkcji x1, x2, x3
x_ind = find(abs(t) < 1);
x1 = zeros(size(t));
x1(x_ind) = 1;

x2 = zeros(size(t));
x2(x_ind) = A*cos(om0*t(x_ind)+phi);

x3 = zeros(size(t));
x3(x_ind) = ((1 + kAM * cos(omm.*t(x_ind))).*cos(om0.*t(x_ind)+phi));


dOm = 0.1;
OmX = -Om : dOm : Om;
X1 = zeros( size( OmX ) );
X2 = zeros( size( OmX ) );
X3 = zeros( size( OmX ) );

%transformacja Fouriera
for OmX_ind = 1 : 1 : length(OmX)
    X1(OmX_ind) = abs( sum( x1.*exp( -1j*OmX( OmX_ind ).*t ).*dt ) );
    X2(OmX_ind) = abs( sum( x2.*exp( -1j*OmX( OmX_ind ).*t ).*dt ) );
    X3(OmX_ind) = abs( sum( x3.*exp( -1j*OmX( OmX_ind ).*t ).*dt ) );
end

%% WYKRESY %%
figure(Position=[150 100 1200 600])

% ------------------ wykres 1 ------------------
subplot(2,3,1)
hold on
box on
grid on
axis tight

plot(t, x1, '-r', LineWidth=1 )

xlabel('t(s)')
ylabel('x(t)')

% ------------------ wykres 1' ------------------
subplot(2,3,4)
hold on
box on
grid on
axis tight

plot(OmX, real(X1), '-b', LineWidth=1 )

xlabel('\Omega (rad/s)')
ylabel('X(|\Omega|)')



% ------------------ wykres 2 ------------------
subplot(2,3,2)
hold on
box on
grid on
axis tight

plot(t, x2, '-r', LineWidth=1 )

xlabel('t(s)')
ylabel('x(t)')

% ------------------ wykres 2' ------------------
subplot(2,3,5)
hold on
box on
grid on
axis tight

plot(OmX, real(X2), '-b', LineWidth=1 )

xlabel('\Omega (rad/s)')
ylabel('X(|\Omega|)')



% ------------------ wykres 3 ------------------
subplot(2,3,3)
hold on
box on
grid on
axis tight

plot(t, x3, '-r', LineWidth=1 )

xlabel('t(s)')
ylabel('x(t)')

% ------------------ wykres 3' ------------------
subplot(2,3,6)
hold on
box on
grid on
axis tight

plot(OmX, real(X3), '-b', LineWidth=1 )

xlabel('\Omega (rad/s)')
ylabel('X(|\Omega|)')
