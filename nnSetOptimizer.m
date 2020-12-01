function nnSetOptimizer(mdl, optim, varargin)
while true
    if isprop(mdl,'opt')
        mdl.opt = optim(varargin{:});
    end
    if ~isempty(mdl.next)
        mdl = mdl.next;
    else
        break
    end
end
end