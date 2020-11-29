classdef nnReLU < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = max(0,x);
        end
        function dx = backward(obj, dj)
            dy = ones(size(obj.x));
            dy(obj.x<0) = 0;
            dx = dj.*dy;
        end
    end
end