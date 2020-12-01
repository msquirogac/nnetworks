classdef optimizers < handle & matlab.mixin.Heterogeneous
    methods (Abstract)
        params = optimize(obj, params, grads)
    end
end