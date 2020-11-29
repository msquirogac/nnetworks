classdef nnTanh < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = tanh(x);
        end
        function dj = backward(obj, dj)
            dy = 1-obj.y.*obj.y;
            dj = dj.*dy;
        end
    end
end