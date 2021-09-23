%Esta función obtiene 2 funciones para convolucionar (fA, fB)
%a la vez del (accuracy) que es la separación entre puntos por el tiempo
%para regresar el dominio de la función convolucionada (domain) y
%la función convolucionada (fconv)
%El offset permite que la función esté centrada en el orígen y
%los valores del dominio y los valores funcionales están a escala
%de las funciones (fA) y (fB)

function [domain, fConv] = convolucionOrigen(fA, fB, accuracy)

    fConv = conv(fA, fB);
    fConv = fConv.*accuracy;
    offset = -accuracy * (length(fConv)-1)/2;
    domain = offset + ([0:length(fConv)-1]).*accuracy;

end