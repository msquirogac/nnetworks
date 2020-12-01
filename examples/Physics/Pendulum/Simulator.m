classdef Simulator < handle
    properties
        model function_handle
        time  (1,1) {mustBeNumeric}
        state (1,:) {mustBeNumeric}
        input (1,:) {mustBeNumeric}
    end
    methods
        function obj = Simulator(model, state, time)
            obj.model = model;
            obj.state = state;
            obj.time = time;
        end
        function state = Step(obj, input)
            if nargin > 1
                odefun = @(t,state) obj.model(state, input);
                obj.input = input;
            else
                odefun = @(t,state) obj.model(state);
            end
            tspan = [0 obj.time];
            y0 = obj.state;
            [~,y] = ode45(odefun, tspan, y0);
            state = y(end,:);
            obj.state = state;
        end
        function state = State(obj)
            state = obj.state;
        end
        function Reset(obj, state)
            obj.state = state;
        end
    end
end