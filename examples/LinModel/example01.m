clear
rng('default')
load TrainingData01

rate = 1e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 3, 'dout', 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;

Xt = [X U];
Yt = Y;

[J, iter] = nnTraining(nn, @nnlossL2, Xt, Yt, 10000, 1e-2);
plot(J)
