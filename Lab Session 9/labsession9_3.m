%Program to plot frequency of bandpass filter using Blackman window
wc1=0.4*pi;
wc2=0.65*pi;
N=7;
hd=zeros(1,N);
a=(N-1)/2;
hna=(wc2-wc1)/pi; %impulse response at n = alpha
k=1:1:((N-1)/2);
n=k-1-((N-1)/2);
w_bla(k)=0.42-0.5*cos(2*pi*(k-1)/(N-1))+0.08*cos(4*pi*(k-1)/(N-1));
hd(k)=(sin(wc2*n)-sin(wc1*n))./(pi*n); %impulse response by inverse
%Fourier transform
for s=1:length(k)
hn(s)=hd(s)*w_bla(s); %impulse response multiplied by Blackman window
end
hn=[hn hna];
w=0:pi/50:pi;
Hw1=hna*exp(-j*w*a);
Hw2=0;
for m=1:1:a
Hw3=hn(m)*((exp(j*w*(1-m)))+(exp(-j*w*(1-m+2*a))));
Hw2=Hw2+Hw3;
end
Hw=Hw2+Hw1;
H_mag_Blk=abs(Hw);
H_ang_Blk=angle(Hw);
figure
subplot(2,1,1);plot(w/pi,H_mag_Blk,'k');
title('Magnitude Response of BPF using Blackman window','fontsize',12,'fontweight','b');
xlabel('Normalised frequency, \omega/\pi','fontsize',12,'fontweight','b');
ylabel('Magnitude |H(e^{j\omega})|','fontsize',12,'fontweight','b');
subplot(2,1,2);plot(w/pi,H_ang_Blk,'k');
title('Phase Response of BPF using Blackman window','fontsize',12,'fontweight','b');
xlabel('Normalised frequency, \omega/\pi','fontsize',12,'fontweight','b');
ylabel('Phase |H(e^{j\omega})|','fontsize',12,'fontweight','b');