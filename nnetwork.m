classdef nnetwork < nnBasicBlock
    properties
        stack (:,:) cell
    end
    methods
        function addLayer(obj, layer, varargin)
            if isempty(obj.stack)
                obj.stack{1} = layer(varargin{:});
                obj.next = obj.stack{1};
            else
                obj.stack{end+1} = layer(varargin{:});
                obj.stack{end-1}.next = obj.stack{end};
                obj.stack{end}.last = obj.stack{end-1};
            end
            obj.last = obj.stack{end};
            obj.stack{end}.id = numel(obj.stack);
        end
        function y = forward(obj, x) %#ok<INUSL>
            y = x;
        end
        function dx = backward(obj, dj) %#ok<INUSL>
            dx = dj;
        end
    end
end