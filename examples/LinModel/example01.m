clear
rng('default')
load TrainingData01

rate = 1e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 3, 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;

Xt = [X U];
Yt = Y;

runTraining
