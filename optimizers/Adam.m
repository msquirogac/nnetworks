classdef Adam < handle
    properties
        rate  (1,1) {mustBeNumeric} = 1e-3
        beta1 (1,1) {mustBeNumeric} = 0.9
        beta2 (1,1) {mustBeNumeric} = 0.99
        eps   (1,1) {mustBeNumeric} = 1e-8
        hist1 (:,:) {mustBeNumeric}
        hist2 (:,:) {mustBeNumeric}
    end
    methods
        function params = optimize(obj, params, grads)
            if isempty(obj.hist1)
                obj.hist1 = grads;
                obj.hist2 = grads.*grads;
            else
                obj.hist1 = obj.beta1*obj.hist1 + (1-obj.beta1)*(grads);
                obj.hist2 = obj.beta2*obj.hist2 + (1-obj.beta2)*(grads.*grads);
            end
            v1 = obj.hist1/(1-obj.beta1);
            v2 = obj.hist2/(1-obj.beta1);
            delta = -obj.rate*v1./(sqrt(v2)+obj.eps);
            params = params + delta;
        end
    end
end