function [j, d] = nnlossL2(y, a)
v = y-a;
j = mean(v.*v,1);
d = -2*v.*a;

