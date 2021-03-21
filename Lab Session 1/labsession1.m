clc;
clear all;
close all;
n=-20:1:20;
x1=2;
x2=0;

x=x1.*(n==0)+x2.*(n~=0);
subplot(3,2,1); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Unit Impulse Signal');
x=x1.*(n>=0)+x2.*(n<0);
subplot(3,2,2); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Unit Step Signal');
x=n.*(n>=0)+x2.*(n<0);
subplot(3,2,3); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Unit Ramp Signal');
x=(0.8).^n;
subplot(3,2,4); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Exponential Signal');
f=0.05;
x=sin(2*pi*f*n);
subplot(3,2,5); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Sinusoidal Signal');


figure
f=0.05;
x=sin(2*pi*f*n);
subplot(3,1,1); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Original Sinusoidal Signal');
y=2*x;
subplot(3,1,2); stem(n,y);
xlabel('n'); ylabel('x(n)'); title('Amplified Sinusoidal Signal');
y=0.5*x;
subplot(3,1,3); stem(n,y);
xlabel('n'); ylabel('x(n)'); title('Attenuated Sinusoidal Signal');


figure
d=2;
x=sin(2*pi*f*n);
subplot(3,1,1); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Original Sinusoidal Signal');
x=sin(2*pi*f*(d*n));
subplot(3,1,2); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Downsampled Sinusoidal Signal');
x=sin(2*pi*f*(n/d));
subplot(3,1,3); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Upsampled Sinusoidal Signal');


figure
x=sin(2*pi*f*n);
subplot(3,1,1); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Original Sinusoidal Signal');
y=sin(2*pi*f*(-n));
subplot(3,1,2); stem(n,y);
xlabel('n'); ylabel('x(n)'); title('Folded Sinusoidal Signal');


figure
m=5;
x=sin(2*pi*f*n);
subplot(3,1,1); stem(n,x);
xlabel('n'); ylabel('x(n)'); title('Original Sinusoidal Signal');
y1=sin(2*pi*f*(n-m));
subplot(3,1,2); stem(n,y1);
xlabel('n'); ylabel('x(n)'); title('Delayed Sinusoidal Signal');
y2=sin(2*pi*f*(n+m));
subplot(3,1,3); stem(n,y2);
xlabel('n'); ylabel('x(n)'); title('Advanced Sinusoidal Signal');


figure
x1=sin(2*pi*f*n); %generate sinusoidal signal
subplot(3,1,1); stem(n,x1); %plot the generated sinusoidal signal
xlabel('n'); ylabel('x1(n)'); title('Original Sinusoidal Signal');
x2=square(2*pi*f*n); %generate square signal
subplot(3,1,2); stem(n,x2); %plot the generated square signal
xlabel('n'); ylabel('x2(n)'); title('Original Square Signal');
y=x1+x2; %compute the added signals
subplot(3,1,3); stem(n,y); %plot the generated added signal
xlabel('n'); ylabel('y(n)'); title('Added Signal');


figure
x1=sin(2*pi*f*n); %generate sinusoidal signal
subplot(3,1,1); stem(n,x1); %plot the generated sinusoidal signal
xlabel('n'); ylabel('x1(n)'); title('Original Sinusoidal Signal');
x2=square(2*pi*f*n); %generate square signal
subplot(3,1,2); stem(n,x2); %plot the generated square signal
xlabel('n'); ylabel('x2(n)'); title('Original Square Signal');
y=x1.*x2; %compute the multiplied signals
subplot(3,1,3); stem(n,y); %plot the generated multiplied signal
xlabel('n'); ylabel('y(n)'); title('Multiplied Signal');