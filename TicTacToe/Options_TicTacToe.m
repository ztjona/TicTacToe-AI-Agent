classdef Options_TicTacToe
    %Options_TicTacToe
    
    %{
    Laboratorio de Inteligencia y Visión Artificial
    ESCUELA POLITÉCNICA NACIONAL
    Quito - Ecuador
    
    autor: z_tja
    jonathan.a.zea@ieee.org
    
    "I find that I don't understand things unless I try to program them."
    -Donald E. Knuth
    
    18 December 2023
    %}
    
    %%
    
    properties  (Access=public)
        board_size; % at least [3 3]
        symbols; % symbols of the players. First symbol is the first player
        print; %bool to display in console movements.
        
        end_by_fast_draw; % bool to end early the game if there is an
        % unwinnable position. When false the game runs until the board
        % is full.
        
        strike; % number of symbols in a row, column or diag to win.
        % Set to 3 to 3x3 boards, 4 to the rest of board sizes.
    end
    
    methods
        %% Constructor
        % -----------------------------------------------------------------
        function obj = Options_TicTacToe(options)
            %Options_TicTacToe(...) constructor
            
            % # ---- Data Validation
            arguments
                options.board_size (1, 2) double ...
                    {mustBePositive, mustBeInteger} = [3 3];
                options.symbols (1, 2) string = ["X", "O"];
                options.print (1, 1) logical = false;
                options.end_by_fast_draw (1, 1) logical = false;
            end
            
            % # ---- Further validations
            assert(options.symbols(1) ~= options.symbols(2), ...
                "symbols must be different")
            
            assert(all(options.board_size  > 2, "all"), ...
                "Board size must be greater than 2")
            
            % same names in the fields of options and in class properties
            for f = fieldnames(options)'
                obj.(f{1}) = options.(f{1});
            end
            
            if obj.board_size(1) == 3
                obj.strike = 3;
            else
                obj.strike = 4;
            end
        end
    end
end
% More properties at: AbortSet, Abstract, Access, Dependent, GetAccess, ...
% GetObservable, NonCopyable, PartialMatchPriority, SetAccess, ...
% SetObservable, Transient, Framework attributes
% https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html

% Methods: Abstract, Access, Hidden, Sealed, Framework attributes
% https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html