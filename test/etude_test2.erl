%%%-------------------------------------------------------------------
%%% @author wan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jun 2018 11:06 AM
%%%-------------------------------------------------------------------
-module(etude_test2).
-author("wan").
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

start_stop_test_() ->
  {"22The server can be started, stopped and has a registered name",
    {setup,
      fun start/0,
      fun stop/1,
      fun is_registered/1}}.

start() ->
  io:format("start function"),
  {ok, Pid} = weather_sup:start_link(),
  Pid.

stop(_) ->
io:format("stop function").

is_registered(Pid) ->
  [?_assert(erlang:is_process_alive(Pid)),
    ?_assertEqual(Pid, whereis(weather_sup))
    % ?_assertMatch({{error, 404}, _},weather:get_weather("XXXX", []))
    ].




-endif.
