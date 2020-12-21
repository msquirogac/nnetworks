clear
load TrainigData01

nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 3, 'dout', 50);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSigmoid);

addLayer(nn, @nnLayer, 'din', 50, 'dout', 15);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSigmoid);

addLayer(nn, @nnLayer, 'din', 15, 'dout', 2);
nn.last.w = initRand(nn.last.w);

f = @(x,r,b) (x-b)./r;
g = @(x,r,b) (x.*r+b);
xr = 2*(max(Xt)-min(Xt));
xb = 4*min(Xt);
yr = 2*(max(Yt)-min(Yt));
yb = 4*min(Yt);

Xt = f(Xt,xr,xb);
Xv = f(Xv,xr,xb);
Yt = f(Yt,yr,yb);
Yv = f(Yv,yr,yb);

nnSetOptimizerRate(nn, 10e-6);
J = nnTraining(nn, @nnlossL2, Xt, Yt, 500e3, 1e-6);
figure; semilogy(J)

nnSetOptimizerRate(nn, 2e-6);
J = nnTraining(nn, @nnlossL2, Xt, Yt, 500e3, 1e-6);
figure; semilogy(J)
