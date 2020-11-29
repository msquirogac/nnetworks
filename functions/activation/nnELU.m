classdef nnELU < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric, mustBePositive} = 1
    end
    methods
        function y = forward(obj, x)
            y = max(x,0)+obj.b*min(exp(x)-1,0);
        end
        function dx = backward(obj, dj)
            dy = obj.y+obj.b;
            dy(obj.x>0) = 1;
            dx = dj.*dy;
        end
    end
end