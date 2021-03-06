eps = 1e-2;
n = 20000;
J = zeros(n, size(Yt,2));

jBest = 1e30;
nBest = nn;
tic
% Training
for ii=1:n
    % Forward propagation
    a = forwProp(nn,Xt);
    
    % Loss function
    [j,d] = nnlossLog(Yt,a);
    
    % Back propagation
    backProp(nn, d);
    
    %Optimize
    optimize(nn);
    
    % Save loss
    J(ii,:) = j;
    if ~mod(ii,100)
        disp("Iteration:"); disp(ii);
        disp("Loss:"); disp(j);
        if norm(j)<jBest
            jBest = norm(j);
            nBest = nn;
        end
        if norm(j) < eps
            break
        end
    end
end
toc