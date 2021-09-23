% Esta función, dada la ventana o envolvente a usar, y la nota en función
% senoidal, regresa una nota como función, la cual está modificada para
% simular los sobretonos, características de ataque, sostenimiento y
% liberación.
% Las envolventes disponibles son:
% 0 para instrumentos de viento de madera,
% 1 para instrumentos de cuerda y teclado
function [x] = sintetizarFuncion(ventana, funcion)
    N = length(funcion);
    %mb(1) = m, mb(2) = b de y = mx + b

    if(ventana == 0)
        %Generación de Ventana para instrumentos de viento de madera.
        at1 = zeros(1, N);
        mb = [5/N, 0];
        at1(1:N/5) = mb(1) * (1:N/5) + mb(2);
        at1(N/5:4*N/5) = 1;
        mb = [-1*5/N, 5];
        at1(4*N/5:N) = mb(1) * (4*N/5:N) + mb(2);
        
        x = at1 .* funcion;
        %x(t) = a(t) .* cos(2*pi*tono-90º)
    end

    if(ventana == 1)
        %Generación de Ventana para instrumentos de cuerda y teclado.
        at2 = zeros(1, N);
        mb = [10/N, 0];
        at2(1:N/10) = mb(1) * (1:N/10) + mb(2);
        mb = [-1*5/N, 3/2];
        at2(N/10:2*N/10) = mb(1) * (N/10:2*N/10) + mb(2);
        mb = [-1 * 5/(8*N), 25/40];
        at2(2*N/10:N) = mb(1) * (2*N/10:N) + mb(2);
        
        x = at2 .* funcion;
        %x(t) = a(t) .* cos(2*pi*tono-90º)
    end
end