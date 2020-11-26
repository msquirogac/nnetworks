classdef nnBinary < nnBasicBlock
    properties
        eps (1,1) {mustBeNumeric} = 1e-3
    end
    methods
        function y = forward(obj, x)  %#ok<INUSL>
            y = 1*(x>=0);
        end
        function dx = backward(obj, dj)
            dy = 1*(abs(obj.y)<obj.eps);
            dx = dj.*dy;
        end
    end
end