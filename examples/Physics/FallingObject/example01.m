clear
load TrainigData01

rate = 400e-6;
nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 3, 'dout', 9);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigIdent, 'units', 1);

addLayer(nn, @nnLayer, 'din', 9, 'dout', 5);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigIdent, 'units', 1);

addLayer(nn, @nnLayer, 'din', 5, 'dout', 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;

xb = [0  100 20];
yb = xb(2:3);
Xt = Xt+xb;
Yt = Yt+yb;
Xv = Xv+xb;
Yv = Yv+yb;

[J, iter] = nnTraining(nn, @nnlossL2, Xt, Yt, 10e3, 100e-3);
semilogy(J)
