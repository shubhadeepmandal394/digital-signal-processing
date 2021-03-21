clc;
clear all;
close all;

syms n w real;
syms z complex;

x=sin(w*n);

disp('Verification of Differentiation Property');

disp('LHS');
pretty (simplify(ztrans(n*x)))

disp('RHS');
pretty (simplify((-z)*(diff(ztrans(x),z))))

disp('Since LHS = RHS, Differentiation Property is Verified');