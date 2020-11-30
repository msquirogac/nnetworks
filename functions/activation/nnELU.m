classdef nnELU < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric, mustBePositive} = 1
    end
    properties (Access = private)
        y (:,:) {mustBeNumeric}
    end
    methods
        function x = forward(obj, x)
            x = max(x,0)+obj.b*min(exp(x)-1,0);
            obj.y = x;
        end
        function dj = backward(obj, dj)
            dy = obj.y+obj.b;
            dy(obj.x>0) = 1;
            dj = dj.*dy;
        end
    end
end