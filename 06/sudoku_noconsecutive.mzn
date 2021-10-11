set of int: Rows = 0..8;
set of int: Cols = 0..8;

array[Rows,Cols] of 0..9: given;

array[Rows,Cols] of var 1..9: value;

constraint forall(r in Rows, c in Cols where given[r,c] != 0)(
  value[r,c] = given[r,c]
);

constraint forall(r in Rows, c1,c2 in Cols where c1 < c2)(
  value[r,c1] != value[r,c2]
);

constraint forall(r1,r2 in Rows, c1,c2 in Cols where r1 != r2 \/ c1 != c2)(
  if r1 == r2 \/ c1 == c2 then
    value[r1,c1] != value[r2,c2]
  else true
  endif
  /\
  if c1 div 3 == c2 div 3 /\ r1 div 3 == r2 div 3 then
    value[r1,c1] != value[r2,c2]
  else true
  endif
);

constraint forall(r in Rows, c in Cols where c > 0)(
  abs(value[r,c] - value[r,c-1]) != 1
);

constraint forall(r in Rows, c in Cols where r > 0)(
  abs(value[r,c] - value[r-1,c]) != 1
);

output [
  "\(value[r,c]) " ++ if c == 8 then "\n" else "" endif
  | r in Rows, c in Cols
];
