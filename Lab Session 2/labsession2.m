clc
clear all
close all
n=0:1:20;

x1=1.*(n>=1 & n<=10);
subplot(3,1,1);stem(n,x1);
xlabel('n');ylabel('x1(n)');title('x1(n)');

x2=1.*(n>=4 & n<=12);
subplot(3,1,2);stem(n,x2);
xlabel('n');ylabel('x2(n)');title('x2(n)');

x3=n.*(n>=0 & n<=10);
subplot(3,1,3);stem(n,x3);
xlabel('n');ylabel('x3(n)');title('x3(n)');

L1=length(x1);
L2=length(x2);
L3=length(x3);
n1=0:1:L1+L3-2;

figure
subplot(2,2,1);stem(n,x1);
xlabel('n');ylabel('x1(n)');title('x1(n)');

subplot(2,2,2);stem(n,x2);
xlabel('n');ylabel('x2(n)');title('x2(n)');

y=conv(x1,x2);
subplot(2,2,3);stem(n1,y);
xlabel('n');ylabel('y(n)');title('Output y(n) using conv Command');

N=L1+L2-1;
X2=fliplr(x2);
for i=1:N
  c(i)=0;
  for j=1:L1
    if j>i
      continue;
    end
    if (L2-i+j)<=0
      continue;
    end
    c(i)=c(i)+(x1(j)*X2(L2-i+j));
  end
end
Y=c(1:N);
subplot(2,2,4);stem(n1,Y);
xlabel('n');ylabel('y(n)');
title('Output y(n) using Graphical Method');

figure
y1=conv(x1,x3);
subplot(3,1,1);stem(n1,y1);
xlabel('n');ylabel('y1(n)');title('x1(n)*x3(n)');

y2=conv(x3,x1);
subplot(3,1,2);stem(n1,y2);
xlabel('n');ylabel('y2(n)');title('x3(n)*x1(n)');

subplot(3,1,3);stem(n1,y2-y1);
xlabel('n');ylabel('Magnitude');title('Commutative Property Verification');

figure
tmp1 = conv(x2,x3);
ll = length(tmp1);
n1=0:1:L1+ll-2;
y1=conv(x1,tmp1);
subplot(3,1,1);stem(n1,y1);
xlabel('n');ylabel('y1(n)');title('x1(n)*[x2(n)*x3(n)]');

tmp2 = conv(x1,x2);
lll = length(tmp1);
n1=0:1:L1+lll-2;
y2=conv(tmp2,x3);
subplot(3,1,2);stem(n1,y2);
xlabel('n');ylabel('y2(n)');title('[x1(n)*x2(n)]*x3(n)');

subplot(3,1,3);stem(n1,y2-y1);
xlabel('n');ylabel('Magnitude');title('Associative Property Verification');

figure
tmp1 = x2+x3;
y1 = conv(x1,tmp1);
n1=0:1:L1+L2-2;
subplot(3,1,1);stem(n1,y1);
xlabel('n');ylabel('y1(n)');title('x1(n)*[x2(n)+x3(n)]');

tmp2 = conv(x1,x2);
tmp3 = conv(x1,x3);
y2 = tmp2 + tmp3;
subplot(3,1,2);stem(n1,y2);
xlabel('n');ylabel('y2(n)');title('x1(n)*x2(n)+x1(n)*x3(n)');

subplot(3,1,3);stem(n1,y2-y1);
xlabel('n');ylabel('Magnitude');title('Distributive Property Verification');





