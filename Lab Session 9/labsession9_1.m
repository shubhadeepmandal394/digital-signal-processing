%Program to plot frequency of lowpass filter using rectangular window
clear all;
clc;
wc=0.2*pi;
N=7;
hd=zeros(1,N)
a=(N-1)/2
hna=wc/pi %impulse response at n = alpha
k=1:1:((N-1)/2)
n=k-1-((N-1)/2)
hd(k)=sin(wc*n)./(pi*n) %impulse response by inverse Fourier transform
hn(k)=hd(k)*1 %impulse response multiplied by Rectangular window
hn=[hn hna]
w=0:pi/50:pi
Hw1=hna*exp(-j*w*a)
Hw2=0;

for m=1:1:a
    Hw3=hn(m)*((exp(j*w*(1-m)))+(exp(-j*w*(1-m+2*a))))
    Hw2=Hw2+Hw3;
end
Hw=Hw2+Hw1

H_mag_rect=abs(Hw)
H_ang_rect=angle(Hw)

subplot(2,1,1);plot(w/pi,H_mag_rect,'k');
title('Magnitude Response of LPF using Rectangular window','fontsize',12,'fontweight','b');
xlabel('Normalised frequency, \omega/\pi','fontsize',12,'fontweight','b');
ylabel('Magnitude |H(e^{j\omega})|','fontsize',12,'fontweight','b');
subplot(2,1,2);plot(w/pi,H_ang_rect,'k');
title('Phase Response of LPF using Rectangular window','fontsize',12,'fontweight','b');
xlabel('Normalised frequency, \omega/\pi','fontsize',12,'fontweight','b');
ylabel('Phase |H(e^{j\omega})|','fontsize',12,'fontweight','b');