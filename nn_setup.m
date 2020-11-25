clear
rng('default')

d = [2,10,3,1];
stack = {};

% Create network
for ii=1:numel(d)-1
    dim = {d(ii), d(ii+1)};
    ll = nnLayer(dim{:});
    ll.w = rand(size(ll.w));
    ll.id = ii;
    aa = nnRelu();
    aa.id = ii;
    stack{end+1} = ll;
    stack{end+1} = aa;
end
aa = nnSigmoid();
%aa = nnTanh();
aa.id = ii;
stack{end} = aa;
%stack(end) = [];

% Link network fordwards
for ii=1:numel(stack)-1
    stack{ii}.next = stack{ii+1};
end
% Link network backwards
for ii=2:numel(stack)
    stack{ii}.prev = stack{ii-1};
end


