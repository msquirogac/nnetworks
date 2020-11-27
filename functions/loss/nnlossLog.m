function [j, d] = nnlossLog(y, a)
a = 0.999*(a+0.001);
j = -sum(y.*log(a) + (1-y).*log(1-a));
d = (a-y)./(a-a.*a);
