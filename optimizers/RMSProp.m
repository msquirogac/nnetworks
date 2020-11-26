classdef RMSProp < handle
    properties
        rate (1,1) {mustBeNumeric} = 1e-3
        beta (1,1) {mustBeNumeric} = 0.9
        eps  (1,1) {mustBeNumeric} = 1e-6
        hist (:,:) {mustBeNumeric}
    end
    methods
        function params = optimize(obj, params, grads)
            if isempty(obj.hist)
                obj.hist = grads.*grads;
            else
                obj.hist = obj.beta*obj.hist + (1-obj.beta)*(grads.*grads);
            end
            delta = -obj.rate*grads./(sqrt(obj.hist)+obj.eps);
            params = params + delta;
        end
    end
end