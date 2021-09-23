%Esta función obtiene el dominio deseado (range)
%para regresar el vector (f) con los valores de la función
%x(t)={
%0 t=-2
%3 -2<t<2
%0 t=2
%en fila
%Los argumentos después del dominio indican lo siguiente:
%amplitud, coeficiente del tiempo, y suma de un escalar al tiempo

function [f] = funcionCuadrado (timeDomain, amplitudScale, timeScale, timeDelay)

    f = zeros(1, length(timeDomain));
    timeMod = zeros(1, length(timeDomain));
    
    for i = 1 : length(timeDomain)
        timeMod(i) = timeScale * ( timeDomain(i) + timeDelay);
    end
    
    for i = 1 : length(timeDomain)
        if( timeDomain(i) == timeDomain(1) || timeDomain(i) == timeDomain(length(timeDomain)) )
            f(i) = amplitudScale * (0); %0 t=-2, t=2
        else
            f(i) = amplitudScale * (3); %3 -2<t<2
        end
    end

end