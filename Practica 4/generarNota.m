% Esta funcion dada una nota (texto), el sobretono, la frecuencia fundamental,
% y la duración de la nota, se genera una función senoidal para simular el
% sonido de la nota.
function [x] = generarNota(nota, sobretono, f0, duracion)
    if(nota == "A")
        tono = f0 * 2^(sobretono/12+7/12);
    elseif(nota == "A#" || nota == "Bb")
        tono = f0 * 2^(sobretono/12+8/12);
    elseif(nota == "B")
        tono = f0 * 2^(sobretono/12+9/12);
    elseif(nota == "C")
        tono = f0 * 2^(sobretono/12+10/12);
    elseif(nota == "C#" || nota == "Db")
        tono = f0 * 2^(sobretono/12+11/12);
    elseif(nota == "D")
        if(sobretono == 0)
            tono = f0;
        else
            tono = f0 * 2^sobretono;
        end
    elseif(nota == "D#" || nota == "Eb")
        tono = f0 * 2^(sobretono/12+1/12);
    elseif(nota == "E")
        tono = f0 * 2^(sobretono/12+2/12);
    elseif(nota == "F")
        tono = f0 * 2^(sobretono/12+3/12);
    elseif(nota == "F#" || nota == "Gb")
        tono = f0 * 2^(sobretono/12+4/12);
    elseif(nota == "G")
        tono = f0 * 2^(sobretono/12+5/12);
    elseif(nota == "G#" || nota == "Ab")
        tono = f0 * 2^(sobretono/12+6/12);
    end
    
    ts=1/8192;
    t=0:ts:duracion;
    
    x = sin(2*pi*tono*t);
end