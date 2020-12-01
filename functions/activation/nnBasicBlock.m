classdef nnBasicBlock < handle & matlab.mixin.Heterogeneous
    properties
        x    (:,:) {mustBeNumeric}
        next nnBasicBlock
        last nnBasicBlock
        id   (1,1) {mustBeNumeric} = 0
    end
    methods (Abstract)
        x  = forward(obj, x)
        dj = backward(obj, dj)
    end
    methods
        function x = forwProp(obj, x)
            obj.x = x;
            x = forward(obj, x);
            if ~isempty(obj.next)
                x = forwProp(obj.next, x);
            end
        end
        function dj = backProp(obj, dj)
            dj = backward(obj, dj);
            if ~isempty(obj.last)
                dj = backProp(obj.last, dj);
            end
        end
        function optimize(obj)
            if ~isempty(obj.last)
                optimize(obj.last);
            end
        end
    end
end