clear
rng('default')

rate = 1e-4;
nn = nnetwork();
addLayer(nn, @nnLayer, 2, 12);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnRelu);

addLayer(nn, @nnLayer, 12, 5);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnRelu);

addLayer(nn, @nnLayer, 5, 3);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigmoid);

x  = [0 0; 0 1; 1 0; 1 1];
x1 = x(:,1); x2 = x(:,1);
y = [and(x1,x2) or(x1, x2) xor(x1,x2)];


