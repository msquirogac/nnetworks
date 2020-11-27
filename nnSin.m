classdef nnSin < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = sin(x);
        end
        function dx = backward(obj, dj)
            dy = cos(obj.x);
            dx = dj.*dy;
        end
    end
end