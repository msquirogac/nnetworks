clear
rng('default')

a=0.1;
f=@(x) [x(2) -5-0.8*x(2)]';

x = [0 0];
dt = 0.2;
sim = Simulator(f,x,dt);

rx0 = [20 5];
neps = 20;
t=0:dt:10;
X = zeros(numel(t),1+numel(x),neps);
for ii=1:neps
    x = -rx0+2*rx0.*rand(size(x));
    Reset(sim, x);
    for jj=1:numel(t)
        y = Step(sim);
        X(jj,:,ii) = [t(jj) y];
    end
end

[Xt,Yt,Xv,Yv] = DataSplit(X, 4);
save TrainigData02 Xt Xv Yt Yv