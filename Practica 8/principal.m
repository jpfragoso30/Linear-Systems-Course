close all;
clear all;

%% --------------------GLeyendo del archivo y variables iniciales--------------------%
%sm1->audio1, fs->fSample, sm2->audio2, N->audio_length, ts->period, t->tDomain,
%fm->fDomain
[audio1,fSample] = audioread('rosas.wav');
N1 = length(audio1);
[audio2,fSample] = audioread('toto.wav');
N2 = length(audio2);
%en este caso, ambas canciones tienen la misma duracion, pero en caso de
if N2 < N1
audio_length=N2;
else
audio_length=N1;
end

period= 1/fSample;
tDomain=0:period:(audio_length-1)*period;
fDomain=-fSample/2:fSample/(audio_length-1):fSample/2;

%% --------------------señales moduladas 1,2--------------------%
%z1->modulating_fsignal1, z2->modulating_fsignal2
figure(1) %grafica señales modulada
subplot(4,1,1); plot(tDomain,audio1) ;grid on; title('Señal modulada 1');xlabel('Tiempo(s)');ylabel('Amplitud');
subplot(4,1,2); plot(tDomain,audio2) ;grid on; title('Señal modulada 2');xlabel('Tiempo(s)');ylabel('Amplitud');

%señal modulada en frecuencia
modulating_fsignal1=fftshift(fft(audio1));
modulating_fsignal2=fftshift(fft(audio2));
% grafica en frecuencia
subplot(4,1,3); plot(fDomain,abs(modulating_fsignal1)) ;grid on; title('Señal modulada 1 frecuencia');xlabel('Frecuencia(Hz)');ylabel('Amplitud');
subplot(4,1,4); plot(fDomain,abs(modulating_fsignal2)) ;grid on; title('Señal modulada 2 frecuencia');xlabel('Frecuencia(Hz)');ylabel('Amplitud');

%% --------------------señales portadoras--------------------%
%Frecuencias de estaciones de radio
%1155000->1155 * k (frec. comercial), 1255000->1255 * k (frec. comercial + 100k)
k = 1000;
%fp1->fCarrier1, fp2->fCarrier2, sp1->carrier_tsignal1,
%sp2->carrier_tsignal2, spf1->carrier_fsignal1, spf2->carrier_fsignal2,
%fpt1->carrier_fDomain1, fpt2->carrier_fDomain2
fCarrier1=1155 * k;
fCarrier2=1255 * k;
carrier_tsignal1=sin(2*pi*fCarrier1*tDomain);% Señal portadora 1
carrier_tsignal2=sin(2*pi*fCarrier2*tDomain);% Señal portadora 2
figure(2)
subplot(4,1,1); plot(tDomain,carrier_tsignal1) ;grid on; title('Señal portadora 1');xlabel('Tiempo (t)');ylabel('Amplitud');
subplot(4,1,2); plot(tDomain,carrier_tsignal2) ;grid on; title('Señal portadora 2');xlabel('Tiempo (t)');ylabel('Amplitud');

%señal portadora en frecuencia
carrier_fsignal1 = fftshift(fft(carrier_tsignal1));   
carrier_fsignal2 = fftshift(fft(carrier_tsignal2)); 
%el n*fp depende de la frecuencia
carrier_fDomain1=-(16*fCarrier1)/2:(16*fCarrier1)/(audio_length-1):(16*fCarrier1)/2;
carrier_fDomain2=-(6.855*fCarrier2)/2:(6.855*fCarrier2)/(audio_length-1):(6.855*fCarrier2)/2;
subplot(4,1,3); plot(carrier_fDomain1,abs(carrier_fsignal1)) ;grid on; title('señal portadora 1 frecuencia');xlabel('Frecuencia(Hz)');ylabel('Amplitud');
subplot(4,1,4); plot(carrier_fDomain2,abs(carrier_fsignal2)) ;grid on; title('señal portadora 2 frecuencia');xlabel('Frecuencia(Hz)');ylabel('Amplitud');

%% --------------------Modulacion AM en tiempo y frecuencia--------------------%
%modam1->modulated_tsignal1, modam2->modulated_tsignal2,
%samf1->modulated_fsignal1, samf2->modulated_fsignal2
modulated_tsignal1=audio1.*transpose(carrier_tsignal1);
modulated_tsignal2=audio2.*transpose(carrier_tsignal2);
figure(3)
subplot(4,1,1); plot(tDomain,modulated_tsignal1); grid on; title ( 'Señal modulada 1 AM'); xlabel ( 'Tiempo (t)'); ylabel (' Amplitud');
subplot(4,1,2); plot(tDomain,modulated_tsignal2); grid on; title ( 'Señal modulada 2 AM'); xlabel ( 'Tiempo (t)'); ylabel (' Amplitud(volt)   ');

modulated_fsignal1=fftshift(fft(modulated_tsignal1));  
modulated_fsignal2=fftshift(fft(modulated_tsignal2)); 
subplot(4,1,3); plot(carrier_fDomain1,abs(modulated_fsignal1)) ;grid on; title('Señal modulada AM en frecuencia');xlabel('Frecuencia(Hz)');ylabel('Amplitud');
subplot(4,1,4); plot(carrier_fDomain2,abs(modulated_fsignal2)) ;grid on; title('Señal modulada AM en frecuencia');xlabel('Frecuencia(Hz)');ylabel('Amplitud');
%% --------------------Suma de modulaciones--------------------%
%modam3->sum_modulated_tsignals, samf3->sum_modulated_fsignals
sum_modulated_tsignals= modulated_tsignal1+modulated_tsignal2;
sum_modulated_fsignals=fftshift(fft(sum_modulated_tsignals)); 
figure(4)
subplot(2,1,1); plot(tDomain,sum_modulated_tsignals); grid on; title ( 'Suma de señales moduladas AM'); xlabel ( 'Tiempo (t)'); ylabel (' Amplitud');
subplot(4,1,3); plot(carrier_fDomain2,abs(sum_modulated_fsignals)) ;grid on; title('Señal modulada AM en frecuencia');xlabel('Frecuencia(Hz)');ylabel('Amplitud');
%% --------------------Demodulacion señales--------------------%
%c->selected_song_number, sp->selected_carrier_tsignal,
%fp->selected_fCarrier, demodam->demodulated_tsignal, wc->fCutoff,
%a->transferFunction_num, b->transferFunction_den, sig->filtered_audio
selected_song_number=input('cancion 1 o 2: ');
if selected_song_number==1
    sound(audio1,fSample)
    pause
    selected_carrier_tsignal=carrier_tsignal1;
    selected_fCarrier=fCarrier1;
else
    sound(audio2,fSample)
    pause
    selected_carrier_tsignal=carrier_tsignal2;
    selected_fCarrier=fCarrier2;
end

demodulated_tsignal=sum_modulated_tsignals.*transpose(selected_carrier_tsignal); % Ecuacion 
figure(5)
subplot(4,1,1); plot(tDomain,demodulated_tsignal); grid on; title ( 'Señal modulada por señal portadora AM'); xlabel ('Tiempo (t)'); ylabel (' Amplitud');

%el super filtro
fCutoff=10000/selected_fCarrier;                              % Frecuencia de corte normalizada fmusica/fportadora
[transferFunction_num,transferFunction_den]=butter(2,fCutoff,'low');              %filtro butter de 2do orden, que corta en wc y de tipo pasabajas
filtered_audio=filter(transferFunction_num,transferFunction_den,demodulated_tsignal);                % aplicar el filtrito
%bode(transferFunction_num,transferFunction_den);
subplot(4,1,2); plot(tDomain,filtered_audio); grid on; title ('Señal demodulada'); xlabel ('time(sec)'); ylabel (' Amplitud');
%audiowrite('pepe.wav',filtered_audio,fSample);
final_audio = 5 * filtered_audio;
sound(final_audio,fSample);