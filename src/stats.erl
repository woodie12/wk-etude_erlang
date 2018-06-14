-module(stats).
-export([minimum/1, maximum/1, range/1, mean/1, stdv/1, stdv_sums/2]).


-spec(minimum(list()) -> number()).

minimum(NumberList) ->
  try minimum(NumberList, hd(NumberList)) of
    Answer -> Answer
  catch
    error:Error -> {error, Error}
  end.

minimum([], Result) -> Result;

minimum([Head|Tail], Result) ->
  case Head < Result of
    true -> minimum(Tail, Head);
    false -> minimum(Tail, Result)
  end.


-spec(maximum(list()) -> number()).

maximum(NumberList) ->
  try
    maximum(NumberList, hd(NumberList))
  catch
    error:Error-> {error, Error}
  end.

maximum([], Result) -> Result;

maximum([Head|Tail], Result) ->
  case Head > Result of
    true -> maximum(Tail, Head);
    false -> maximum(Tail, Result)
  end.

-spec(range(list()) -> list()).

range(NumberList) -> [minimum(NumberList), maximum(NumberList)].

%% @doc Return the mean of the list.
-spec(mean(list()) -> float()).

mean(NumberList) ->
  try
    Sum = lists:foldl(fun(V, A) -> V + A end, 0, NumberList),
    Sum / length(NumberList)
  catch
    error:Error -> {error, Error}
  end.

%% @doc Helper function to generate sums and sums of squares
%% when calculating standard deviation.

-spec(stdv_sums(number(),[number()]) -> [number()]).

stdv_sums(Value, Accumulator) ->
  [Sum, SumSquares] = Accumulator,
  [Sum + Value, SumSquares + Value * Value].


-spec(stdv([number()]) -> float()).

stdv(NumberList) ->
  N = length(NumberList),
  try
    [Sum, SumSquares] = lists:foldl(fun stdv_sums/2, [0, 0], NumberList),
    math:sqrt((N * SumSquares - Sum * Sum) / (N * (N - 1)))
  catch
    error:Error -> {error, Error}
  end.
