%Esta función recibe la función original a la cual se le generará la serie
%de fourier, su periodo, la cantidad de armónicos, y el dominio de la
%función.
%A cambio, regresa la serie de fourier.
function [serie] = fourierFuncion (f, period, armonics, domain)
    serie = 0;
    
    %Forma geométrica
    f0 = 1/period;
    a0Int = trapz(f);
    a0 = (1/period) * a0Int;
    
    for i = 1 : armonics
        akInt = trapz(f.*cos(2*pi*armonics*f0*domain));
        ak = (2/period) * akInt;
        bkInt = trapz(f.*sin(2*pi*armonics*f0*domain));
        bk = (2/period) * bkInt;
        serie = serie + ak*cos(2*pi*armonics*f0*domain) + bk*sin(2*pi*armonics*f0*domain);
    end
    
    serie = serie + a0;
    %
end