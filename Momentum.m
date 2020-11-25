classdef Momentum < handle
    properties
        rate (1,1) {mustBeNumeric} = 1e-2
        beta (1,1) {mustBeNumeric} = 1e-2
        eps  (1,1) {mustBeNumeric} = 1e-6
        hist (:,:) {mustBeNumeric}
    end
    methods
        function params = optimize(obj, params, grads)
            if isempty(obj.hist)
                obj.hist = grads;
            else
                obj.hist = obj.beta*obj.hist + (1-obj.beta)*grads;
            end
            ugrads = obj.hist;
            params = params - obj.rate*ugrads;
        end
    end
end