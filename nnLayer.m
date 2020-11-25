classdef nnLayer < nnBasicBlock
    properties
        w     (:,:) {mustBeNumeric}
        b     (1,:) {mustBeNumeric}
        rate  (:,:) {mustBeNumeric} = 1e-3
        optw
        optb
    end
    methods
        function obj = nnLayer(din, dout)
            obj.w(din, dout) = 0;
            obj.b(  1, dout) = 0;
            obj.optw = RMSProp();
            obj.optb = RMSProp();
        end
        function y = forward(obj, x)
            y = x*obj.w + obj.b;
        end
        function dx = backward(obj, dj)
            dy = obj.w;
            dx = dj*dy';
        end
        function update(obj)
            dy = obj.x;
            dw = dy'*obj.dj;
            db = sum(obj.dj, 1);
            obj.w = obj.w - obj.rate*compute(obj.optw, dw);
            obj.b = obj.b - obj.rate*compute(obj.optb, db);
            if ~isempty(obj.prev)
                update(obj.prev);
            end
        end
    end
end