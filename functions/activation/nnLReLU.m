classdef nnLReLU < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric, mustBePositive} = 0.01
    end
    methods
        function y = forward(obj, x)
            y = max(obj.b*x,x);
        end
        function dx = backward(obj, dj)
            dy = ones(size(obj.x));
            dy(obj.x<0) = obj.b;
            dx = dj.*dy;
        end
    end
end