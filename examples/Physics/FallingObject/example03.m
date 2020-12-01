clear
load TrainigData03

nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 3, 'dout', 15);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
addLayer(nn, @nnSigIdent, 'units', 1);

addLayer(nn, @nnLayer, 'din', 15, 'dout', 9);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
addLayer(nn, @nnSigIdent, 'units', 1);

addLayer(nn, @nnLayer, 'din', 9, 'dout', 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);

xb = [0  100 25];
yb = xb(2:3);
Xt = Xt+xb;
Yt = Yt+yb;
Xv = Xv+xb;
Yv = Yv+yb;

nnSetOptimizerRate(nn, 100e-6);
[J, iter] = nnTraining(nn, @nnlossL2, Xt, Yt, 10e3, 100e-3);
semilogy(J)
