-module(powers).
-export([raise/2]).


-spec(raise(number(), integer()) -> number()).

raise(_, 0) -> 1;

raise(X, N) when N > 0 ->
  raise(X, N, 1);

raise(X, N) when N < 0 -> 1 / raise(X, -N).


raise(_, 0, Accumulator) -> Accumulator;

raise(X, N, Accumulator) ->
  raise(X, N-1, X * Accumulator).
