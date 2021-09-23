%%
%Parte 1.

%%
%Declaración de valores de frecuencia(Hz) para las notas.
f0=340;
% d=f0;
% f=f0*(2^(3/12));
% g=f0*(2^(5/12));
% bf=f0*(2^(8/12));
% c=f0*(2^(10/12));
% d2=2*d;

%%
%Declaración de dominios de tiempo.
ts=1/8192;
% t=0:ts:0.4;
s1=0*(0:ts:0.1);
s2=0*(0:ts:0.05);
% tl=0:ts:1;

%%
%Declaración de funciones para las notas.
d1 = generarNota("D", 0, f0, 0.4);%d1=sin(2*pi*d*t);
f1 = generarNota("F", 0, f0, 0.4);%f1=sin(2*pi*f*t);
g1 = generarNota("G", 0, f0, 0.4);%g1=sin(2*pi*g*t);
bf1 = generarNota("Bb", 0, f0, 0.4);%bf1=sin(2*pi*bf*t);
c1 = generarNota("C", 0, f0, 0.4);%c1=sin(2*pi*c*t);
dl1 = generarNota("D", 1, f0, 1);%dl1=sin(2*pi*d2*tl);
dl2 = generarNota("D", 0, f0, 1);%dl2=sin(2*pi*d*tl);

%%
%Declaración de las secuencias.
asc=[d1 s1 f1 s1 g1 s1 bf1 s1 c1 s2 dl1];
dsc=[c1 s1 bf1 s1 g1 s1 f1 s1 dl2];
y=[asc s1 dsc s1];

%%
%Escuchar la secuencia.
%sound(y);

%%
%==========================================================================
%%
%Parte 2.

%%
%Escuchar la secuencia por la envolvente%
at1y = sintetizarFuncion(0, y);
at2y = sintetizarFuncion(1, y);
%sound(at1y)
%sound(at2y)

%%
%==========================================================================
%%
%Parte 3.

%%
%Escuchar las notas por cada envolvente%
%F#(0.3)
fs = generarNota("F#", 0, f0, 0.3);
sint0_fs = sintetizarFuncion(0, fs);
sint1_fs = sintetizarFuncion(1, fs);
%sound(sint0_fs)
%sound(sint1_fs)
%D(0.4)
d = generarNota("D", 0, f0, 0.4);
sint0_d = sintetizarFuncion(0, d);
sint1_d = sintetizarFuncion(1, d);
%sound(sint0_d)
%sound(sint1_d)
%E(0.4)
e = generarNota("E", 0, f0, 0.4);
sint0_e = sintetizarFuncion(0, e);
sint1_e = sintetizarFuncion(1, e);
%sound(sint0_e)
%sound(sint1_e)
%A(1)
a = generarNota("A", 0, f0, 1);
sint0_a = sintetizarFuncion(0, a);
sint1_a = sintetizarFuncion(1, a);
%sound(sint0_a)
%sound(sint1_a)
%A(0.4)
a = generarNota("A", 0, f0, 0.4);
sint0_a = sintetizarFuncion(0, a);
sint1_a = sintetizarFuncion(1, a);
%sound(sint0_a)
%sound(sint1_a)
%E(0.4)
e = generarNota("E", 0, f0, 0.4);
sint0_e = sintetizarFuncion(0, e);
sint1_e = sintetizarFuncion(1, e);
%sound(sint0_e)
%sound(sint1_e)
%F#(0.3)
fs = generarNota("F#", 0, f0, 0.3);
sint0_fs = sintetizarFuncion(0, fs);
sint1_fs = sintetizarFuncion(1, fs);
%sound(sint0_fs)
%sound(sint1_fs)
%D(1)
d = generarNota("D", 0, f0, 1);
sint0_d = sintetizarFuncion(0, d);
sint1_d = sintetizarFuncion(1, d);
%sound(sint0_d)
%sound(sint1_d)
%%
%Escuchar la secuencia de notas generada
secPruebaNormal = [fs s1 d s1 e s1 a s1 e s1 fs s1 d];
secPruebaSint0 = [sint0_fs s1 sint0_d s1 sint0_e s1 sint0_a s1 sint0_e s1 sint0_fs s1 sint0_d];
secPruebaSint1 = [sint1_fs s1 sint1_d s1 sint1_e s1 sint1_a s1 sint1_e s1 sint1_fs s1 sint1_d];
%sound(secPruebaNormal)
%sound(secPruebaSint0)
%sound(secPruebaSint1)