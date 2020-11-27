classdef nnCos < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = cos(x);
        end
        function dx = backward(obj, dj)
            dy = -sin(obj.x);
            dx = dj.*dy;
        end
    end
end