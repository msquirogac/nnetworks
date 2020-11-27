function [J, ii] = nnTraining(network, loss, xt, yt, iter, tol)
validateattributes(network,{'nnetwork'},{'nonempty'},'','');
validateattributes(loss,{'function_handle'},{'nonempty'},'','');
validateattributes(xt,{'numeric'},{'nonempty'},'','');
validateattributes(yt,{'numeric'},{'nonempty'},'','');

if nargin < 6
    tol = 1e-2;
end
if nargin < 5
    iter = 1000;
end

J = zeros(iter, size(yt,2));

tic
% Training
for ii=1:iter
    % Forward propagation
    y = forwProp(network,xt);
    
    % Loss function
    [j,d] = loss(yt,y);
    
    % Back propagation
    backProp(network,d);
    
    % Optimize parameters
    optimize(network);
    
    % Save loss
    J(ii,:) = j;
    if ~mod(ii,100)
        disp("Iteration:"); disp(ii);
        disp("Loss:"); disp(j);
        if all(j < tol)
            break
        end
    end
end
toc