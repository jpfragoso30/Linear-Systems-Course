% El comando input se obtuvo de https://la.mathworks.com/help/matlab/ref/input.html
% El comando figure se obtuvo de https://la.mathworks.com/help/matlab/ref/figure.html

%INCISO a)
limiteInferior = -3;
limiteSuperior = 3;
escalones = 0.01;

dominio = [limiteInferior:escalones:limiteSuperior];

x = funcionX(dominio, 1, 1, 0);

figure('Name', 'Gráfica de x(t)', 'NumberTitle', 'off')
plot(dominio, x)

%INCISO b)
disp('Inserte los valores de la funcion senoidal:');
amplitud = input('Amplitud:');
frecuencia = input('Frecuencia:');
    
y = amplitud*sin(2*pi*frecuencia*dominio);

figure('Name', 'Gráfica de sen(wt)', 'NumberTitle', 'off')
plot(dominio, y)