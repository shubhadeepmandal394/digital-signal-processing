%Program to plot frequency of highpass filter using hamming window
wc=0.8*pi
N=7
hd=zeros(1,N)
a=(N-1)/2
hna=1-(wc/pi) %impulse response at n = alpha
k=1:1:((N-1)/2)
n=k-1-((N-1)/2)
w_ham(k)=0.54-0.46*cos(2*pi*(k-1)/(N-1));
hd(k)=-sin(wc*n)./(pi*n) %impulse response by inverse Fourier transform
for s=1:length(k)
hn(s)=hd(s)*w_ham(s) %impulse response multiplied by Hamming window
end
hn=[hn hna]
w=0:pi/50:pi
Hw1=hna*exp(-j*w*a)
Hw2=0
for m=1:1:a
Hw3=hn(m)*((exp(j*w*(1-m)))+(exp(-j*w*(1-m+2*a))))
Hw2=Hw2+Hw3
end
Hw=Hw2+Hw1
H_mag_Ham=abs(Hw)
H_ang_Ham=angle(Hw)
figure
subplot(2,1,1);plot(w/pi,H_mag_Ham,'k');
title('Magnitude Response of HPF using Hamming window','fontsize',12,'fontweight','b');
xlabel('Normalised frequency, \omega/\pi','fontsize',12,'fontweight','b');
ylabel('Magnitude |H(e^{j\omega})|','fontsize',12,'fontweight','b');
subplot(2,1,2);plot(w/pi,H_ang_Ham,'k');
title('Phase Response of HPF using Hamming window','fontsize',12,'fontweight','b');
xlabel('Normalised frequency, \omega/\pi','fontsize',12,'fontweight','b');
ylabel('Phase |H(e^{j\omega})|','fontsize',12,'fontweight','b');