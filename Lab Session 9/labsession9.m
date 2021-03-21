clc;
clear all;
close all;

wc=0.2*pi;
N=7;
hd=zeros(1,N)
alpha=(N-1)/2
hn_alpha=wc/pi
k=1:1:(N-1)/2
n=k-1-(N-1)/2
hd(k)=sin(wc*n)./(pi*n)
hn(k)=hd(k)*1
hn=[hn hn_alpha]
w=0:pi/30:pi
Hw1=hn_alpha*exp(-j*w*alpha)
Hw2=0
for p=1:1:alpha
    Hw3=hn(p)*((exp(j*w*(1-p)))+(exp(-j*w*(1-p+2*alpha))))
    Hw2=Hw2+Hw3
end
Hw=Hw1+Hw2

H_mag=abs(Hw)
H_phase=angle(Hw)

subplot(2,1,1);
plot(w/pi, H_mag);
subplot(2,1,2);
plot(w/pi, H_phase);