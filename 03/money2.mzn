enum letters = {S, E, N, D, M, O, R, Y};

array [letters] of var 0..9: digits;

constraint forall(i in {S,M})(digits[i] != 0);

constraint       1000*digits[S] + 100*digits[E] + 10*digits[N] + digits[D]
                +1000*digits[M] + 100*digits[O] + 10*digits[R] + digits[E]
=10000*digits[M]+1000*digits[O] + 100*digits[N] + 10*digits[E] + digits[Y];

constraint forall(i,j in letters where i != j)(
  digits[i] != digits[j]
);

output [
"  " ++ show(digits[S]) ++ show(digits[E]) ++ show(digits[N]) ++ show(digits[D]) ++ "\n" ++
"+ " ++ show(digits[M]) ++ show(digits[O]) ++ show(digits[R]) ++ show(digits[E]) ++ "\n" ++
"="  ++ show(digits[M]) ++ show(digits[O]) ++ show(digits[N]) ++ show(digits[E]) ++ show(digits[Y])
];
