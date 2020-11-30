classdef nnSigmoid < nnBasicBlock
    properties (Access = private)
        y    (:,:) {mustBeNumeric}
    end
    methods
        function x = forward(obj, x)
            x = 1./(1+exp(-x));
            obj.y = x;
        end
        function dj = backward(obj, dj)
            dy = obj.y.*(1-obj.y);
            dj = dj.*dy;
        end
    end
end
