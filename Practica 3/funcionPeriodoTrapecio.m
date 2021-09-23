%Esta función obtiene el dominio deseado (range) para regresar el vector
%(f) con los valores de la función en fila. Los argumentos después del
%dominio indican lo siguiente: amplitud, coeficiente del tiempo, y la suma
%de un escalar al tiempo
%La funcion es periódica y es un triangulo que se invierte en T/2

function [f] = funcionPeriodoTrapecio (timeDomain, amplitudScale, timeScale, timeDelay)

    timeMod = zeros(1, length(timeDomain));
    f = zeros(1, length(timeDomain));
    
    functionPoints = [timeDomain(1), timeDomain(1 + round(length(timeDomain)/8)), timeDomain(1 + round(2*length(timeDomain)/8)), timeDomain(1 + round(3*length(timeDomain)/8)), timeDomain(1 + round(length(timeDomain)/2)), timeDomain(1 + round(5*length(timeDomain)/8)), timeDomain(1 + round(6*length(timeDomain)/8)), timeDomain(1 + round(7*length(timeDomain)/8)), timeDomain(length(timeDomain))];
    amplitudScale = amplitudScale * (1000);
    
    for i = 1 : length(timeDomain)
        timeMod(i) = timeScale * ( timeDomain(i) + timeDelay);
        if(timeDomain(i) >= functionPoints(1) && timeDomain(i) <= functionPoints(2))
            f(i) = amplitudScale * (timeMod(i));
        elseif(timeDomain(i) > functionPoints(2) && timeDomain(i) <= functionPoints(4))
            f(i) = 1;
        elseif(timeDomain(i) > functionPoints(4) && timeDomain(i) <= functionPoints(6))
            f(i) = amplitudScale * (-1 * timeMod(i) + functionPoints(5));
        elseif(timeDomain(i) > functionPoints(6) && timeDomain(i) <= functionPoints(8))
            f(i) = -1;
        elseif(timeDomain(i) > functionPoints(8) && timeDomain(i) <= functionPoints(9))
            f(i) = amplitudScale * (timeMod(i) - functionPoints(9));
        else
            f(i) = 0;
        end
    end

end