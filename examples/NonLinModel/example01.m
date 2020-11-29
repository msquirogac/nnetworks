clear
rng('default')
load TrainingData01

rate = 2e-3;
nn = nnetwork();
addLayer(nn, @nnLayer, 1, 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 2, 4);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnCELU);

addLayer(nn, @nnLayer, 4, 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;

xb = 10;
Xt = X;
Yt = Y+xb;

[J, iter] = nnTraining(nn, @nnlossL2, Xt, Yt, 30000, 1e-3);
plot(J)
