int: N;

set of int: D = 0..N-1; % Domain

array[D] of var D: a;

%constraint sum(a) == N;

constraint forall(i in D)(
  %a[i] = sum(j in D where a[j] == i)(1)
  a[i] = sum(j in D)(a[j] == i)
);
