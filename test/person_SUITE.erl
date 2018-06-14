-module(person_SUITE).
-include_lib("common_test/include/ct.hrl").

-export([all/0, init_per_suite/1, end_per_suite/1, init_per_testcase/2, end_per_testcase/2]).
-export([login/1]).

all() -> [login].

% groups() -> [{session,
%               [],
%               [{group, clients}, login]},
% 	             ].
init_per_suite(Config) -> 
  net_kernel:start([test1, shortnames]),
  chatroom:start_link(),
  Config.

end_per_suite(_Config) -> 
  ok.

init_per_testcase(login, Config) ->
%     {ok, Host} = inet:gethostname(),
% Node = make_distrib("tests@"++Host, shortnames),
%   io:format("~p",[Node]),
  net_kernel:start([test, shortnames]),
  person:start_link("test1@Wanjuns-MacBook-Pro"),  
  Config.
% init_per_group(_, Config) ->
%     Config.

end_per_testcase(login,_Config) ->
    stop_distrib(),
    ok.


login(_Config) ->
% {ok, Host} = inet:gethostname(),

person:login("please"),
    person:login("hihi"),
    timer:sleep(10),
    ok = person:logout().

 % {"distribute mode test for nodes", timeout, 60, 
 %      fun() ->
 %          {ok, Host} = inet:gethostname(),
 %          Node = make_distrib("tests@"++Host, shortnames),
 %          {ok,_}=person:start_link(Node),
 %          % spawn(list_to_atom("test1@"++Host)),
 %          timer:sleep(100), 
 %          stop_distrib(),
 %          ok
 %      end},


% Nodename = list_to_atom(lists:flatten(io_lib:format(
%     "test@localhost"))),
% {ok, Node} = net_kernel:start([Nodename, shortnames]),
% _ = os:cmd("epmd -daemon"),
 % {ok, Host} = inet:gethostname(),
 %    %       Node = make_distrib("tests@"++Host, shortnames),
 %    [] = os:cmd("epmd -daemon"),
 %    {ok,_Pid}=net_kernel:start(["tests@"++Host, shortnames]),
 %    % {ok, Host} = inet:gethostname(),
 %    % make_distrib("tests@"++Host, shortnames),
    



-spec make_distrib( NodeName::string()|atom(), NodeType::shortnames | longnames) ->
    {ok, ActualNodeName::atom} | {error, Reason::term()}.
make_distrib(NodeName, NodeType) when is_list(NodeName) ->
    make_distrib(erlang:list_to_atom(NodeName), NodeType);
make_distrib(NodeName, NodeType) ->
    case node() of
        'nonode@nohost' -> 
            [] = os:cmd("epmd -daemon"),
            case net_kernel:start([NodeName, NodeType]) of 
                {ok, _Pid} -> node() 
            end;
        CurrNode -> CurrNode
    end.

stop_distrib()->
    net_kernel:stop().



% login_again(_Config) ->
%     person:login("hello"),
% 	timer:sleep(10).


% all_same_owner(_Config) ->
%     [{_,Owner}, {_, Owner}, {_, Owner}] = meeting:get_all_bookings().