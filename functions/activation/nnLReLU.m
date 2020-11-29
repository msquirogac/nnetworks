classdef nnLReLU < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric, mustBePositive} = 0.01
    end
    methods
        function x = forward(obj, x)
            x = max(obj.b*x,x);
        end
        function dj = backward(obj, dj)
            dy = ones(size(obj.x),'like',obj.x);
            dy(obj.x<0) = obj.b;
            dj = dj.*dy;
        end
    end
end