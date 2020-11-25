classdef Adam < handle
    properties
        rate (1,1) {mustBeNumeric} = 1e-2
        beta1 (1,1) {mustBeNumeric} = 1e-2
        beta2 (1,1) {mustBeNumeric} = 1e-2
        eps  (1,1) {mustBeNumeric} = 1e-6
        hist1 (:,:) {mustBeNumeric}
        hist2 (:,:) {mustBeNumeric}
    end
    methods
        function params = optimize(obj, params, grads)
            if isempty(obj.hist1)
                obj.hist1 = grads;
                obj.hist2 = grads.^2;
            else
                obj.hist1 = obj.beta1*obj.hist1 + (1-obj.beta1)*(grads);
                obj.hist2 = obj.beta2*obj.hist2 + (1-obj.beta2)*(grads.^2);
            end
            v1 = obj.hist1/(1-obj.beta1);
            v2 = obj.hist2/(1-obj.beta1);
            ugrads = v1./(sqrt(v2)+obj.eps);
            params = params - obj.rate*ugrads;
        end
    end
end