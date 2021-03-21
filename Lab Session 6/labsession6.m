clc;
clear all;
close all;

x=[31 12 20 -40 -21 69];

N=length(x);
X=[];

for k=0:N-1
    for n=0:N-1
        W(k+1,n+1)=exp((-1j*2*pi*k*n)/N);
    end
end

Y=fft(x');
disp('DFT using Command');
disp(Y)

X=W*x';
disp('DFT using Matrix Multiplication Method')
disp(X)

Y=ifft(X);
disp('IDFT using Command');
disp(Y)

C=(conj(W)*X)/N;
disp('IDFT using Matrix Multiplication Method')
disp(C)
