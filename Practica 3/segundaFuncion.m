clear all, close all, clc
figure('Name', 'Segunda Función', 'NumberTitle', 'off')

%Domain
T = 8/1000;
N = 2^10;
dt = T/(N-1);
t = 0:dt:T;

%Function
f = 0*t;
f(1:N/8) = 1*8*(1:N/8)/N;
f(N/8:3*N/8) = 1;
f(3*N/8:5*N/8) = 1+-1*8*(0:2*N/8)/N;
f(5*N/8:7*N/8) = -1;
f(7*N/8:N) = -1+1*8*(0:N/8)/N;
plot(t, f, '-k', 'LineWidth', 3.5), hold on

%Fourier Series
CC = jet(30);
A0 = 1/T*sum(f.*ones(size(t)))*dt;
fFS = A0;
armonics = input("k: ");
for k=1:armonics
    A(k) = 2/T*sum(f.*cos(2*pi*k*t/T))*dt;
    B(k) = 2/T*sum(f.*sin(2*pi*k*t/T))*dt;
    fFS = fFS + A(k)*cos(2*pi*k*t/T) + B(k)*sin(2*pi*k*t/T);
    plot(t, fFS, '-', 'Color', CC(k,:), 'LineWidth', 2)
    pause(.3)
end

correlationCoeficient = 100.*corrcoef(f, fFS);
fprintf("%.3f\n", correlationCoeficient(1,2));