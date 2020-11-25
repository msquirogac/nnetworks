eps = 1e-5;
n = 20000;
J=zeros(n, size(y,2));
tic
% Training
for ii=1:n
    % Forward propagation
    a = forwProp(nn,x);
    
    % Loss function
    [j,d] = nnlossL2(y,a);
    
    % Back propagation
    backProp(nn, d);
    
    %Optimize
    optimize(nn);
    
    % Save loss
    J(ii,:) = j;
    if ~mod(ii,100)
        disp("Iteration:"); disp(ii);
        disp("Loss:"); disp(j);
        if norm(j) < eps
            break
        end
    end
end
toc