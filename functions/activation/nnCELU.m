classdef nnCELU < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric, mustBePositive} = 1
    end
    methods
        function y = forward(obj, x)
            y = max(x,0)+obj.b*min(exp(x./obj.b)-1,0);
        end
        function dx = backward(obj, dj)
            dy = exp(obj.x./obj.b);
            dy(obj.x>0) = 1;
            dx = dj.*dy;
        end
    end
end