classdef (Abstract) optimizers < handle
    methods
        params = optimize(obj, params, grads)
    end
end