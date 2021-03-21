clc;
clear all;
close all;

x=[3 -1 0 1 3 2 0 1 2 1]
h=[1 1 1]
n1=length(x) %10
n2=length(h) %3
h1=[h zeros(1,n2-1)]; %adding 2 zeros
n3=length(h1) %5
N=n1+n2-1 %12
y=zeros(1, N+n3-n2) %14

% Block Convolution using Overlap Add Method ... 
if mod(n1,n2)~=0
    x=[x zeros(1, n3-mod(n1,n2))] %mod (10/3)=1, n3=5 ,n3-1=4
end

for i=1:n2:n1
    if i<N
        x1=[x(i:i+n3-n2) zeros(1, n3-n2)]
    end
    c=cconv(x1,h1,n3)
    
    if(i==1)
        y(1:n3)=c(1:n3)
    else
        y(i:i+n3-1)=y(i:i+n3-1)+c(1:n3)
    end
end

% Block Convolution using Overlap Save Method ...
h1=[h zeros(1,N-n1)]
z=zeros(1,N)
x1=[zeros(1,n2-1) x zeros(1,n3)]  %0 0 x 0 0 0 0 0

for i=1:n2:N
    x2=x1(i:i+(2*(n3-n2)))
    y1=cconv(x2,h1,n3)
    z(i:(i+n2-1))=y1(n2:n3)
end

disp('Block Convolution using Overlap Add Method ... ')
disp(y(1:N))
disp('Block Convolution using Overlap Save Method ...')
disp(z(1:N))

subplot(2,1,1);stem(y(1:N))
title('Overlap Add Method')
xlabel('n')
ylabel('y(n)')
subplot(2,1,2);stem(z(1:N))
title('Overlap Save Method')
xlabel('n')
ylabel('y(n)')
