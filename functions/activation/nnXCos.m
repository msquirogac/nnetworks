classdef nnXCos < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = x.*cos(x);
        end
        function dx = backward(obj, dj)
            dy = cos(obj.x) - obj.x.*sin(obj.x);
            dx = dj.*dy;
        end
    end
end