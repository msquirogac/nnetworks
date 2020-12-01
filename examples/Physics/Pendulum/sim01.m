clear
rng('default')

g=9.8; l=1; m=0.1; k=0.01;
a=-g/l; b=-k/(m*l);
f=@(x) [x(2) a*sin(x(1))+b*x(2)]';

x = [0 0];
dt = 0.1;
sim = Simulator(f,x,dt);

rx0 = [pi/2 pi];
neps = 100;
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

[Xt,Yt,Xv,Yv] = DataSplit(X, 5);
save TrainigData01 Xt Xv Yt Yv
