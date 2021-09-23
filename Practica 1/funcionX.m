%Esta función obtiene el dominio deseado
%para regresar el vector x con los valores de la función
%x(t)=5*t^2+2t en fila
%Los argumentos después del dominio indican lo siguiente:
%amplitud, coeficiente del tiempo, y suma de un número al tiempo
function [x] = funcionX(dom, amplitud, tiempo, alfa)

    x = zeros(1,length(dom));
    domRecorrido = zeros(1, length(dom));
    
    for i = 1:length(dom)
            domRecorrido(i) = tiempo*(dom(i)+alfa);
    end

    for i = 1:length(domRecorrido)
        x(i) = amplitud*( 5*( domRecorrido(i)^2 ) + 2*domRecorrido(i) ); % dom(i) representa a t
        %Función original: x(i) = 5*(dom(i)^2)+2*dom(i); x(t)=5t^2+2t
    end
        
end