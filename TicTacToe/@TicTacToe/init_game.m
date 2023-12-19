function obj = init_game(obj, initial_board)
%init_game() does initial preparations for the game.
%
% # INPUTS
%  initial_board    [OPTIONAL] initial board position. Must be a integer
%                   matrix with {0,1,2}s. Matrix must be same size as
%                   board. Matrix must have same number of 1s and 2s, or 1
%                   more 1 than 2s. If not provided, a board with all 0s is
%                   created.
%
% # OUTPUTS
%  obj              modifies object.
%

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

%% Input Validation
arguments
    obj
    initial_board (:, :) double = []; % redefined later
end

%%
obj.board = zeros(obj.Options.board_size); % prealloc
obj.player_turn = Turn.first;

if ~isempty(initial_board)
    % creating custom initial board
    [isValid, player_turn_] = check_initial_board();
    if isValid
        obj.board = initial_board;
        obj.player_turn = player_turn_;
    else
        warning("Invalid initial board. Using default board with all 0s.")
    end
end

%%
    function [isValid, player_turn] = check_initial_board()
        %check_initial_board() returns true if the initial board is valid.
        
        c1 = isequal(size(initial_board) , size(obj.board));
        
        % Check that initial_board only contains 0s, 1s, or 2s
        c2 = all(ismember(initial_board(:), [0, 1, 2]), "all");
        
        % Check that initial_board has same number of 1s and 2s, or 1 more
        % 1 than 2s
        c31 = sum(initial_board(:) == 1) == sum(initial_board(:) == 2);
        c32 = sum(initial_board(:) == 1) == sum(initial_board(:) == 2) + 1;
        
        isValid = c1 && c2 && (c31 || c32);
        
        if c31
            player_turn = Turn.first;
        else
            % assume c32 is true
            player_turn = Turn.second;
        end
    end
end


