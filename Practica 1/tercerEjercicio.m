% El comando input se obtuvo de https://la.mathworks.com/help/matlab/ref/input.html
% El comando figure se obtuvo de https://la.mathworks.com/help/matlab/ref/figure.html

%INCISO a)
limiteInferior = -3;
limiteSuperior = 3;
escalones = 0.01;

dominio = [limiteInferior:escalones:limiteSuperior];

x = funcionX(dominio, 1, 1, 0);
xe = funcionX(dominio, 0.5, 1, 0) + funcionX(dominio, 0.5, -1, 0); % Parte Simétrica Par
xo = funcionX(dominio, 0.5, 1, 0) - funcionX(dominio, 0.5, -1, 0); % Parte Simétrica Impar

% Demostrando de forma gráfica:
figure('Name', 'Gráfica de x(t)', 'NumberTitle', 'off')
hold on
plot(dominio, x, 'm')
plot(dominio, xe, 'r:')
plot(dominio, xo, 'b:')
hold off