infLimit = -2;
supLimit = 2;
accuracy = 0.0001;

timeDomain = [infLimit : accuracy : supLimit];

fTriangulo = funcionTriangulo(timeDomain, 1, 1, 0);
fCuadrado = funcionCuadrado(timeDomain, 1, 1, 0);
figure('Name', 'Gráfica de funciones x(t) y h(t)', 'NumberTitle', 'off')
hold on
plot(timeDomain, fTriangulo, "r")
plot(timeDomain, fCuadrado, "b")
xlabel('t')
ylabel('y(t)')
hold off

[convDomain, fConvolucion] = convolucionOrigen(fTriangulo, fCuadrado, accuracy);
figure('Name', 'Gráfica de x(t) * h(t)', 'NumberTitle', 'off')
plot(convDomain, fConvolucion)
xlabel('t')
ylabel('y(t)')