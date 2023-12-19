classdef TicTacToe
    %TicTacToe class with the logic for one game.
    
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
    properties (Access=public)
        
    end
    properties (SetAccess=protected)
        board; % matrix with the movements of the players. 0 is empty,
        % 1 is movements of first player, 2 of the second.
        
        player_turn = Turn.first; % player that has the turn.
        % first or second.
    end
    
    properties (SetAccess=immutable)
        Options; % options of the tic tac toe
    end
    
    methods
        %% Constructor
        % -----------------------------------------------------------------
        function obj = TicTacToe(options)
            %TicTacToe(...) constructor for a game of Tic Tac Toe.
            %
            %
            % # INPUTS
            %  options      structure with the configurations for the Tic
            %               Tac Toe.
            %
            % # OUTPUTS
            %
            
            % # ---- Data Validation
            arguments
                options (1, 1) Options_TicTacToe = Options_TicTacToe();
            end
            
            % # ----
            obj.Options = options;
        end
        
        %% --- methods defined in other file
        obj = init_game(obj, initial_board);
        obj = run_game(obj, p1, p2);
        [hasFinished, winner, coordinates] = check_game_end(obj);
    end
    
    methods (Hidden)
        
    end
    
end
% More properties at: AbortSet, Abstract, Access, Dependent, GetAccess, ...
% GetObservable, NonCopyable, PartialMatchPriority, SetAccess, ...
% SetObservable, Transient, Framework attributes
% https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html

% Methods: Abstract, Access, Hidden, Sealed, Framework attributes
% https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html