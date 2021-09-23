% El comando input se obtuvo de https://la.mathworks.com/help/matlab/ref/input.html
% El comando figure se obtuvo de https://la.mathworks.com/help/matlab/ref/figure.html

disp('Inserte el dominio de las funciones:');
limiteInferior = input('Límite inferior:');
limiteSuperior = input('Límite superior:');
escalones = input('Precisión de gráfica:');

dominio = [limiteInferior:escalones:limiteSuperior];

x = funcionX(dominio, 1, 1, 0);
h = funcionX(dominio, 1, 1, 5);
s = funcionX(dominio, 1, 1, -2);

figure('Name', 'Gráfica de h(t) vs s(t) vs x(t)', 'NumberTitle', 'off')
plot(dominio, x)
hold on
plot(dominio, h, 'r')
plot(dominio, s, 'm')