-module(life).
-author("Adam A.G. Shamblin <adam.shamblin@zeroecks.com").
-export([
         flip/0,
         init_cell/2,
         init_board/1,
         init_board/2,
         column/2,
         row/1
        ]).


%% Not important that this is an accurate coin flip,
%% just need to initialize starting cells as either on or off.
flip() ->
  math:floor(rand:uniform_real() * 2) == 0.


%% Initialize individual cell
init_cell(X, Y) ->
  {{X, Y}, flip()}.


%% Initialize board 
init_board(Width, Height) ->
  [init_cell(X, Y) || X <- lists:seq(0, Width - 1), Y <- lists:seq(0, Height - 1)].

init_board(Size) ->
  [init_cell(X, Y) || X <- lists:seq(0, Size - 1), Y <- lists:seq(0, Size - 1)].


%% Select a column of the board
column(ColNo, Field) ->
  [Val || {{_, ColNo}, Val} <- Field].


%% Select a row of the board
row(I) ->
  true.
