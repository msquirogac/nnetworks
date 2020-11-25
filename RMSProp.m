classdef RMSProp < handle
    properties
        beta  (1,1) {mustBeNumeric} = 1e-2
        eps   (1,1) {mustBeNumeric} = 1e-6
        hist  (:,:) {mustBeNumeric}
    end
    methods
        function ugrad = compute(obj, grad)
            if isempty(obj.hist)
                obj.hist = (grad.^2);
            else
                obj.hist = obj.beta*obj.hist + (1-obj.beta)*(grad.^2);
            end
            ugrad = grad./sqrt(obj.hist+obj.eps);
        end
    end
end