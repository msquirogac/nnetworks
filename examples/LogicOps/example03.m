clear
rng('default')
load TrainingData03

rate = 6e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 1, 4);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 4, 8);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 8, 4);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigmoid);

[J, i]= nnTraining(nn, @nnlossLog, Xt, Yt, 40e3, 1e-2);
plot(J)
