function nnSetOptimizerRate(mdl, rate)
while true
    if isprop(mdl,'opt')
        mdl.opt.rate = rate;
    end
    if ~isempty(mdl.next)
        mdl = mdl.next;
    else
        break
    end
end
end