enum Places;
int: N = card(Places);
array[Places,Places] of int: dist;

array[Places] of var Places: next;

include "alldifferent.mzn";
constraint alldifferent(next);

constraint forall(p in Places) (next[p] != p);

constraint forall(p in Places) (next[next[p]] != p);

include "circuit.mzn";
constraint circuit(next);

solve minimize sum(from in Places)
  (dist[from,next[from]]);

output [ show(p) ++ " --> " ++ show(next[p]) ++ "\n" | p in Places];