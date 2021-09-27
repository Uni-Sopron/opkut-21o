var 1..9: S;
var 0..9: E;
var 0..9: N;
var 0..9: D;
var 1..9: M;
var 0..9: O;
var 0..9: R;
var 0..9: Y;

constraint 1000*S + 100*E + 10*N + D
          +1000*M + 100*O + 10*R + E
  =10000*M+1000*O + 100*N + 10*E + Y;

constraint S != E;
constraint S != N;
constraint S != D;
constraint S != M;
constraint S != O;
constraint S != R;

constraint E != N;
constraint E != D;
constraint E != M;
constraint E != O;
constraint E != R;

constraint N != D;
constraint N != M;
constraint N != O;
constraint N != R;

constraint D != M;
constraint D != O;
constraint D != R;

constraint M != O;
constraint M != R;

constraint O != R;

constraint Y != E;
constraint Y != N;
constraint Y != D;
constraint Y != M;
constraint Y != O;
constraint Y != R;
constraint S != Y;

output [
"  " ++ show(S) ++ show(E) ++ show(N) ++ show(D) ++ "\n" ++
"+ " ++ show(M) ++ show(O) ++ show(R) ++ show(E) ++ "\n" ++
"=" ++ show(M) ++ show(O) ++ show(N) ++ show(E) ++ show(Y)
];
