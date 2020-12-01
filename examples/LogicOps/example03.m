clear
rng('default')
load TrainingData03

rate = 6e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 1, 'dout', 4);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 'din', 4, 'dout', 8);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 'din', 8, 'dout', 4);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigmoid);

[J, iter] = nnTraining(nn, @nnlossLog, Xt, Yt, 10e3, 1e-2);
plot(J)
