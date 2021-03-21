clc;
clear all;
close all;

AP=0.707;
AS=0.2;
PDF=0.3*pi;
SDF=0.75*pi;
T=1;

al_p=-20*log10(AP);
disp('Passband Attenuation in dB ');
disp(al_p);
al_s=-20*log10(AS);
disp('Stopband Attenuation in dB ');
disp(al_s);

PAF=PDF/T;
disp('Passband edge analog frequency in rad/sec ');
disp(PAF);
SAF=SDF/T;
disp('Stopband edge analog frequency in rad/sec ');
disp(SAF);

[N, Wc] = buttord(PAF, SAF, al_p, al_s, 's')
disp('The order of filter is ');
disp(N);
disp('The cut off frequency of filter in rad/sec  is ');
disp(Wc/pi);

[Bn, An] = butter(N, 1, 's');
disp('Normalised Transfer function is ');
Hsn=tf(Bn,An)
[Bu, Au] = butter(N, Wc, 's');
disp('Un-Normalised Transfer function is ');
Hsu=tf(Bu,Au)
[num,den]=impinvar(Bu,Au,1/T);
disp('Digital Transfer function is ');
H=tf(num,den,T)

w=0:0.001:pi;
disp('Frequency response is ');
Hf = freqz(num,den,w);
disp(angle(Hf));
disp('Magnitude response is ');
Hf_mag=abs(Hf);
disp(Hf_mag)

subplot(2,1,1);
plot(w/pi,Hf_mag,'b');
title('Magnitude Response of Butterworth Low-pass Filter');
xlabel('Frequency');
ylabel('Magnitude');

subplot(2,1,2);
plot(w/pi,angle(Hf),'b');
title('Phase Response of Butterworth Low-pass Filter');
xlabel('Frequency');
ylabel('Phase');