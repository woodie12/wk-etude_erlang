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

%% unit test for chatroom 

start_stop_test_() ->
  {"33The server can be started, stopped and has a registered name",
   ?setup(fun is_registered/1)}.


% register_test_() ->
%   [{"A process can be registered and logged in",
%       ?setup(fun logged_in/2)}
%       % {setup, fun person_start/0, fun stop/1, fun logged_in/2}}
%   ].

start() ->
  person:start_link().
  
 
stop(_) ->
  person: terminate(test,[]).

is_registered(Pid) ->
    [?_assert(erlang:is_process_alive(Pid)),
    ?_assertEqual(Pid, whereis(person))].

% logged_in(_,_) ->
%   [
%   ?_assertMatch({value,{{_,_},_}},person:say("hello"))].

-endif.
