classdef Adagrad < handle
    properties
        rate (1,1) {mustBeNumeric} = 1e-2
        eps  (1,1) {mustBeNumeric} = 1e-6
        hist (:,:) {mustBeNumeric}
    end
    methods
        function params = optimize(obj, params, grads)
            if isempty(obj.hist)
                obj.hist = grads.^2;
            else
                obj.hist = obj.hist + grads.^2;
            end
            ugrads = grads./(sqrt(obj.hist)+obj.eps);
            params = params - obj.rate*ugrads;
        end
    end
end