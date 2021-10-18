int: v=7; int: b=7; int: r=3; int: k=3; int: l=1;

set of int: Rows = 1..v;
set of int: Cols = 1..b;

array[Rows,Cols] of var bool: M;

constraint forall(i in Rows) (
  sum(j in Cols)(M[i,j]) == r
);
constraint forall(j in Cols) (
  sum(i in Rows)(M[i,j]) == k
);
constraint forall(i,j in Rows where i<j) (
  sum(x in Cols)(M[i,x] /\ M[j,x]) == l    % /\ is AND
);
include "globals.mzn";
constraint forall(i,j in Rows where i<j) (
  % row i is lexicographically less than or equal to row j
  lex_lesseq( [M[i,c] | c in Cols], [M[j,c] | c in Cols] )
);
constraint forall(i,j in Cols where i<j) (
  lex_lesseq( [M[n,i] | n in Rows], [M[n,j] | n in Rows] )
);
% global constraint equivalent to the above two
constraint lex2(M);

output [
  show(M[i,j]*1) ++ if j == b then "\n" else " " endif
  | i in Rows, j in Cols
];