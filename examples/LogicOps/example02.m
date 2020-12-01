clear
rng('default')
load TrainingData02

rate = 1e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 2, 'dout', 12);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnReLU);

addLayer(nn, @nnLayer, 'din', 12, 'dout', 4);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigmoid);

[J, iter] = nnTraining(nn, @nnlossLog, Xt, Yt, 10e3, 1e-2);
plot(J)
