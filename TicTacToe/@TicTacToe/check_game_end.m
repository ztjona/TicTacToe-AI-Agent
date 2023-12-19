function [hasFinished, winner, coordinates] = check_game_end(obj)
%check_game_end() returns true when the game has finished and the winner.
%
%
% # INPUTS
%
% # OUTPUTS
%  hasFinished      true if the game has finished.
%  winner           (first,second or draw).
%  coordinates      n-by-2 matrix with the coordinates of the first winning move.
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

%--- Conditions to end the game

%% fast draw
if obj.Options.end_by_fast_draw
    % check if the game can be win by any player
    warning("not implemented yet")
    % must set c1.
else
    % keep playing until the board is full
    c1 = false;
end

if c1
    % draw by imposibility of winning
    winner = Result.draw;
    hasFinished = true;
    coordinates = [];
    return;
end


%% checking winner
[winner, coordinates] = get_winner(obj.Options.board_size, obj.Options.strike, obj.board);

if winner ~= Result.draw
    hasFinished = true;
else
    
    % check if the board is full
    if any(obj.board == 0, "all")
        hasFinished = false;
    else
        hasFinished = true;
    end
end

return; % verbose to assure that the function ends here
end

function [winner, coordinates] = get_winner(board_size, strike, b)
% return the winer of the game (first,second or draw) and the coordinates when the game has a winner.

%% rows
for r = 1:board_size(1)
    counts = 0;
    player = -1; % prealloc, possible values 0,1,2
    
    for c = 1:board_size(2)
        
        if b(r, c) == player && player ~= 0
            counts = counts + 1;
            if counts == strike
                winner = Result(player);
                coordinates = [coordinates; r, c];
                return;
            end
        else
            counts = 1;
            player = b(r, c);
            coordinates = [];
        end
        coordinates = [coordinates; r, c];
    end
end

%% columns
for c = 1:board_size(2)
    counts = 0;
    player = -1; % prealloc, possible values 0,1,2
    
    
    for r = 1:board_size(1)
        
        if b(r, c) == player && player ~= 0
            counts = counts + 1;
            if counts == strike
                winner = Result(player);
                coordinates = [coordinates; r, c];
                return;
            end
        else
            counts = 1;
            player = b(r, c);
            coordinates = [];
        end
        coordinates = [coordinates; r, c];
    end
end

%% diagonals top left to bottom right
% d is the diagonal iterator, d = 0 is the main diagonal, d = i is the ith right diagonal.
% d= -i is the ith left diagonal.
for d = (-board_size(1) + 1):(board_size(2) - 1)
    counts = 0;
    player = -1; % prealloc, possible values 0,1,2
    
    % i is the iterator for the diagonal elements
    for i = 1:min(board_size)
        if d >= 0
            r = i;
            c = i + d;
        else
            r = i - d;
            c = i;
        end
        
        if r < 0 || c < 0 || r > board_size(1) || c > board_size(2)
            continue;
        end
        
        % fprintf('d = %d, r = %d, c = %d\n', d, r, c)
        
        if b(r, c) == player && player ~= 0
            counts = counts + 1;
            if counts == strike
                winner = Result(player);
                coordinates = [coordinates; r, c];
                return;
            end
        else
            counts = 1;
            player = b(r, c);
            coordinates = [];
        end
        coordinates = [coordinates; r, c];
    end
end

%% diagonals top right to bottom left
% d is the diagonal iterator, d = 0 is the main diagonal, d = i is the ith right diagonal.
% d= -i is the ith left diagonal.
for d = (-board_size(2) + 1):(board_size(1) - 1)
    counts = 0;
    player = -1; % prealloc, possible values 0,1,2
    
    % i is the iterator for the diagonal elements
    for i = 1:min(board_size)
        if d >= 0
            r = d + i;
            c = board_size(2) - i + 1;
        else
            r = i;
            c = board_size(2) - i + d + 1;
        end
        
        if r <= 0 || c <= 0 || r > board_size(1) || c > board_size(2)
            continue;
        end
        
        % fprintf('negd = %d, r = %d, c = %d\n', d, r, c)
        
        if b(r, c) == player && player ~= 0
            counts = counts + 1;
            if counts == strike
                winner = Result(player);
                coordinates = [coordinates; r, c];
                return;
            end
        else
            counts = 1;
            player = b(r, c);
            coordinates = [];
        end
        coordinates = [coordinates; r, c];
    end
end
winner = Result.draw;
coordinates = [];
end
