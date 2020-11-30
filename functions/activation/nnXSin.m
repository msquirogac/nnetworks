classdef nnXSin < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = x.*sin(x);
        end
        function dj = backward(obj, dj)
            dy = sin(obj.x) + obj.x.*cos(obj.x);
            dj = dj.*dy;
        end
    end
end