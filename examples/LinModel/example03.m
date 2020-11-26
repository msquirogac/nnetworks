clear
rng('default')
load TrainingData03

rate = 1e-3;
nn = nnetwork();
addLayer(nn, @nnLayer, 1, 17);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSwish);

addLayer(nn, @nnLayer, 17, 1);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;

xb = 100;
Xt  = X+xb;
Yt  = Y+xb;

runTraining

