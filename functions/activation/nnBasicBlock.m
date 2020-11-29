classdef nnBasicBlock < handle & matlab.mixin.Heterogeneous
    properties
        x    (:,:) {mustBeNumeric}
        y    (:,:) {mustBeNumeric}
        last nnBasicBlock
        next nnBasicBlock
        id   (1,1) {mustBeNumeric} = 0
    end
    methods (Abstract)
        y  = forward(obj, x)
        dx = backward(obj, dj)
    end
    methods
        function y = forwProp(obj, x)
            y = forward(obj, x);
            obj.x = x;
            obj.y = y;
            if ~isempty(obj.next)
                y = forwProp(obj.next, y);
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