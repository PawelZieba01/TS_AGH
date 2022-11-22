
clear all; close all; clc;

Iref = 100e-6;
WL = 10;
Vt = 0.7;
kn = 200e-6;
lambda = 0.05;
deltaU = 1;

Ugs = 0 : 0.0001 : 3;

Id1 = 0.5*kn*WL*(Ugs-Vt).*(1+lambda*Ugs);
Id2 = 0.5*kn*WL*(Ugs-Vt).*(1+lambda*(Ugs+deltaU));
error = Id2-Id1;
figure
hold on
axis tight
box on
grid on



plot(Ugs, Id1, "-r")
plot(Ugs, Id2, "-b")
plot(Ugs, error, "-k")
legend("\lambda = 0", "\lambda = 0,05")