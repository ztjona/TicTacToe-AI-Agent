clc
o = Options_TicTacToe("board_size",[3 3], "end_by_fast_draw",false)
t = TicTacToe(o);

%%
p = [1 1 1; 0 0 0;2 2 0]
t2 = t.init_game(p);
[finished, player, coor]= t2.check_game_end()

%%
p = [2 2 1; 1 1 1;2 2 0]
t2 = t.init_game(p);
[finished, player, coor]= t2.check_game_end()

%%
p3 = [2 2 1; 2,0,0;1 1 1]
t2 = t.init_game(p3);
[finished, player, coor]= t2.check_game_end()

%%
p3 = [1 2 2; 1,2,2;1 1 1]
t2 = t.init_game(p3);
[finished, player, coor]= t2.check_game_end()
%%
p4 = [2 2 2; 1,2,1;0 1 1]
t2 = t.init_game(p4);
[finished, player, coor]= t2.check_game_end()

%%
p5 = [2 1 2; 1,2,1;0 1 2]
t2 = t.init_game(p5);
[finished, player, coor]= t2.check_game_end()

%%
o = Options_TicTacToe("board_size",[5 5], "end_by_fast_draw",false)
t = TicTacToe(o);

%%
clc
p5 = [2 2 1 1 0; 1 1 1 0 0;1 1 2 2 0;1 0 0 1 2; 2 2 0 0 2]
t2 = t.init_game(p5);
[finished, player, coor]= t2.check_game_end()

%%
p6 = [1 2 1 0 0; 1 1 2 0 0;1 1 2 2 0;0 0 0 1 2; 2 2 0 0 0]
t2 = t.init_game(p6);

[finished, player, coor]= t2.check_game_end()

%%
p7 = [1 1 2 0 0; 1 2 1 0 0;1 1 2 1 2;0 0 0 2 1; 2 2 0 0 0]
t2 = t.init_game(p7);

[finished, player, coor]= t2.check_game_end()