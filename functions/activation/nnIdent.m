classdef nnIdent < nnBasicBlock
    methods
        function x = forward(obj, x)  %#ok<INUSL>
        end
        function dj = backward(obj, dj)
            dy = ones(size(obj.x),'like',obj.x);
            dj = dj.*dy;
        end
    end
end