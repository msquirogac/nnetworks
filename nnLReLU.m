classdef nnLReLU < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric} = 0.01
    end
    methods
        function y = forward(obj, x)
            y = max(0,x) + obj.b*min(0,x);
        end
        function dx = backward(obj, dj)
            dy = ones(size(obj.y));
            dy(obj.y<0) = obj.b;
            dx = dj.*dy;
        end
    end
end