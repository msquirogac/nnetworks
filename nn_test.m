clear
rate = 110e-4;
nn_setup

x = [0 0; 0 1; 1 0; 1 1];
y = [0; 1; 1; 0];

J=zeros(1,1000);
tic
% Training
for ii=1:numel(J)
    % Forward propagation
    a = forwProp(stack{1},x);
    
    % Loss function
    [j,d] = nnlossLog(y,a);
    %[j,d] = nnlossL2(y,a);
    
    % Back propagation
    backProp(stack{end}, d);
    
    %Optimize
    optimize(stack{end});
    
    % Save loss
    J(ii) = j;
end
toc
j
forwProp(stack{1},x)
plot(J)
