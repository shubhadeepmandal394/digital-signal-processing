%first part
R=60;
d=rand(R,1);
n=0:1:R-1;
s=2*n.*(0.9.^n);
x=s+d';
subplot(2,1,1);
plot(n,s,':',n,d,'r--',n,x,'-');
title('The Original Uncorrupted sequence, the Noise and the Corrupted Sequence');
xlabel('Time Index[n]');
ylabel('Amplitude');
legend('s[n]','d[n]','x[n]')

%second part
M=input('No. of Input Samples : ');
B=ones(M,1)/M;
Y=filter(B,1,x);
subplot(2,1,2);
plot(n,s,':',n,Y,'g--');
title('The Original Uncorrupted sequence, the Filtered Sequence');
xlabel('Time Index[n]');
ylabel('Amplitude');
legend('s[n]','Y[n]');