classdef nnRelu < nnBasicBlock
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = max(0,x);
        end
        function dx = backward(obj, dj)
            dx = dj;
            dx(obj.x<=0) = 0;
        end
    end
end