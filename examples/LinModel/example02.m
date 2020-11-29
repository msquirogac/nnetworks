clear
rng('default')
load TrainingData02

rate = 1e-3;
nn = nnetwork();
addLayer(nn, @nnLayer, 1, 7);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnReLU);

addLayer(nn, @nnLayer, 7, 1);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;

xb = 100;
Xt = X+xb;
Yt = Y+xb;

[J, iter] = nnTraining(nn, @nnlossL2, Xt, Yt, 10000, 1e-2);
plot(J)
