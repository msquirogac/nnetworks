classdef nnXSin < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = x.*sin(x);
        end
        function dx = backward(obj, dj)
            dy = sin(obj.x) + obj.x.*cos(obj.x);
            dx = dj.*dy;
        end
    end
end