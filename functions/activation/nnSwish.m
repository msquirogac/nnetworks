classdef nnSwish < nnBasicBlock
    properties
        b (1,1) {mustBeNumeric} = 1
    end
    properties (Access = private)
        bx
        sg
    end
    methods
        function y = forward(obj, x)
            obj.bx = obj.b*x;
            obj.sg = 1./(1+exp(-obj.bx));
            y = x.*obj.sg;
        end
        function dx = backward(obj, dj)
            dy = obj.sg.*(1 + obj.bx.*(1 - obj.sg));
            dx = dj.*dy;
        end
    end
end
