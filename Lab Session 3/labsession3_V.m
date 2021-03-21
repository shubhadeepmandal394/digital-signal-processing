clc;
clear all;
close all;

syms n a w real;
syms z complex;

x1=exp(w*n);
x2=exp(-w*n);

disp('Verification of Time Reversal Property');

disp('LHS');
pretty (simplify(ztrans(x2)))

disp('RHS');
pretty (simplify(ztrans((x1^(-1)),z)))

disp('Since LHS = RHS, Time Reversal Property is Verified');