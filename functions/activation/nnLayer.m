classdef nnLayer < nnBasicBlock
    properties
        b     (1,:) {mustBeNumeric}
        w     (:,:) {mustBeNumeric}
        opt
    end
    properties (Access = private)
        dj    (:,:) {mustBeNumeric}
    end
    methods
        function obj = nnLayer(din, dout)
            obj.b(  1, dout) = 0;
            obj.w(din, dout) = 0;
            obj.opt = adam();
        end
        function y = forward(obj, x)
            y = x*obj.w + obj.b;
        end
        function dj = backward(obj, dj)
            obj.dj = dj;
            dy = obj.w;
            dj = dj*dy';
        end
        function optimize(obj)
            dy = obj.x;
            db = sum(obj.dj, 1);
            dw = dy'*obj.dj;
            params = vertcat(obj.b, obj.w);
            grads = vertcat(db, dw);
            params = optimize(obj.opt, params, grads);
            obj.b = params(1,:);
            obj.w = params(2:end,:);
            if ~isempty(obj.last)
                optimize(obj.last);
            end
        end
    end
end