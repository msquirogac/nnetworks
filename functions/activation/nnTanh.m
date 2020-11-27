classdef nnTanh < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = tanh(x);
        end
        function dx = backward(obj, dj)
            dy = 1-obj.y.*obj.y;
            dx = dj.*dy;
        end
    end
end