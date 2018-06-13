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
-define(setup(F), {setup, fun start/0, fun stop/1, F}).

 
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TESTS DESCRIPTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
start_stop_test_() ->
    {"The server can be started, stopped and has a registered name",
    {setup,
            fun start/0,
            fun stop/1,
            fun is_registered/1}}.

weather_test_() -> 
    {"check we could get the weather",
      ?setup(fun checkweather/1)
    }. 

%%%%%%%%%%%%%%%%%%%%%%%
%%% SETUP FUNCTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%
start() ->
    {ok, Pid} = weather:start_link(),
    Pid.
 
stop(_) ->
    weather:stop().
 
%%%%%%%%%%%%%%%%%%%%
%%% ACTUAL TESTS %%%
%%%%%%%%%%%%%%%%%%%%
is_registered(Pid) ->
[?_assert(erlang:is_process_alive(Pid))].

checkweather(_) ->
  {ok, Detail} = weather:report("KCMI"),
  % Res = weather:report("XXXX"),
  [?_assertMatch([{location,"Champaign / Urbana, University of Illinois-Willard, IL"}
      ,{observation_time_rfc822,_},{weather,_},
      {temperature_string,_}], Detail)].
%%%%%%%%%%%%%%%%%%%%%%%%
%%% HELPER FUNCTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%



-endif.
