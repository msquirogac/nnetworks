classdef nnSigIdent < nnBasicBlock
    properties
        units (1,1) {mustBeNumeric} = 0
    end
    properties (Access = private)
        y     (:,:) {mustBeNumeric}
    end
    methods
        function obj = nnSigIdent(varargin)
            for ii=1:2:nargin
                switch varargin{ii}
                    case 'units'
                        obj.units = varargin{ii+1};
                end
            end
        end
        function x = forward(obj, x)
            m = obj.units+1;
            x(:,m:end) = sigmoid(x(:,m:end));
            obj.y = x;
        end
        function dj = backward(obj, dj)
            m = obj.units+1;
            dy = ones(size(obj.x),'like',obj.x);
            dy(:,m:end) = obj.y(:,m:end).*(1-obj.y(:,m:end));
            dj = dj.*dy;
        end
    end
end

function y = sigmoid(x)
y = 1./(1+exp(-x));
end