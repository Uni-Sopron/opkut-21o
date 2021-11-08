enum Places;
int: N = card(Places);
array[Places,Places] of int: dist;

array[Places] of var 1..N: ordinal;

include "alldifferent.mzn";
constraint alldifferent(ordinal);

% symmetry breaking
constraint ordinal[Places[1]] = 1;

solve minimize sum(from,to in Places where
    ordinal[to]-ordinal[from] == 1 \/ ordinal[from]-ordinal[to] == N-1
  )
  (dist[from,to]);