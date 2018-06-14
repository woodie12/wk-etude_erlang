{node, a, 'a@ferdmbp.local'}.
{init, [a], [{node_start, [{monitor_master, true}]}]}.

{alias, person, "./src/"}.

{suites,[a],person,all}.
