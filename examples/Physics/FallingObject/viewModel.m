
Ypt = forwProp(nn,Xt);
Ypv = forwProp(nn,Xv);

figure
subplot(2,1,1)
hold all
plot(Yt-yb)
plot(Ypt-yb)

subplot(2,1,2)
hold all
plot(Yv-yb)
plot(Ypv-yb)

[j,~] = nnlossL2(Ypv,Yv)
