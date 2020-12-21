clear
rng('default')
load TrainingData02

nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 2, 'dout', 12);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnReLU);

addLayer(nn, @nnLayer, 'din', 12, 'dout', 4);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSigmoid);

nnSetOptimizerRate(nn, 100e-6);
J = nnTraining(nn, @nnlossLog, Xt, Yt, 10e3, 1e-3);
figure; semilogy(J)
