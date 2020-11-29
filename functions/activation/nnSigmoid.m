classdef nnSigmoid < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = 1./(1+exp(-x));
        end
        function dj = backward(obj, dj)
            dy = obj.y.*(1-obj.y);
            dj = dj.*dy;
        end
    end
end