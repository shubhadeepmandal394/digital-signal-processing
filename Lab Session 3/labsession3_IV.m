clc;
clear all;
close all;

syms n a w real;
syms z complex;

x=cos(w*n);

disp('Verification of Change of Scale Property');

disp('LHS');
pretty (simplify(ztrans((a^n)*x)))

disp('RHS');
pretty (simplify(ztrans(x,(a^(-1))*z)))

disp('Since LHS = RHS, Change of Scale Property is Verified');