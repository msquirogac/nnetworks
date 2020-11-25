classdef Adagrad < handle
    properties
        rate (1,1) {mustBeNumeric} = 1e-3
        eps  (1,1) {mustBeNumeric} = 1e-7
        hist (:,:) {mustBeNumeric}
    end
    methods
        function params = optimize(obj, params, grads)
            if isempty(obj.hist)
                obj.hist = grads.^2;
            else
                obj.hist = obj.hist + grads.^2;
            end
            delta = -obj.rate*grads./(sqrt(obj.hist)+obj.eps);
            params = params + delta;
        end
    end
end