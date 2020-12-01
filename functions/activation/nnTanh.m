classdef nnTanh < nnBasicBlock
    properties (Access = private)
        y (:,:) {mustBeNumeric}
    end
    methods
        function x = forward(obj, x)
            x = tanh(x);
            obj.y = x;
        end
        function dj = backward(obj, dj)
            dy = 1-obj.y.*obj.y;
            dj = dj.*dy;
        end
    end
end