%Esta función obtiene el dominio deseado (range) para regresar el vector
%(f) con los valores de la función en fila. Los argumentos después del
%dominio indican lo siguiente: amplitud, coeficiente del tiempo, y la suma
%de un escalar al tiempo
%La funcion es periódica y es un trapecio que se invierte en T/2

function [f] = funcionPeriodoTriangulo (timeDomain, amplitudScale, timeScale, timeDelay)

    timeMod = zeros(1, length(timeDomain));
    f = zeros(1, length(timeDomain));
    
    functionPoints = [timeDomain(1), timeDomain(1 + round(length(timeDomain)/4)), timeDomain(1 + round(length(timeDomain)/2)), timeDomain(1 + round(3*length(timeDomain)/4)), timeDomain(length(timeDomain))];
    amplitudScale = amplitudScale/functionPoints(3);
    
    for i = 1 : length(timeDomain)
        if(timeDomain(i) >= functionPoints(1) && timeDomain(i) <= functionPoints(2))
            timeMod(i) = timeScale * ( timeDomain(i) + timeDelay);
            f(i) = amplitudScale * (timeMod(i));
        elseif(timeDomain(i) > functionPoints(2) && timeDomain(i) <= functionPoints(4))
            timeMod(i) = timeScale * ( timeDomain(i) - timeDelay);
            f(i) = amplitudScale * (-1 * timeMod(i));
        elseif(timeDomain(i) > functionPoints(4) && timeDomain(i) <= functionPoints(5))
            timeMod(i) = timeScale * ( timeDomain(i) - timeDelay);
            f(i) = amplitudScale * (timeMod(i) - functionPoints(4));
        else
            f(i) = 0;
        end
    end

end