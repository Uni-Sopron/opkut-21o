int: M;
int: N;

set of int: Sources = 1..M;
set of int: Destinations = 1..N;

array[Sources] of int: supply;
array[Destinations] of int: demand;

constraint assert(sum(supply) >= sum(demand), "Not enough total supply.\n");

array[Sources,Destinations] of int: cost;

array[Sources,Destinations] of var 0..max(supply): qty;

solve minimize sum(s in Sources, d in Destinations)(qty[s,d] * cost[s,d]);

constraint forall(i in Sources, j in Destinations)(qty[i,j] >= 0);

constraint sum(qty) = sum(demand);

% cannot transport more from s than its supply
constraint forall(s in Sources)(
  sum(d in Destinations)(qty[s,d]) <= supply[s]
);

% must transport to d as much as its demand
constraint forall(d in Destinations)(
  sum(s in Sources)(qty[s,d]) = demand[d]
);

output [ "   " ];
output [ "D\(d) " | d in Destinations ];
output [ "\n" ];

output [
  if d == 1 then "S\(s) " else "" endif ++
  show_int(2, qty[s,d]) ++ " " ++ if d == N then "\n" else "" endif
  | s in Sources, d in Destinations
];
