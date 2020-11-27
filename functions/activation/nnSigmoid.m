classdef nnSigmoid < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = 1./(1+exp(-x));
        end
        function dx = backward(obj, dj)
            dy = obj.y.*(1-obj.y);
            dx = dj.*dy;
        end
    end
end