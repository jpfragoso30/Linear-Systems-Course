%Esta función obtiene el dominio deseado (range)
%para regresar el vector (f) con los valores de la función
%x(t)={
%2t+4 -2<=t<=0
%-2t+4 0<=t<=2
%en fila
%Los argumentos después del dominio indican lo siguiente:
%amplitud, coeficiente del tiempo, y suma de un escalar al tiempo

function [f] = funcionTriangulo (timeDomain, amplitudScale, timeScale, timeDelay)

    f = zeros(1, length(timeDomain));
    timeMod = zeros(1, length(timeDomain));
    
    for i = 1 : length(timeDomain)
        timeMod(i) = timeScale * ( timeDomain(i) + timeDelay);
    end
    
    for i = 1 : length(timeDomain)
        if( timeDomain(i) <= 0 )
            f(i) = amplitudScale * (2 * timeMod(i) + 4); %2t+4 -2<=t<=0
        else
            f(i) = amplitudScale * (-2 * timeMod(i) + 4); %-2t+4 0<=t<=2
        end
    end

end