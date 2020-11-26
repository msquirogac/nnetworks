x0 = 20;
xb = 100;
y = x0+xb;
Yp = [y];
n=150;

tic
for ii=1:n
    y = forwProp(nBest,y);
    Yp(end+1) = y;
end
toc

Yp = Yp-xb;

hold all
plot(Yp)