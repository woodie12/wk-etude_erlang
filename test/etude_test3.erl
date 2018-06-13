%%%-------------------------------------------------------------------
%%% @author wan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jun 2018 11:06 AM
%%%-------------------------------------------------------------------
-module(etude_test3).
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

log_in_test_() -> 
    {"check we could get the weather",
      ?setup(fun check_login/1)
    }. 

%%%%%%%%%%%%%%%%%%%%%%%
%%% SETUP FUNCTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%
start() ->
    {ok, Pid} = person:start_link(),
    Pid.
 
stop(_) ->
    ok.
 
%%%%%%%%%%%%%%%%%%%%
%%% ACTUAL TESTS %%%
%%%%%%%%%%%%%%%%%%%%
is_registered(Pid) ->
[?_assert(erlang:is_process_alive(Pid))].

check_login(_) ->
  Res = person:login("user"),
  % Res = weather:report("XXXX"),
  [?_assertMatch({login, "user", _}, Res)].
%%%%%%%%%%%%%%%%%%%%%%%%
%%% HELPER FUNCTIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%



-endif.
