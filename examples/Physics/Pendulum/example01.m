clear
load TrainigData01

ii = randi(size(Xt,1),1,2000);

nn = nnetwork();
addLayer(nn, @nnLayer, 'din', 3, 'dout', 100);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);
addLayer(nn, @nnSigmoid);

% addLayer(nn, @nnLayer, 'din', 15, 'dout', 7);
% nn.last.w = initRand(nn.last.w);
% nn.last.b = initRand(nn.last.b);
% addLayer(nn, @nnSin);

addLayer(nn, @nnLayer, 'din', 100, 'dout', 2);
nn.last.w = initRand(nn.last.w);
nn.last.b = initRand(nn.last.b);

xb = [0  5*pi 5*pi];
yb = xb(2:3);
Xt = Xt+xb;
Yt = Yt+yb;
Xv = Xv+xb;
Yv = Yv+yb;

Xt = single(Xt(ii,:));
Yt = single(Yt(ii,:));

nnSetOptimizerRate(nn, 1000e-6);
J = nnTraining(nn, @nnlossL2, Xt, Yt, 1e3, 100e-3);
figure; semilogy(J)

nnSetOptimizerRate(nn, 500e-6);
J = nnTraining(nn, @nnlossL2, Xt, Yt, 20e3, 100e-3);
figure; semilogy(J)
