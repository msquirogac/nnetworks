clear
rng('default')
rate = 110e-4;

nn = nnetwork();
addLayer(nn, @nnLayer, 2, 10);
nn.last.w = initRand(nn.last.w);
nn.last.opt.rate = rate;
addLayer(nn, @nnRelu);

addLayer(nn, @nnLayer, 10, 3);
nn.last.w = initRand(nn.last.w);
nn.last.opt.rate = rate;
addLayer(nn, @nnRelu);

addLayer(nn, @nnLayer, 3, 1);
nn.last.w = initRand(nn.last.w);
nn.last.opt.rate = rate;
addLayer(nn, @nnSigmoid);

x = [0 0; 0 1; 1 0; 1 1];
y = [0; 1; 1; 0];

J=zeros(1,1000);
tic
% Training
for ii=1:numel(J)
    % Forward propagation
    a = forwProp(nn,x);
    
    % Loss function
    [j,d] = nnlossLog(y,a);
    %[j,d] = nnlossL2(y,a);
    
    % Back propagation
    backProp(nn, d);
    
    %Optimize
    optimize(nn);
    
    % Save loss
    J(ii) = j;
    if j < 1e-2
        break
    end
end
toc

j
forwProp(nn,x)

J = J(1:ii);
plot(J)
