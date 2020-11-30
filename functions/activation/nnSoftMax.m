classdef nnSoftMax < nnBasicBlock
    properties (Access = private)
        ise  (:,:) {mustBeNumeric}
        y    (:,:) {mustBeNumeric}
    end
    methods
        function x = forward(obj, x)
            ex = exp(x);
            obj.ise = 1./sum(ex,1);
            x = ex.*obj.ise;
            obj.y = x;
        end
        function dj = backward(obj, dj)
            dy = obj.y - obj.ise.*obj.ise;
            dj = dj.*dy;
        end
    end
end