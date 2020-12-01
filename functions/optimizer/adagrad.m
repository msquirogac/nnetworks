classdef adagrad < optimizers
    properties
        rate (1,1) {mustBeNumeric} = 1e-3
        eps  (1,1) {mustBeNumeric} = 1e-7
    end
    properties (Access = private)
        hist (:,:) {mustBeNumeric}
    end
    methods
        function obj = adagrad(varargin)
            if nargin > 0
                obj.rate = varargin{1};
            end
        end
        function params = optimize(obj, params, grads)
            if isempty(obj.hist)
                obj.hist = grads.*grads;
            else
                obj.hist = obj.hist + grads.*grads;
            end
            delta = -obj.rate*grads./(sqrt(obj.hist)+obj.eps);
            params = params + delta;
        end
    end
end