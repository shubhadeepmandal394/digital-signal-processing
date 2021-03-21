clc;
clear all;
close all;

syms n a1 a2 T w real;
syms z complex;

x1=sin(w*n);
x2=exp(-n*T);

disp('Verification of Linearity Property');

disp('LHS');
pretty (ztrans(((a1*x1)+(a2*x2))))

disp('RHS');
pretty ((a1*(ztrans(x1)))+(a2*(ztrans(x2))))

disp('Since LHS = RHS, Linearity Property is Verified');