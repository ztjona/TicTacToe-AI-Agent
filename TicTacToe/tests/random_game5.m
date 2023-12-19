cc all
o = Options_TicTacToe("board_size",[6 7], "end_by_fast_draw",false);
t = TicTacToe(o);

t.run_game(@(x)random_agent(x), @(x)random_agent(x))