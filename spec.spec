{node, a, 'a@ferdmbp.local'}.
{init, [a], [{node_start, [{monitor_master, true}]}]}.

{alias, person, "./person/"}.

 
{logdir, all_nodes, "./logs/"}.
{suites,[a],person,all}.
