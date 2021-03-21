clc;
clear all;
close all;

x1=input('Enter the first sequence within []:');
%[1,2,3,4]
n1=length(x1);
x2=input('Enter the second sequence within []:');
%[1,-1,2,1]
n2=length(x2);

%for circular pading ass zeros to maximum of lengths
if n1>n2
for i=n2+1:n1
x2(i)=0;
end
else
for i=n1+1:n2
x1(i)=0;
end
end

% calculate of new lengths
n=length(x1);

%calculation of circular convolution using graphical method
z=0;
for u=0:n-1
z(u+1)=0;
for p=0:n-1
z(u+1)= z(u+1)+((x1(p+1))*(x2(mod(u-p,n)+1)));
end
end
disp('The result of Circular Convolution using Graphical Method is ')
z

%calculation of circular convolution by using command
disp('The result of Circular Convolution using cconv Command is ')
z_c=cconv(x1,x2)

n_c=0:1:n-1;
subplot(3,1,1);stem(n_c,z,'filled');
title('Circular Convolution of x_1(n) and x_2(n) ')
xlabel('n');
ylabel('Convolved Result')

%calculation of linear convolution using command
disp('The result of Linear Convoluion is ')
z_1=conv(x1,x2);
disp(z_1)

n_1=1:1:length(z_1);
subplot(3,1,2);stem(n_1,z_1,'filled');
title('Linear Convolution of x_1(n) and x_2(n)')
xlabel('n');
ylabel('Convolved Result');
%calculation of linear convolution using circular convolution

xpad=[x1 zeros(1,n1+n2-length(x1))];
ypad=[x2 zeros(1,n1+n2-length(x2))];

ccirc=ifft(fft(xpad).*fft(ypad));
subplot(3,1,3);
stem(ccirc(1:n1+n2-1),'filled')
title('Linear Convolution by Circular Convolution')
xlabel('n');
ylabel('Convoluted Signal');