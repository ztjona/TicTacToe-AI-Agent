classdef Turn < uint8
    enumeration
        first (1), second (2)
    end
    
    methods
        % why is it hidden
        function obj = change_turn(obj)
            if obj == Turn.first
                obj = Turn.second;
            else
                obj = Turn.first;
            end
        end
    end
end