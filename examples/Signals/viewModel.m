Ypt = forwProp(nn,Xt);
Ypv = forwProp(nn,Xv);

figure
subplot(2,1,1)
hold all
plot(Yt)
plot(Ypt)

subplot(2,1,2)
hold all
plot(Yv)
plot(Ypv)

j = nnlossL2(Ypv,Yv);
disp(j)
