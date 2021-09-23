clear all, close all, clc
figure('Name', 'Función Par', 'NumberTitle', 'off')

%Domain
T = .5/1000;
N = 2^10;
dt = T/(N-1);
t = -T/4:dt:3*T/4;

%Function
f = 0*t;
f(1:N/4) = 5*4*(1:N/4)/N;
f(N/4:3*N/4) = 5-5*4*(0:N/2)/N;
f(3*N/4:N) = -5+5*4*(0:N/4)/N;
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