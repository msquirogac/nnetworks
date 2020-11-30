classdef nnXCos < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = x.*cos(x);
        end
        function dj = backward(obj, dj)
            dy = cos(obj.x) - obj.x.*sin(obj.x);
            dj = dj.*dy;
        end
    end
end