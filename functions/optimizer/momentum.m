classdef momentum < optimizers
    properties
        rate (1,1) {mustBeNumeric} = 1e-3
        beta (1,1) {mustBeNumeric} = 0.9
    end
    properties (Access = private)
        hist (:,:) {mustBeNumeric}
    end
    methods
        function obj = momentum(varargin)
            if nargin > 0
                obj.rate = varargin{1};
            end
        end
        function params = optimize(obj, params, grads)
            if isempty(obj.hist)
                obj.hist = grads;
            else
                obj.hist = obj.beta*obj.hist + (1-obj.beta)*grads;
            end
            delta = -obj.rate*obj.hist;
            params = params + delta;
        end
    end
end