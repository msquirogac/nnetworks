classdef nnSin < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = sin(x);
        end
        function dj = backward(obj, dj)
            dy = cos(obj.x);
            dj = dj.*dy;
        end
    end
end