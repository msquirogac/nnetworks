clear
rng('default')
load TrainingData02

nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 2, 'dout', 7);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
addLayer(nn, @nnSigIdent, 'units', 1);

addLayer(nn, @nnLayer, 'din', 7, 'dout', 7);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
addLayer(nn, @nnSigIdent, 'units', 1);

addLayer(nn, @nnLayer, 'din', 7, 'dout', 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);

xb = [250 100];
xs = 0.2;
Xt = xs*(X+xb);
Yt = xs*(Y+xb);

nnSetOptimizerRate(nn, 200e-6);
[J, iter] = nnTraining(nn, @nnlossL2, Xt, Yt, 50e3, 1e-4);
plot(J)
