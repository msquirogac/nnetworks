classdef nnReLU < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = max(0,x);
        end
        function dj = backward(obj, dj)
            dy = ones(size(obj.x),'like',obj.x);
            dy(obj.x<0) = 0;
            dj = dj.*dy;
        end
    end
end