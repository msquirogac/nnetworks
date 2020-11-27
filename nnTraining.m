function [J, iter] = nnTraining(network, lossfcn, xt, yt, niter, tol)
validateattributes(network,{'nnetwork'},{'nonempty'},'','');
validateattributes(lossfcn,{'function_handle'},{'nonempty'},'','');
validateattributes(xt,{'numeric'},{'nonempty'},'','');
validateattributes(yt,{'numeric'},{'nonempty'},'','');

if nargin < 6
    tol = 1e-2;
end
if nargin < 5
    niter = 1000;
end

J = zeros(niter, size(yt,2));

tic
% Training
for iter=1:niter
    % Forward propagation
    y = forwProp(network,xt);
    
    % Loss function
    [j,d] = lossfcn(yt,y);
    
    % Back propagation
    backProp(network,d);
    
    % Optimize parameters
    optimize(network);
    
    % Save loss
    J(iter,:) = j;
    if ~mod(iter,100)
        disp("Iteration:"); disp(iter);
        disp("Loss:"); disp(j);
        if all(j < tol)
            break
        end
    end
end
toc
