clear
load TrainingData01

nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 1, 'dout', 200);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSigmoid);

addLayer(nn, @nnLayer, 'din', 200, 'dout', 1);
nn.last.w = initRand(nn.last.w);
addLayer(nn, @nnSigmoid);

nnSetOptimizerRate(nn, 1000e-6);
J = nnTraining(nn, @nnlossLog, Xt, Yt, 1000e3, 1e-4);
figure; semilogy(J)
