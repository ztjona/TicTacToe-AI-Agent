function [r, c] = random_agent(board)
%random_agent() returns the coordinates of the move.
%
% # USAGE
%   [] = random_agent();
%
% # INPUTS
%  nameUser        char con el nombre de la carpeta del usuario.
%
% # OUTPUTS
%  nameUser        char con el nombre de la carpeta del usuario.
%
% # EXAMPLES
%>>     = random_agent()
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


%%
while true
    idx = numel(board);
    idx = randi(idx);
    if board(idx) == 0
        [r, c] = ind2sub(size(board), idx);
        return;
    end
end
