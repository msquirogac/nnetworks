clear
rng('default')
load TrainingData01

rate = 1e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 2, 12);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnReLU);

addLayer(nn, @nnLayer, 12, 3);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigmoid);

[J, iter] = nnTraining(nn, @nnlossLog, Xt, Yt, 10e3, 1e-2);
plot(J)
