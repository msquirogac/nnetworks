classdef nnBinary < nnBasicBlock
    properties
        eps (1,1) {mustBeNumeric} = 1e-3
    end
    methods
        function x = forward(obj, x)  %#ok<INUSL>
            x = 1*(x>=0);
        end
        function dj = backward(obj, dj)
            dy = 1*(abs(obj.x)<obj.eps);
            dj = dj.*dy;
        end
    end
end