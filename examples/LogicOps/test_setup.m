clear
rng('default')

rate = 1e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 2, 12);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnReLU);

addLayer(nn, @nnLayer, 12, 5);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnReLU);

addLayer(nn, @nnLayer, 5, 3);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigmoid);

Xt  = [0 0; 0 1; 1 0; 1 1];
x1 = Xt(:,1); x2 = Xt(:,2);
Yt = [and(x1,x2) or(x1, x2) xor(x1,x2)];

test_train
