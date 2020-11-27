classdef nnAtan < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = atan(x);
        end
        function dx = backward(obj, dj)
            dy = 1./(1+obj.x.*obj.x);
            dx = dj.*dy;
        end
    end
end