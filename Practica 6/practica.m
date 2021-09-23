%%
%========================= Inciso 2)
%%
%Dominio (frecuencia)

wMIN = input("Potencia de la década inferior: "); %p.e. -2
wMAX = input("Potencia de la década mayor: "); %p.e. 2
wPOINTS = (wMAX - wMIN) * 10;

w = logspace(wMIN, wMAX, wPOINTS); %generar un rango de frecuencias logarítmico, de 
%la década 10^wMIN a 10^wMAX, con wPOINTS puntos en total.

%%
%Constantes

R = input("Valor real de la resistencia: "); %p.e. 1
C = input("Valor real del capacitor: "); %p.e. 1

%%
%Filtro pasabajas

num = [0 1];
den = [R*C 1];
H = tf(num, den); %([1], [1 + 1j * w * R * C]) expresión 1/1+jwRC

%%
%Gráfica BODE

figure('Name', 'BODE FPB', 'NumberTitle', 'off')
bode(H, w, 'b') %bode(num, den, w, 'b')
grid on

%%
%========================= Inciso 3)
%%
%Dominio (tiempo)

tMIN = input("Límite inferior del tiempo: "); %p.e. 0
tMAX = input("Límite superior del tiempo: "); %p.e. 10
tSTEPS = input("Separación del dominio de tiempo: "); %p.e. 0.1

t = (tMIN: tSTEPS: tMAX); %dominio de tiempo para lsim

%%
%Señal senoidal y respuesta del FPB

LOOPSTOP = 0; %0 continua, 1 para
figure('Name', 'RESPUESTA y entrando a FPB', 'NumberTitle', 'off')

while( LOOPSTOP == 0 )
    
    yFREC = input("Frecuencia de la señal senoidal: ");
    y = funcionSenoidal(1, yFREC, t);
    lsim(H, y, t)
    
    LOOPSTOP = input("Presione 0 para intentar con una frecuencia diferente\n, o algo diferente para terminar el programa: ");
    
end

%%
%==========FUNCIONES================
function [y] = funcionSenoidal(amplitude, scale, domain)
    y = zeros(1, length(domain));

    for iterator = 1:length(domain)
        y(iterator) = amplitude * sin(scale * 2 * pi * domain(iterator));
    end
end