classdef nnCos < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = cos(x);
        end
        function dj = backward(obj, dj)
            dy = -sin(obj.x);
            dj = dj.*dy;
        end
    end
end