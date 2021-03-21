clc;
clear all;
close all;

syms n a T w real;
syms z complex;

x=n;
disp('z-transform of "n" is');
pretty (ztrans(x))

x=a^n;
disp('z-transform of "a^n" is');
pretty (ztrans(x))

x=n*a^n;
disp('z-transform of "n(a^n)" is');
pretty (ztrans(x))

x=exp(-a*n*T);
disp('z-transform of "exp(-a*n*T)" is');
pretty (ztrans(x))

x=sin(w*n);
disp('z-transform of "sin(w*n)" is');
pretty (ztrans(x))