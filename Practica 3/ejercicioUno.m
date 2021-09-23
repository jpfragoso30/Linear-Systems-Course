%Función Par:
period = 0.5 / 1000;
infLimit = -1/4 * period;
supLimit = 3/4 * period;
voltage = 5;
accuracy = 0.0001 / 1000;

timeDomain = [infLimit : accuracy : supLimit];

triangulo = funcionPeriodoTriangulo(timeDomain, voltage, 1, period/4);

k = input("Armónicos función par: ");
fourierTriangulo = fourierFuncion(triangulo, period, k, timeDomain);

figure('Name', 'Fourier función par', 'NumberTitle', 'off')
hold on
plot(timeDomain, fourierTriangulo, "m")
xlabel('t')
ylabel('y(t)')
hold off

%Segunda Función:
period2 = 8/1000;
infLimit2 = 0;
supLimit2 = period2;
accuracy2 = 0.01 / 1000;

timeDomain2 = [infLimit2: accuracy2: supLimit2];

trapecio = funcionPeriodoTrapecio(timeDomain2, 1, 1, 0);

k2 = input("Armónicos segunda función: ");
fourierTrapecio = fourierFuncion(trapecio, period, k2, timeDomain2);

figure('Name', 'Fourier segunda función', 'NumberTitle', 'off')
hold on
plot(timeDomain2, fourierTrapecio, "b")
xlabel('t')
ylabel('y(t)')
hold off