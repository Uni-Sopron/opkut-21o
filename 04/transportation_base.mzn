int: M;
int: N;

set of int: Sources = 1..M;
set of int: Destinations = 1..N;

array[Sources] of int: supply;
array[Destinations] of int: demand;

array[Sources,Destinations] of int: cost;

array[Sources,Destinations] of var int: qty;

solve minimize sum(s in Sources, d in Destinations)(qty[s,d] * cost[s,d]);
