classdef nnCELU < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric, mustBePositive} = 1
    end
    properties (Access = private)
        y (:,:) {mustBeNumeric}
    end
    methods
        function x = forward(obj, x)
            x = max(x,0)+obj.b*min(exp(x./obj.b)-1,0);
        end
        function dj = backward(obj, dj)
            dy = exp(obj.x./obj.b);
            dy(obj.x>0) = 1;
            dj = dj.*dy;
        end
    end
end