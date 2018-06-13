-module(person_SUITE).
-include_lib("common_test/include/ct.hrl").

-export([all/0, groups/0, init_per_group/2, end_per_group/2]).

all() -> [{group, session}].

groups() -> [{session,
              [],
              [{group, clients}, all_same_owner]},
	             {clients,
	              [parallel, {repeat, 10}],
	              [carla, mark, dog]}].

init_per_group(session, Config) ->
    person:start_link(),
    Config;
init_per_group(_, Config) ->
    Config.

end_per_group(session, _Config) ->
    ok.
end_per_group(_, _Config) ->
    ok.


login(_Config) ->
	person:login("hungry"),
	timer:sleep(10).

login_again(_Config) ->
    person:login("hungry"),
	timer:sleep(10).


all_same_owner(_Config) ->
    [{_,Owner}, {_, Owner}, {_, Owner}] = meeting:get_all_bookings().