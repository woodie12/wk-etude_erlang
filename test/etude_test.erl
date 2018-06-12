%%%-------------------------------------------------------------------
%%% @author wan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Jun 2018 3:22 PM
%%%-------------------------------------------------------------------
-module(etude_test).
-author("wan").
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%% test for non supvisior functions

geom_test_() -> [
  ?_assertEqual(15, geom:area(rectangle, 3, 5)),
  ?_assertEqual(8.0, geom:area(triangle, 2, 8)),
  ?_assertError(badarith, 3/0)
  ].

gcd_test_() -> [
  ?_assertEqual(4, dijkstra:gcd(12, 8)),
  ?_assertEqual(7, dijkstra:gcd(14, 21)),
  ?_assertEqual(1, dijkstra:gcd(125, 46))
  ].


stats_test_() -> [
  ?_assertEqual(4, stats:minimum([4,5,6,7])),
  ?_assertEqual(8, stats:minimum([10,9,8,15])),
  ?_assertEqual(10, stats:maximum([2,4,10,9])),
  ?_assertEqual(0.0, stats:mean([0,0,0])),
  ?_assertEqual(1.5, stats:mean([1,2])),
  ?_assertEqual([1,8], stats:range([1,8,3,2,5])),
  ?_assertEqual(3.605551275463989, stats:stdv([7, 2, 9]))
].

teeth_test_() -> [
  ?_assertEqual([9,11,25,26,29], teeth:alert([[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
          [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
          [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
          [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
          [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
          [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
          [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
          [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
          [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
          [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
          [3,2,3,2,3,2]]))
].



-endif.
