classdef nnSoftMax < nnBasicBlock
    properties (Access = private)
        ise
    end
    methods
        function y = forward(obj, x)
            ex = exp(x);
            obj.ise = 1./sum(ex,1);
            y = ex.*obj.ise;
        end
        function dx = backward(obj, dj)
            dy = obj.y - obj.ise.*obj.ise;
            dx = dj.*dy;
        end
    end
end