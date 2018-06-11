-module(stats).
-export([minimum/1, maximum/1, range/1, mean/1, stdv/1, stdv_sums/2]).

-spec(minimum(list()) -> number()).

minimum(NumberList) ->
  minimum(NumberList, hd(NumberList)).

minimum([], Result) -> Result;

minimum([Head|Tail], Result) ->
  case Head < Result of
    true -> minimum(Tail, Head);
    false -> minimum(Tail, Result)
  end.

-spec(maximum(list()) -> number()).

maximum(NumberList) ->
  maximum(NumberList, hd(NumberList)).

maximum([], Result) -> Result;

maximum([Head|Tail], Result) ->
  case Head > Result of
    true -> maximum(Tail, Head);
    false -> maximum(Tail, Result)
  end.

-spec(range(list()) -> list()).

range(NumberList) -> [minimum(NumberList), maximum(NumberList)].

-spec(mean(list) -> float()).

mean(NumberList) ->
  Sum = lists:foldl(fun(V, A) -> V + A end, 0, NumberList),
  Sum / length(NumberList).

stdv_sums(Value, Accumulator) ->
  [Sum, SumSquares] = Accumulator,
  [Sum + Value, SumSquares + Value * Value].
  
stdv(NumberList) ->
  N = length(NumberList),
  [Sum, SumSquares] = lists:foldl(fun stdv_sums/2, [0, 0], NumberList),
  math:sqrt((N * SumSquares - Sum * Sum) / (N * (N - 1))).
  
