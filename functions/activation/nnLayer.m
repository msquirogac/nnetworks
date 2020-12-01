classdef nnLayer < nnBasicBlock
    properties
        b   (1,:) {mustBeNumeric}
        w   (:,:) {mustBeNumeric}
        opt optimizers
    end
    properties (Access = private)
        dj    (:,:) {mustBeNumeric}
    end
    methods
        function obj = nnLayer(varargin)
            din = 1;
            dout = 1;
            optim = adam();
            for ii=1:2:nargin
                switch varargin{ii}
                    case 'din'
                        din = varargin{ii+1};
                    case 'dout'
                        dout = varargin{ii+1};
                    case 'optim'
                        optim = varargin{ii+1};
                end
            end
            obj.b(  1, dout) = 0;
            obj.w(din, dout) = 0;
            obj.opt = optim;
        end
        function x = forward(obj, x)
            x = x*obj.w + obj.b;
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