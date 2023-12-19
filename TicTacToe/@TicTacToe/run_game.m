function obj = run_game(obj, p1, p2)
%run_game() loops the moves in the game. When a player makes an invalid move, it loses automatically.
%
% # USAGE
%   [] = run_game();
%
% # INPUTS
%  nameUser        char con el nombre de la carpeta del usuario.
%
% # OUTPUTS
%  nameUser        char con el nombre de la carpeta del usuario.
%
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
% arguments

% end

%%
players = {p1 p2};
hasFinished = false;

if isempty(obj.board)
    obj.board = zeros(obj.Options.board_size);
end

while ~hasFinished
    [r, c] = players{obj.player_turn}(obj.board);
    
    if ~check_valid_move(obj.board, [r, c])
        warning("Invalid move. Player %d loses.", obj.player_turn)
        obj.winner = obj.player_turn.change_turn();
        break;
    else
        obj.board(r, c) = obj.player_turn;
        figure,imagesc(obj.board)
    end
    
    obj.player_turn = obj.player_turn.change_turn();
    
    [hasFinished, winner, coordinates] = obj.check_game_end();
    [hasFinished, winner, coordinates] = obj.check_game_end();
end

winner
coordinates
end

function isValid= check_valid_move(board, coordinate)
%validate_move() returns true if the move is valid.

isValid = board(coordinate(1), coordinate(2)) == 0;

end