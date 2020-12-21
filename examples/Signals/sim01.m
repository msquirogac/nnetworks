clear
rng('default')

f=@(x) 0.2 + 0.4*x.^2 + 0.3*x.*sin(15*x) + 0.05*cos(50*x);

x=(0:0.001:1)';
y=f(x);

ii = randperm(numel(x),100);
Xv = x(ii);
Yv = y(ii);
Xt = x;
Yt = y;
Xt(ii) = [];
Yt(ii) = [];

save TrainingData01 Xt Yt Xv Yv