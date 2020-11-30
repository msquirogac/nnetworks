classdef nnAtan < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = atan(x);
        end
        function dj = backward(obj, dj)
            dy = 1./(1+obj.x.*obj.x);
            dj = dj.*dy;
        end
    end
end