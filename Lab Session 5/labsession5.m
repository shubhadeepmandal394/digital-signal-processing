clc;
clear all;
close all;

N=input('Enter the No. of Points : ');

for k=0:N-1
    for n=0:N-1
        W(k+1,n+1)=exp((-1j*2*pi*k*n)/N);
    end
end

disp('Twiddle Factor is .. ')
disp(W)
plot(W)
title('Twiddle Factor')