clear
rng('default')
load TrainingData03

nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 1, 'dout', 4);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 'din', 4, 'dout', 8);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 'din', 8, 'dout', 4);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSigmoid);

nnSetOptimizerRate(nn, 200e-6);
J = nnTraining(nn, @nnlossLog, Xt, Yt, 10e3, 1e-3);
figure; semilogy(J)
